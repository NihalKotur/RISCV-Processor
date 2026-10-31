`timescale 1ns/1ps

module pc_tb;
  logic clk;
  logic n_rst;
  logic [31:0] next_pc;
  logic [31:0] pc;

  pc uut (
    .clk(clk),
    .n_rst(n_rst),
    .next_pc(next_pc),
    .pc(pc)
    );

  always #5 clk = ~clk;

  initial begin
    $dumpfile("sim/pc.vcd");
    $dumpvars(0, pc_tb);

    clk = 0;
    n_rst = 0;
    next_pc = 32'h0000_0000;

    #12;
    n_rst = 1;

    #10 next_pc = 32'h0000_0004;
    #10 next_pc = 32'h0000_0008;
    #10 next_pc = 32'h0000_000C;
    #10 next_pc = 32'h0000_0010;

    #20;
    $display("Simulation Done!");
    $finish;
    end

endmodule
