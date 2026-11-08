`timescale 1ns / 1ps

module controlUnit_TB;

    logic [6:0] opcode;

    logic reg_write;
    logic alu_src;
    logic mem_write;
    logic result_src;
    logic branch;
    logic jump;
    logic [1:0] alu_op;

    controlUnit uut (
        .opcode(opcode),
        .reg_write(reg_write),
        .alu_src(alu_src),
        .mem_write(mem_write),
        .result_src(result_src),
        .branch(branch),
        .jump(jump),
        .alu_op(alu_op)
    );

    initial begin
        $dumpfile("sim/controlUnit.vcd");
        $dumpvars(0, controlUnit_TB);
        #10

        opcode = 7'b0110011;
        #10;
        opcode = 7'b0010011;
        #10;
        opcode = 7'b0000011;
        #10;
        opcode = 7'b0100011;
        #10;
        opcode = 7'b1100011;
        #10;
        $finish;
    end
endmodule