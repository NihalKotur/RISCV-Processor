`timescale 1ns/1ps

module dataMem_TB;
  logic clk;
  logic wr_en;
  logic [31:0] addr;
  logic [31:0] wr_data;
  logic [31:0] rd_data;

  dataMem uut (
    .clk(clk),
    .wr_en(wr_en),
    .addr(addr),
    .wr_data(wr_data),
    .rd_data(rd_data)
    );

  always #5 clk = ~clk;

  initial begin
    $dumpfile("sim/dataMem.vcd");
    $dumpvars(0, dataMem_TB);

    clk = 0;
    wr_en = 0;
    addr = 32'h0;
    wr_data = 32'h0;

    #5;

    @(posedge clk);
    #1
    wr_en = 1;
    addr = 32'h4;
    wr_data = 32'h0101_0101;

    @(posedge clk);
    #1
    wr_en = 0;
    addr = 32'h4;

    @(posedge clk);
    #1
    wr_en = 1;
    addr = 32'h8;
    wr_data = 32'h1010_1010;

    @(posedge clk);
    #1
    wr_en = 0;
    addr = 32'h8;

    @(posedge clk);
    #1
    addr = 32'h4;

    #5;
    $finish;
  end
endmodule
