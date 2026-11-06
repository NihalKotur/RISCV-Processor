`timescale 1ns/1ps

module instrMem_TB;
  logic [31:0] addr;
  logic [31:0] instr;

  instrMem uut (
    .addr(addr),
    .instr(instr)
    );

  initial begin
    $dumpfile("sim/instrMem.vcd");
    $dumpvars(0, instrMem_TB);

    addr = 32'h0;
    #5

    addr = 32'h4;
    #5

    addr = 32'h8;
    #5

    addr = 32'h12;
    #5

    $finish;
  end
endmodule