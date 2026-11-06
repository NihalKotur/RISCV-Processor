`timescale 1ns/1ps

module regFile_TB;
  logic clk;
  logic wr_en;
  logic [4:0] rd_addr_1;
  logic [4:0] rd_addr_2;
  logic [4:0] wr_addr;
  logic [31:0] rd_data_1;
  logic [31:0] rd_data_2;
  logic [31:0] wr_data;

  regFile uut (
    .clk(clk),
    .wr_en(wr_en),
    .rd_addr_1(rd_addr_1),
    .rd_addr_2(rd_addr_2),
    .wr_addr(wr_addr),
    .rd_data_1(rd_data_1),
    .rd_data_2(rd_data_2),
    .wr_data(wr_data)
    );

  always #5 clk = ~clk;

  initial begin
    $dumpfile("sim/regFile.vcd");
    $dumpvars(0, regFile_TB);

    clk = 0;
    wr_en = 0;
    rd_addr_1 = 0;
    rd_addr_2 = 0;
    wr_addr = 0;
    wr_data = 0;

    #5

    @(posedge clk);
    #1
    wr_en = 1;
    wr_addr = 5'd0;
    wr_data = 32'd42;

    @(posedge clk);
    #1
    wr_addr = 5'd1;
    wr_data = 32'd123;

    @(posedge clk);
    #1
    wr_addr = 5'd2;
    wr_data = 32'd456;

    @(posedge clk);
    #1
    wr_en = 0;
    rd_addr_1 = 5'd1;
    rd_addr_2 = 5'd2;

    @(posedge clk);
    #1
    rd_addr_1 = 5'd0;
    rd_addr_2 = 5'd0;

    #5;
    $finish;
    end
endmodule