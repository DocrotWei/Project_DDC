// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
// Date        : Fri Apr  8 15:07:58 2022
// Host        : LAPTOP-Chen running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               e:/EngineeringProject/DDC/DDCProjectFile/project_DDC/project_DDC.srcs/sources_1/ip/mult_gen_d1_int/mult_gen_d1_int_stub.v
// Design      : mult_gen_d1_int
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7vx690tffg1761-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "mult_gen_v12_0_14,Vivado 2018.3" *)
module mult_gen_d1_int(CLK, A, B, CE, SCLR, P)
/* synthesis syn_black_box black_box_pad_pin="CLK,A[13:0],B[15:0],CE,SCLR,P[29:0]" */;
  input CLK;
  input [13:0]A;
  input [15:0]B;
  input CE;
  input SCLR;
  output [29:0]P;
endmodule
