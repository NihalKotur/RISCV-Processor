`timescale 1ns/1ps

module instrmem_tb;
  logic [31:0] addr;
  logic [31:0] instr;

  instrmem uut (
    .addr(addr),
    .instr(instr)
    );

  initial begin
    $dumpfile("sim/instrmem.vcd");
    $dumpvars(0, instrmem_tb);

    addr = 32'h0;
    #5;

    addr = 32'h4;
    #5;

    addr = 32'h8;
    #5;

    addr = 32'h12;
    #5;

    $finish;
  end

endmodule