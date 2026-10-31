module instrmem (
    input logic [31:0] addr,
    output logic [31:0] instr
  );

  logic [31:0] instr_array [255:0];

  initial begin
    $readmemh("memfiles/instrset.mem", instr_array);
  end

  always_comb begin
    instr = instr_array[addr[31:2]];
  end
endmodule
