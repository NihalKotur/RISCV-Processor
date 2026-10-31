module regfile (
    input logic clk,
    input logic wr_en,
    input logic [4:0] rd_adr_1,
    input logic [4:0] rd_adr_2,
    input logic [4:0] wr_adr,
    output logic [31:0] rd_data_1,
    output logic [31:0] rd_data_2,
    input logic [31:0] wr_data
  );

  logic [31:0] reg_array [31:0];
  logic [31:0] rd_data_wire_1, rd_data_wire_2;

  always_comb begin
    rd_data_wire_1 = (rd_adr_1 == 5'd0) ? 32'd0 : reg_array[rd_adr_1];
    rd_data_wire_2 = (rd_adr_2 == 5'd0) ? 32'd0 : reg_array[rd_adr_2];
  end

  assign rd_data_1 = rd_data_wire_1;
  assign rd_data_2 = rd_data_wire_2;

  always_ff @(posedge clk) begin
    if(wr_en & (wr_adr != 5'b0)) begin
      reg_array[wr_adr] <= wr_data;
    end
  end

endmodule
