`timescale 1ns/1ps

module instrReg_TB;
  logic [31:0] addr;
  logic [31:0] instr;

  instrReg uut (
    .addr(addr),
    .instr(instr)
    );

  initial begin
    $dumpfile("sim/instrReg.vcd");
    $dumpvars(0, instrReg_TB);

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