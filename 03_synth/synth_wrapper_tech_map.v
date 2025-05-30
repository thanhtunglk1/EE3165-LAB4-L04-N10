
// Generated by Cadence Genus(TM) Synthesis Solution GENUS15.20 - 15.20-p004_1
// Generated on: May 17 2025 05:37:50

// Verification Directory fv/synth_wrapper 

module counter_4bit(clk, rst_n, sel, out);
  input clk, rst_n, sel;
  output [3:0] out;
  wire clk, rst_n, sel;
  wire [3:0] out;
  wire n_0, n_1, n_2, n_3, n_4, n_5, n_6, n_8;
  wire n_9, n_10, n_11, n_12, n_13, n_14, n_15, n_16;
  wire n_17, n_18, n_19, n_20, n_21, n_22;
  sky130_fd_sc_hd__dfrtp_1 \p_count_reg[3] (.RESET_B (rst_n), .CLK
       (clk), .D (n_22), .Q (out[3]));
  sky130_fd_sc_hd__dfrtp_2 \p_count_reg[2] (.RESET_B (rst_n), .CLK
       (clk), .D (n_21), .Q (out[2]));
  sky130_fd_sc_hd__xnor2_1 g1208(.A (n_13), .B (n_20), .Y (n_22));
  sky130_fd_sc_hd__xnor2_1 g1209(.A (n_17), .B (n_12), .Y (n_21));
  sky130_fd_sc_hd__dfrtp_2 \p_count_reg[1] (.RESET_B (rst_n), .CLK
       (clk), .D (n_18), .Q (out[1]));
  sky130_fd_sc_hd__nand2_2 g1211(.A (n_19), .B (n_15), .Y (n_20));
  sky130_fd_sc_hd__nand3_1 g1212(.A (n_9), .B (n_10), .C (out[0]), .Y
       (n_19));
  sky130_fd_sc_hd__xor2_1 g1213(.A (out[0]), .B (n_11), .X (n_18));
  sky130_fd_sc_hd__nand2_1 g1214(.A (n_16), .B (n_8), .Y (n_17));
  sky130_fd_sc_hd__nand2_1 g1215(.A (n_9), .B (out[0]), .Y (n_16));
  sky130_fd_sc_hd__inv_2 g1216(.A (n_14), .Y (n_15));
  sky130_fd_sc_hd__nand2_1 g1217(.A (n_8), .B (n_6), .Y (n_14));
  sky130_fd_sc_hd__xor2_1 g1218(.A (out[3]), .B (n_0), .X (n_13));
  sky130_fd_sc_hd__xor2_2 g1219(.A (out[2]), .B (n_0), .X (n_12));
  sky130_fd_sc_hd__o2bb2ai_1 g1220(.A1_N (out[1]), .A2_N (n_0), .B1
       (out[1]), .B2 (n_0), .Y (n_11));
  sky130_fd_sc_hd__nand2_1 g1221(.A (n_2), .B (n_3), .Y (n_10));
  sky130_fd_sc_hd__dfrtp_2 \p_count_reg[0] (.RESET_B (rst_n), .CLK
       (clk), .D (n_5), .Q (out[0]));
  sky130_fd_sc_hd__nand2_1 g1223(.A (n_1), .B (out[2]), .Y (n_6));
  sky130_fd_sc_hd__nand2_1 g1224(.A (n_2), .B (n_4), .Y (n_9));
  sky130_fd_sc_hd__nand2_1 g1225(.A (n_1), .B (out[1]), .Y (n_8));
  sky130_fd_sc_hd__inv_1 g1227(.A (out[0]), .Y (n_5));
  sky130_fd_sc_hd__clkinv_1 g1231(.A (out[1]), .Y (n_4));
  sky130_fd_sc_hd__inv_2 g1232(.A (out[2]), .Y (n_3));
  sky130_fd_sc_hd__inv_2 g1233(.A (n_1), .Y (n_2));
  sky130_fd_sc_hd__inv_2 g1234(.A (n_1), .Y (n_0));
  sky130_fd_sc_hd__inv_2 g1235(.A (sel), .Y (n_1));
endmodule

module synth_wrapper(clk, rst_n, sel, count);
  input clk, rst_n, sel;
  output [3:0] count;
  wire clk, rst_n, sel;
  wire [3:0] count;
  wire \count_reg[0]_16 , \count_reg[1]_17 , \count_reg[2]_18 ,
       \count_reg[3]_19 , sel_reg;
  counter_4bit counter(.clk (clk), .rst_n (rst_n), .sel (sel_reg), .out
       ({\count_reg[3]_19 , \count_reg[2]_18 , \count_reg[1]_17 ,
       \count_reg[0]_16 }));
  sky130_fd_sc_hd__dfrtp_1 \count_reg[3] (.RESET_B (rst_n), .CLK (clk),
       .D (\count_reg[3]_19 ), .Q (count[3]));
  sky130_fd_sc_hd__dfrtp_1 \count_reg[2] (.RESET_B (rst_n), .CLK (clk),
       .D (\count_reg[2]_18 ), .Q (count[2]));
  sky130_fd_sc_hd__dfrtp_1 \count_reg[0] (.RESET_B (rst_n), .CLK (clk),
       .D (\count_reg[0]_16 ), .Q (count[0]));
  sky130_fd_sc_hd__dfrtp_1 \count_reg[1] (.RESET_B (rst_n), .CLK (clk),
       .D (\count_reg[1]_17 ), .Q (count[1]));
  sky130_fd_sc_hd__dfrtp_1 sel_reg_reg(.RESET_B (rst_n), .CLK (clk), .D
       (sel), .Q (sel_reg));
endmodule

