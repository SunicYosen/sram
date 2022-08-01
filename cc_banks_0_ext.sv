module cc_banks_0_ext
 import mem_pkg::*; (
  input  [12:0] RW0_addr,
  input         RW0_clk,
  input  [63:0] RW0_wdata,
  output [63:0] RW0_rdata,
  input         RW0_en,
  input         RW0_wmode,
  input mem_ctrl_sasrl_1p_t mem_ctrl_sasrl
);

logic [63:0] RW0_rdata_t[0:3];
logic [1:0] rdata_sel;


// output select
always_ff@(posedge RW0_clk) begin
    rdata_sel <= RW0_addr[12:11];
end

assign RW0_rdata = RW0_rdata_t[rdata_sel];

// 
sram_2048x64_sp sram_2048x64_sp_inst0(
    .CLK(RW0_clk), 
    .WE(RW0_wmode&& (RW0_addr[12:11] == 2'b0)), 
    .ME(RW0_en), 
    .ADR(RW0_addr[10:0]), 
    .Q(RW0_rdata_t[0]), 
    .D(RW0_wdata)
);

sram_2048x64_sp sram_2048x64_sp_inst1(
    .CLK(RW0_clk), 
    .WE(RW0_wmode&& (RW0_addr[12:11] == 2'b01)), 
    .ME(RW0_en), 
    .ADR(RW0_addr[10:0]), 
    .Q(RW0_rdata_t[1]), 
    .D(RW0_wdata)
);

sram_2048x64_sp sram_2048x64_sp_inst2(
    .CLK(RW0_clk), 
    .WE(RW0_wmode&& (RW0_addr[12:11] == 2'b10)), 
    .ME(RW0_en), 
    .ADR(RW0_addr[10:0]), 
    .Q(RW0_rdata_t[2]), 
    .D(RW0_wdata)
);

sram_2048x64_sp sram_2048x64_sp_inst3(
    .CLK(RW0_clk), 
    .WE(RW0_wmode&& (RW0_addr[12:11] == 2'b3)), 
    .ME(RW0_en), 
    .ADR(RW0_addr[10:0]), 
    .Q(RW0_rdata_t[3]), 
    .D(RW0_wdata)
);

endmodule