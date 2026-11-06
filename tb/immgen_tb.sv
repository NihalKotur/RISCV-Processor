`timescale 1ns/1ps

module immGen_TB;
  logic [31:0] instr;
  logic [31:0] imm_out;

  immGen uut (
    .instr(instr),
    .imm_out(imm_out)
    );

  initial begin
    $dumpfile("sim/immGen.vcd");
    $dumpvars(0, immGen_TB);

    instr = 32'h0000_0013;
    #5

     instr = 32'h0010_0293;
    #5

     instr = 32'h0022_8293;
    #5

     $finish;
  end
endmodule
