// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
// Date        : Thu Mar 31 21:46:44 2022
// Host        : LAPTOP-Chen running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               e:/EngineeringProject/DDC/DDCProjectFile/project_DDC/project_DDC.srcs/sources_1/ip/dds_compiler_0/dds_compiler_0_stub.v
// Design      : dds_compiler_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7vx690tffg1761-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "dds_compiler_v6_0_17,Vivado 2018.3" *)
module dds_compiler_0(aclk, m_axis_data_tvalid, m_axis_data_tdata, 
  m_axis_phase_tvalid, m_axis_phase_tdata)
/* synthesis syn_black_box black_box_pad_pin="aclk,m_axis_data_tvalid,m_axis_data_tdata[31:0],m_axis_phase_tvalid,m_axis_phase_tdata[15:0]" */;
  input aclk;
  output m_axis_data_tvalid;
  output [31:0]m_axis_data_tdata;
  output m_axis_phase_tvalid;
  output [15:0]m_axis_phase_tdata;
endmodule
