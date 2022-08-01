/*
 * sram_2048x64_1p
*/

module sasrlslg4u1p2048x64m4b2w0c1p0d0s3rm4mg0rw00_wrapper #(
    parameter ADDR_BITS=11,
    parameter DATA_WIDTH=64,
    parameter MEM_DEPTH=2048
)(
    input             CLK,
    input             ME,     // memory enable
    input             WE,     // write enable
    input      [ ADDR_BITS-1 : 0] ADR, // addr
    input      [ DATA_WIDTH-1: 0] D,  // data in
    output     [ DATA_WIDTH-1: 0] Q,  // data out
    output     [ DATA_WIDTH-1: 0] QP, // no use
    output            SO_Q_L,
    output            SO_Q_H,
    output            SO_D_L,
    output            SO_D_H,
    output            SO_CNTR,
    input             CRE1,
    input             CRE2,
    input      [4:0]  FCA1,
    input      [4:0]  FCA2,
    input             TEST1,
    input             TEST_RNM,
    input             RME,
    input      [3:0]  RM,
    input             PIPEME,
    input             SI_Q_L,
    input             SI_Q_H,
    input             SI_D_L,
    input             SI_D_H,
    input             SE_Q,
    input             SE_IN,
    input             SI_CNTR,
    input             DFTCLKEN,
    input             DFTMASK,
    input             LS,
    input             BC0,
    input             BC1,
    input             BC2,
    input             RREN1,
    input      [6:0]  FRA1,
    input             RREN2,
    input      [6:0]  FRA2
);

reg [DATA_WIDTH-1:0] mem [0: MEM_DEPTH-1];  // memory
reg [DATA_WIDTH-1:0] dout;

wire                 clk;
wire [DATA_WIDTH-1:0]din;

assign Q       = dout;
assign QP      = {DATA_WIDTH{1'b0}};
assign SO_Q_L  = 1'b0;
assign SO_Q_H  = 1'b0;
assign SO_D_L  = 1'b0;
assign SO_D_H  = 1'b0;
assign SO_CNTR = 1'b0;

assign clk     = CLK;
assign din     = D;

always @(posedge clk) begin
    if(ME & WE) begin
        mem[ADR] = din;
    end
end

always @(posedge clk) begin
	if(ME && (!WE)) begin
        dout <= mem[ADR];
    end
end

endmodule