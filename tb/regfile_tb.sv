`timescale 1ns/1ps

module regfile_tb;
  logic clk;
  logic wr_en;
  logic [4:0] rd_adr_1;
  logic [4:0] rd_adr_2;
  logic [4:0] wr_adr;
  logic [31:0] rd_data_1;
  logic [31:0] rd_data_2;
  logic [31:0] wr_data;

  regfile uut (
    .clk(clk),
    .wr_en(wr_en),
    .rd_adr_1(rd_adr_1),
    .rd_adr_2(rd_adr_2),
    .wr_adr(wr_adr),
    .rd_data_1(rd_data_1),
    .rd_data_2(rd_data_2),
    .wr_data(wr_data)
    );

  always #5 clk = ~clk;

  initial begin
    $dumpfile("sim/regfile.vcd");
    $dumpvars(0, regfile_tb);

    clk = 0;
    wr_en = 0;
    rd_adr_1 = 0;
    rd_adr_2 = 0;
    wr_adr = 0;
    wr_data = 0;

    @(negedge clk);
    #9
    wr_en = 1;
    wr_adr = 5'd0;
    wr_data = 32'd42;

    @(negedge clk);
    #9
    wr_adr = 5'd1;
    wr_data = 32'd123;

    @(negedge clk);
    #9
    wr_adr = 5'd2;
    wr_data = 32'd456;

    @(negedge clk);
    #9
    wr_en = 0;
    rd_adr_1 = 5'd1;
    rd_adr_2 = 5'd2;

    @(negedge clk);
    #9
    rd_adr_1 = 5'd0;
    rd_adr_2 = 5'd0;

    #20;
    $finish;
    end

endmodule