`timescale 1ns/1ps

module ControlUnit_tb;

  // Inputs
  reg [31:0] instruction;

  // Outputs
  reg [6:0] opcode;
  reg [2:0] funct3;
  reg [2:0] aluOp;
  reg memRead, memWrite, regWrite, branch, jal, jalr, aluSrc, memToReg;
  reg [4:0] regDst;
  reg [4:0] rd;
  // Instantiate ControlUnit module
  ControlUnit CU (
    .instruction(instruction),
    .opcode(opcode),
    .funct3(funct3),
    .aluOp(aluOp),
    .memRead(memRead),
    .memWrite(memWrite),
    .regWrite(regWrite),
    .branch(branch),
    .jal(jal),
    .jalr(jalr),
    .aluSrc(aluSrc),
    .memToReg(memToReg),
    .regDst(regDst),
    .rd(rd)
  );

  // Initialize signals
  initial begin
    $dumpfile("ControlUnit_tb.vcd");
    $dumpvars(0, ControlUnit_tb);

    // Test OR instruction (you can add more tests)
    instruction = 32'h000007B3; // OR rd, rs1, rs2
    #10;

    $stop;
  end

endmodule
