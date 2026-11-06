module topLayer (
    input logic clk,
    input logic rst,
    output logic [31:0] pc,
    output logic [31:0] alu_result,

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
        .wr_data(DO THIS DONT FORGET THIS),
        .rd_data_1(reg_rd_data_1),
        .rd_data_2(reg_rd_data_2),
    );

    immGen immGen_1 (
        .instr(instr),
        .imm_out(imm_out)
    );

    // ALU and dataMem stuff pending

    assign pc = pc_current;
    assign pc_next = pc_current + 32'd4;

endmodule