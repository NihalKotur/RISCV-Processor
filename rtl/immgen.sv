module immgen (
    input logic [32:0] instr,
    output logic [32:0] imm_ext
  );

  logic [6:0] opcode;
  assign opcode = instr[6:0];

  always_comb
  begin
    unique case (opcode)
        7'b0010011, 7'b0000011, 7'b1100111: begin
            imm_ext = {{20{instr[31]}}, instr[31:20]};
        end

        7'b0100011: begin
            imm_ext = {{20{instr[31]}}, instr[31:25], instr[11:7]};
        end

        7'b1100011: begin
            imm_ext = {{19{instr[31]}}, instr[31], instr[7], instr[30:25], instr[11:8], 1'b0};
        end

        7'b1100011: begin
            imm_ext = {{19{instr[31]}}, instr[31], instr[7], instr[30:25], instr[11:8], 1'b0};
        end

        7'b1101111: begin
            imm_ext = {{11{instr[31]}}, instr[31], instr[19:12], instr[20], instr[30:21], 1'b0};
        end

        default: begin
            imm_ext = 32'b0;
        end
    endcase
    end

endmodule
