`timescale 1ns / 1ps

module alu_tb;
  logic [31:0] a;
  logic [31:0] b;
  logic [3:0] operation;
  logic [31:0] result;
  logic is_zero;

  alu uut (
    .a(a),
    .b(b),
    .operation(operation),
    .result(result),
    .is_zero(is_zero)
    );

  initial begin
    $dumpfile("sim/alu.vcd");
    $dumpvars(0, alu_tb);

    // Test 1: Addition
    a = 32'd5;
    b = 32'd3;
    operation = 4'b0000;
    #10;
    // Expected: 8

    // Test 2: Subtraction
    a = 32'd10;
    b = 32'd10;
    operation = 4'b0001;
    #10;
    // Expected: 0 (is_zero = 1)

    // Test 3: Bitwise AND
    a = 32'hF0F0;
    b = 32'h0FF0;
    operation = 4'b0010;
    #10;
    // Expected: 240

    // Test 4: Shift Left Logical
    a = 32'd1;
    b = 32'd4;
    operation = 4'b0101;
    #10;
    // Expected: 16

    // Test 5: Less Than Signed
    a = -32'd5;
    b = 32'd3;
    operation = 4'b1000;
    #10;
    // Expected: 1

    $finish;
  end

endmodule
