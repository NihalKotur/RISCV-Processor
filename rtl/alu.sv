module alu (
    input logic [31:0] a,
    input logic [31:0] b,
    input logic [3:0] operation,
    output logic [31:0] result,
    output logic is_zero
  );

  localparam ALU_ADD  = 4'b0000;
  localparam ALU_SUB  = 4'b0001;
  localparam ALU_AND  = 4'b0010;
  localparam ALU_OR   = 4'b0011;
  localparam ALU_XOR  = 4'b0100;
  localparam ALU_SLL  = 4'b0101;
  localparam ALU_SRL  = 4'b0110;
  localparam ALU_SRA  = 4'b0111;
  localparam ALU_LTS  = 4'b1000;
  localparam ALU_LTUS = 4'b1001;

  always_comb begin
    case (operation)
      ALU_ADD: result = a + b;
      ALU_SUB: result = a - b;
      ALU_AND: result = a & b;
      ALU_OR: result = a | b;
      ALU_XOR: result = a ^ b;
      ALU_SLL: result = a << b[4:0];
      ALU_SRL: result = a >> b[4:0];
      ALU_SRA: result = $signed(a) >>> b[4:0];
      ALU_LTS: result = ($signed(a) < $signed(b)) ? 32'd1 : 32'd0;
      ALU_LTUS: result = (a < b) ? 32'd1 : 32'd0;
      default: result = 32'd0;
    endcase
  end

  assign is_zero = (result == 32'd0);

endmodule
