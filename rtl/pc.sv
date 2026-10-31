module pc (
    input logic clk,
    input logic n_rst,
    input logic [31:0] next_pc,
    output logic [31:0] pc
  );

  always @(posedge clk or negedge n_rst) begin
    if (!n_rst) begin
      pc <= 32'h0000_0000;
    end
    else begin
      pc <= next_pc;
    end
  end

endmodule