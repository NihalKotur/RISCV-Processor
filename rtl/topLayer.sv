module topLayer (
    input logic clk,
    input logic rst,
    output logic [31:0] pc,
    output logic [31:0] alu_result
);
    // pc/instrMem stuff
    logic [31:0] pc_current;
    logic [31:0] pc_next;
    logic [31:0] instr;

    // controlUnit out
    logic reg_wr_en;
    logic alu_src;
    logic mem_wr_en;
    logic result_src;
    logic [1:0] alu_op;
    logic branch;
    logic jump;

    // regFile out
    logic [31:0] reg_rd_data_1;
    logic [31:0] reg_rd_data_2;

    // immGen out
    logic [31:0] imm_out;

    // alu stuff
    logic [31:0] alu_operand_b;
    logic [31:0] mem_rd_data;
    logic [31:0] reg_wr_data;
    logic [3:0] alu_operation;
    logic alu_zero;

    // Branch/Jump wires
    logic [31:0] pc_target;
    logic branch_taken;

    // ----------Fetch----------
    pc pc_i (
        .clk(clk),
        .rst(rst),
        .next_pc(pc_next),
        .pc(pc_current)
    );

    instrMem instrMem_i (
        .addr(pc_current),
        .instr(instr)
    );

    // ----------Decode----------
    controlUnit controlUnit_i (
        .opcode(instr[6:0]),
        .reg_write(reg_wr_en),
        .alu_src(alu_src),
        .mem_write(mem_wr_en),
        .result_src(result_src),
        .alu_op(alu_op),
        .branch(branch),
        .jump(jump)
    );

    regFile regFile_i (
        .clk(clk),
        .wr_en(reg_wr_en),
        .rd_addr_1(instr[19:15]),
        .rd_addr_2(instr[24:20]),
        .wr_addr(instr[11:7]),
        .wr_data(reg_wr_data),
        .rd_data_1(reg_rd_data_1),
        .rd_data_2(reg_rd_data_2)
    );

    immGen immGen_1 (
        .instr(instr),
        .imm_out(imm_out)
    );

    // ----------Execute----------
    assign alu_operand_b = alu_src ? imm_out : reg_rd_data_2;

    // ALU Decoder logic
    always_comb begin
        case (alu_op)
            2'b00: alu_operation = 4'b0000;
            2'b01: alu_operation = 4'b0001;
            2'b10: begin
                case (instr[14:12])
                    3'b000: alu_operation = (instr[30] && (instr[6:0] == 7'b0110011)) ? 4'b0001 : 4'b0000;
                    3'b111: alu_operation = 4'b0010; // AND
                    3'b110: alu_operation = 4'b0011; // OR
                    3'b100: alu_operation = 4'b0100; // XOR
                    3'b001: alu_operation = 4'b0101; // SLL
                    3'b101: alu_operation = instr[30] ? 4'b0111 : 4'b0110; // SRA / SRL
                    3'b010: alu_operation = 4'b1000; // SLT
                    3'b011: alu_operation = 4'b1001; // SLTU
                    default: alu_operation = 4'b0000;
                endcase
            end
            default: alu_operation = 4'b0000;
        endcase
    end

    alu alu_i (
        .a(reg_rd_data_1),
        .b(alu_operand_b),
        .operation(alu_operation),
        .result(alu_result),
        .is_zero(alu_zero)
    );

    // ----------Memory----------
    dataMem dataMem_i (
        .clk(clk),
        .wr_en(mem_wr_en),
        .addr(alu_result),
        .wr_data(reg_rd_data_2),
        .rd_data(mem_rd_data)
    );

    // ----------Writeback MUX----------
    assign reg_wr_data = result_src ? mem_rd_data : alu_result;

    // ----------Branch/Jump Logic----------
    assign pc_target = pc_current + imm_out;
    assign branch_taken = branch & alu_zero;

    assign pc = pc_current;
    assign pc_next = (jump | branch_taken) ? pc_target : (pc_current + 32'd4);

endmodule