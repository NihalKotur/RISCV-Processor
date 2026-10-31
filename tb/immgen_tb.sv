`timescale 1ns/1ps

module immgen_tb;
  logic [31:0] instr;
  logic [31:0] imm_ext;

  immgen uut (
    .instr(instr),
    .imm_ext(imm_ext)
    );

  initial begin
    $dumpfile("sim/immgen.vcd");
    $dumpvars(0, immgen_tb);

    instr = 32'h0000_0013;
    #5

     instr = 32'h0010_0293;
    #5

     instr = 32'h0022_8293;
    #5

     $finish;
  end
endmodule
