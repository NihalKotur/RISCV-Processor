module instr_file (
    input logic [31:0] instr_addr,
    output logic [31:0] instr
  );

  logic [31:0] instr_array [255:0];

  initial begin
    $readmemh("instrset.mem", instr_array);
  end

  always_comb begin
    instr = instr_array[instr_addr[31:2]];
  end

endmodule
