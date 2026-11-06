module dataMem (
    input logic clk,
    input logic wr_en,
    input logic [31:0] addr,
    input logic [31:0] wr_data,
    output logic [31:0] rd_data
  );

  logic [31:0] data_array [255:0];

  assign rd_data = data_array[addr[31:2]];

  always_ff @(posedge clk) begin
    if (wr_en) begin
      data_array[addr[31:2]] <= wr_data;
    end
  end
endmodule
