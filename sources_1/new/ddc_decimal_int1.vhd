----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2022/04/08 14:59:11
-- Design Name: 
-- Module Name: ddc_decimal_int1 - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE ieee.numeric_std.ALL;
USE std.textio.ALL;
USE ieee.std_logic_textio.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_SIGNED.ALL;
LIBRARY UNISIM;
USE UNISIM.VComponents.ALL;

ENTITY ddc_decimal_int1 IS
  PORT (
    --------------------时钟---------------------------
    I_clk   : IN std_logic;
    I_rst_n : IN std_logic;

    ---------------------第一级抽取输出信号------------------------
    I_data_d0_I0 : IN std_logic_vector(12 DOWNTO 0);
    I_data_d0_I1 : IN std_logic_vector(12 DOWNTO 0);
    I_data_d0_I2 : IN std_logic_vector(12 DOWNTO 0);
    I_data_d0_I3 : IN std_logic_vector(12 DOWNTO 0);
    I_data_d0_I4 : IN std_logic_vector(12 DOWNTO 0);
    I_data_d0_I5 : IN std_logic_vector(12 DOWNTO 0);
    I_data_d0_I6 : IN std_logic_vector(12 DOWNTO 0);
    I_data_d0_I7 : IN std_logic_vector(12 DOWNTO 0);

    I_data_d0_Q0 : IN std_logic_vector(12 DOWNTO 0);
    I_data_d0_Q1 : IN std_logic_vector(12 DOWNTO 0);
    I_data_d0_Q2 : IN std_logic_vector(12 DOWNTO 0);
    I_data_d0_Q3 : IN std_logic_vector(12 DOWNTO 0);
    I_data_d0_Q4 : IN std_logic_vector(12 DOWNTO 0);
    I_data_d0_Q5 : IN std_logic_vector(12 DOWNTO 0);
    I_data_d0_Q6 : IN std_logic_vector(12 DOWNTO 0);
    I_data_d0_Q7 : IN std_logic_vector(12 DOWNTO 0);
    ---------------------第二级抽取输出信号------------------------

    O_data_d1_I0 : OUT std_logic_vector(15 DOWNTO 0);
    O_data_d1_I1 : OUT std_logic_vector(15 DOWNTO 0);
    O_data_d1_I2 : OUT std_logic_vector(15 DOWNTO 0);
    O_data_d1_I3 : OUT std_logic_vector(15 DOWNTO 0);

    O_data_d1_Q0 : OUT std_logic_vector(15 DOWNTO 0);
    O_data_d1_Q1 : OUT std_logic_vector(15 DOWNTO 0);
    O_data_d1_Q2 : OUT std_logic_vector(15 DOWNTO 0);
    O_data_d1_Q3 : OUT std_logic_vector(15 DOWNTO 0)

  );
END ddc_decimal_int1;

ARCHITECTURE Behavioral OF ddc_decimal_int1 IS

  COMPONENT mult_gen_d1_int
    PORT (
      CLK  : IN std_logic;
      A    : IN std_logic_vector(13 DOWNTO 0);
      B    : IN std_logic_vector(15 DOWNTO 0);
      CE   : IN std_logic;
      SCLR : IN std_logic;
      P    : OUT std_logic_vector(29 DOWNTO 0)
    );
  END COMPONENT;

  CONSTANT HB_COE0 : std_logic_vector(15 DOWNTO 0) := conv_std_logic_vector(-112, 16);
  CONSTANT HB_COE2 : std_logic_vector(15 DOWNTO 0) := conv_std_logic_vector(647, 16);
  CONSTANT HB_COE4 : std_logic_vector(15 DOWNTO 0) := conv_std_logic_vector(-2336, 16);
  CONSTANT HB_COE6 : std_logic_vector(15 DOWNTO 0) := conv_std_logic_vector(9991, 16);
  CONSTANT HB_COE7 : std_logic_vector(15 DOWNTO 0) := conv_std_logic_vector(16384, 16);

  --------------------------输入信号流水----------------------------
  SIGNAL S_data_d0_I0_0 : std_logic_vector(12 DOWNTO 0);
  SIGNAL S_data_d0_I1_0 : std_logic_vector(12 DOWNTO 0);
  SIGNAL S_data_d0_I2_0 : std_logic_vector(12 DOWNTO 0);
  SIGNAL S_data_d0_I3_0 : std_logic_vector(12 DOWNTO 0);
  SIGNAL S_data_d0_I4_0 : std_logic_vector(12 DOWNTO 0);
  SIGNAL S_data_d0_I5_0 : std_logic_vector(12 DOWNTO 0);
  SIGNAL S_data_d0_I6_0 : std_logic_vector(12 DOWNTO 0);
  SIGNAL S_data_d0_I7_0 : std_logic_vector(12 DOWNTO 0);
  SIGNAL S_data_d0_Q0_0 : std_logic_vector(12 DOWNTO 0);
  SIGNAL S_data_d0_Q1_0 : std_logic_vector(12 DOWNTO 0);
  SIGNAL S_data_d0_Q2_0 : std_logic_vector(12 DOWNTO 0);
  SIGNAL S_data_d0_Q3_0 : std_logic_vector(12 DOWNTO 0);
  SIGNAL S_data_d0_Q4_0 : std_logic_vector(12 DOWNTO 0);
  SIGNAL S_data_d0_Q5_0 : std_logic_vector(12 DOWNTO 0);
  SIGNAL S_data_d0_Q6_0 : std_logic_vector(12 DOWNTO 0);
  SIGNAL S_data_d0_Q7_0 : std_logic_vector(12 DOWNTO 0);

  SIGNAL S_data_d0_I0_1 : std_logic_vector(12 DOWNTO 0);
  SIGNAL S_data_d0_I1_1 : std_logic_vector(12 DOWNTO 0);
  SIGNAL S_data_d0_I2_1 : std_logic_vector(12 DOWNTO 0);
  SIGNAL S_data_d0_I3_1 : std_logic_vector(12 DOWNTO 0);
  SIGNAL S_data_d0_I4_1 : std_logic_vector(12 DOWNTO 0);
  SIGNAL S_data_d0_I5_1 : std_logic_vector(12 DOWNTO 0);
  SIGNAL S_data_d0_I6_1 : std_logic_vector(12 DOWNTO 0);
  SIGNAL S_data_d0_I7_1 : std_logic_vector(12 DOWNTO 0);
  SIGNAL S_data_d0_Q0_1 : std_logic_vector(12 DOWNTO 0);
  SIGNAL S_data_d0_Q1_1 : std_logic_vector(12 DOWNTO 0);
  SIGNAL S_data_d0_Q2_1 : std_logic_vector(12 DOWNTO 0);
  SIGNAL S_data_d0_Q3_1 : std_logic_vector(12 DOWNTO 0);
  SIGNAL S_data_d0_Q4_1 : std_logic_vector(12 DOWNTO 0);
  SIGNAL S_data_d0_Q5_1 : std_logic_vector(12 DOWNTO 0);
  SIGNAL S_data_d0_Q6_1 : std_logic_vector(12 DOWNTO 0);
  SIGNAL S_data_d0_Q7_1 : std_logic_vector(12 DOWNTO 0);
  -----------------------------------I0路的流水寄存器---------------------------------

  --------------------------------第一级流水参数-----------------------------------
  SIGNAL S_data_pipel0_I0_0 : std_logic_vector(13 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel0_I0_1 : std_logic_vector(13 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel0_I0_2 : std_logic_vector(13 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel0_I0_3 : std_logic_vector(13 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel0_I0_4 : std_logic_vector(13 DOWNTO 0) := (OTHERS => '0');

  --------------------------------第二级流水参数-----------------------------------
  SIGNAL S_data_pipel1_I0_0 : std_logic_vector(29 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel1_I0_1 : std_logic_vector(29 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel1_I0_2 : std_logic_vector(29 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel1_I0_3 : std_logic_vector(29 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel1_I0_4 : std_logic_vector(29 DOWNTO 0) := (OTHERS => '0');
  --------------------------------第三级流水参数-----------------------------------
  SIGNAL S_data_pipel2_I0_0 : std_logic_vector(29 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel2_I0_1 : std_logic_vector(29 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel2_I0_2 : std_logic_vector(29 DOWNTO 0) := (OTHERS => '0');

  --------------------------------第四级流水参数-----------------------------------
  SIGNAL S_data_pipel3_I0_0 : std_logic_vector(30 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel3_I0_1 : std_logic_vector(30 DOWNTO 0) := (OTHERS => '0');

  --------------------------------第五级流水参数-----------------------------------
  SIGNAL S_data_pipel4_I0 : std_logic_vector(31 DOWNTO 0);
  -----------------------------------I1路的流水寄存器---------------------------------

  --------------------------------第一级流水参数-----------------------------------
  SIGNAL S_data_pipel0_I1_0 : std_logic_vector(13 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel0_I1_1 : std_logic_vector(13 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel0_I1_2 : std_logic_vector(13 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel0_I1_3 : std_logic_vector(13 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel0_I1_4 : std_logic_vector(13 DOWNTO 0) := (OTHERS => '0');

  --------------------------------第二级流水参数-----------------------------------
  SIGNAL S_data_pipel1_I1_0 : std_logic_vector(29 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel1_I1_1 : std_logic_vector(29 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel1_I1_2 : std_logic_vector(29 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel1_I1_3 : std_logic_vector(29 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel1_I1_4 : std_logic_vector(29 DOWNTO 0) := (OTHERS => '0');
  --------------------------------第三级流水参数-----------------------------------
  SIGNAL S_data_pipel2_I1_0 : std_logic_vector(29 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel2_I1_1 : std_logic_vector(29 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel2_I1_2 : std_logic_vector(29 DOWNTO 0) := (OTHERS => '0');

  --------------------------------第四级流水参数-----------------------------------
  SIGNAL S_data_pipel3_I1_0 : std_logic_vector(30 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel3_I1_1 : std_logic_vector(30 DOWNTO 0) := (OTHERS => '0');

  --------------------------------第五级流水参数-----------------------------------
  SIGNAL S_data_pipel4_I1 : std_logic_vector(31 DOWNTO 0);
  -----------------------------------I2路的流水寄存器---------------------------------

  --------------------------------第一级流水参数-----------------------------------
  SIGNAL S_data_pipel0_I2_0 : std_logic_vector(13 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel0_I2_1 : std_logic_vector(13 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel0_I2_2 : std_logic_vector(13 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel0_I2_3 : std_logic_vector(13 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel0_I2_4 : std_logic_vector(13 DOWNTO 0) := (OTHERS => '0');

  --------------------------------第二级流水参数-----------------------------------
  SIGNAL S_data_pipel1_I2_0 : std_logic_vector(29 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel1_I2_1 : std_logic_vector(29 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel1_I2_2 : std_logic_vector(29 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel1_I2_3 : std_logic_vector(29 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel1_I2_4 : std_logic_vector(29 DOWNTO 0) := (OTHERS => '0');
  --------------------------------第三级流水参数-----------------------------------
  SIGNAL S_data_pipel2_I2_0 : std_logic_vector(29 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel2_I2_1 : std_logic_vector(29 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel2_I2_2 : std_logic_vector(29 DOWNTO 0) := (OTHERS => '0');

  --------------------------------第四级流水参数-----------------------------------
  SIGNAL S_data_pipel3_I2_0 : std_logic_vector(30 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel3_I2_1 : std_logic_vector(30 DOWNTO 0) := (OTHERS => '0');

  --------------------------------第五级流水参数-----------------------------------
  SIGNAL S_data_pipel4_I2 : std_logic_vector(31 DOWNTO 0);
  -----------------------------------I3路的流水寄存器---------------------------------

  --------------------------------第一级流水参数-----------------------------------
  SIGNAL S_data_pipel0_I3_0 : std_logic_vector(13 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel0_I3_1 : std_logic_vector(13 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel0_I3_2 : std_logic_vector(13 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel0_I3_3 : std_logic_vector(13 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel0_I3_4 : std_logic_vector(13 DOWNTO 0) := (OTHERS => '0');

  --------------------------------第二级流水参数-----------------------------------
  SIGNAL S_data_pipel1_I3_0 : std_logic_vector(29 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel1_I3_1 : std_logic_vector(29 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel1_I3_2 : std_logic_vector(29 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel1_I3_3 : std_logic_vector(29 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel1_I3_4 : std_logic_vector(29 DOWNTO 0) := (OTHERS => '0');
  --------------------------------第三级流水参数-----------------------------------
  SIGNAL S_data_pipel2_I3_0 : std_logic_vector(29 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel2_I3_1 : std_logic_vector(29 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel2_I3_2 : std_logic_vector(29 DOWNTO 0) := (OTHERS => '0');

  --------------------------------第四级流水参数-----------------------------------
  SIGNAL S_data_pipel3_I3_0 : std_logic_vector(30 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel3_I3_1 : std_logic_vector(30 DOWNTO 0) := (OTHERS => '0');

  --------------------------------第五级流水参数-----------------------------------
  SIGNAL S_data_pipel4_I3 : std_logic_vector(31 DOWNTO 0);



    -----------------------------------Q0路的流水寄存器---------------------------------

  --------------------------------第一级流水参数-----------------------------------
  SIGNAL S_data_pipel0_Q0_0 : std_logic_vector(13 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel0_Q0_1 : std_logic_vector(13 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel0_Q0_2 : std_logic_vector(13 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel0_Q0_3 : std_logic_vector(13 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel0_Q0_4 : std_logic_vector(13 DOWNTO 0) := (OTHERS => '0');

  --------------------------------第二级流水参数-----------------------------------
  SIGNAL S_data_pipel1_Q0_0 : std_logic_vector(29 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel1_Q0_1 : std_logic_vector(29 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel1_Q0_2 : std_logic_vector(29 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel1_Q0_3 : std_logic_vector(29 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel1_Q0_4 : std_logic_vector(29 DOWNTO 0) := (OTHERS => '0');
  --------------------------------第三级流水参数-----------------------------------
  SIGNAL S_data_pipel2_Q0_0 : std_logic_vector(29 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel2_Q0_1 : std_logic_vector(29 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel2_Q0_2 : std_logic_vector(29 DOWNTO 0) := (OTHERS => '0');

  --------------------------------第四级流水参数-----------------------------------
  SIGNAL S_data_pipel3_Q0_0 : std_logic_vector(30 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel3_Q0_1 : std_logic_vector(30 DOWNTO 0) := (OTHERS => '0');

  --------------------------------第五级流水参数-----------------------------------
  SIGNAL S_data_pipel4_Q0 : std_logic_vector(31 DOWNTO 0);
  -----------------------------------Q1路的流水寄存器---------------------------------

  --------------------------------第一级流水参数-----------------------------------
  SIGNAL S_data_pipel0_Q1_0 : std_logic_vector(13 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel0_Q1_1 : std_logic_vector(13 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel0_Q1_2 : std_logic_vector(13 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel0_Q1_3 : std_logic_vector(13 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel0_Q1_4 : std_logic_vector(13 DOWNTO 0) := (OTHERS => '0');

  --------------------------------第二级流水参数-----------------------------------
  SIGNAL S_data_pipel1_Q1_0 : std_logic_vector(29 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel1_Q1_1 : std_logic_vector(29 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel1_Q1_2 : std_logic_vector(29 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel1_Q1_3 : std_logic_vector(29 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel1_Q1_4 : std_logic_vector(29 DOWNTO 0) := (OTHERS => '0');
  --------------------------------第三级流水参数-----------------------------------
  SIGNAL S_data_pipel2_Q1_0 : std_logic_vector(29 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel2_Q1_1 : std_logic_vector(29 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel2_Q1_2 : std_logic_vector(29 DOWNTO 0) := (OTHERS => '0');

  --------------------------------第四级流水参数-----------------------------------
  SIGNAL S_data_pipel3_Q1_0 : std_logic_vector(30 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel3_Q1_1 : std_logic_vector(30 DOWNTO 0) := (OTHERS => '0');

  --------------------------------第五级流水参数-----------------------------------
  SIGNAL S_data_pipel4_Q1 : std_logic_vector(31 DOWNTO 0);
  -----------------------------------Q2路的流水寄存器---------------------------------

  --------------------------------第一级流水参数-----------------------------------
  SIGNAL S_data_pipel0_Q2_0 : std_logic_vector(13 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel0_Q2_1 : std_logic_vector(13 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel0_Q2_2 : std_logic_vector(13 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel0_Q2_3 : std_logic_vector(13 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel0_Q2_4 : std_logic_vector(13 DOWNTO 0) := (OTHERS => '0');

  --------------------------------第二级流水参数-----------------------------------
  SIGNAL S_data_pipel1_Q2_0 : std_logic_vector(29 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel1_Q2_1 : std_logic_vector(29 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel1_Q2_2 : std_logic_vector(29 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel1_Q2_3 : std_logic_vector(29 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel1_Q2_4 : std_logic_vector(29 DOWNTO 0) := (OTHERS => '0');
  --------------------------------第三级流水参数-----------------------------------
  SIGNAL S_data_pipel2_Q2_0 : std_logic_vector(29 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel2_Q2_1 : std_logic_vector(29 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel2_Q2_2 : std_logic_vector(29 DOWNTO 0) := (OTHERS => '0');

  --------------------------------第四级流水参数-----------------------------------
  SIGNAL S_data_pipel3_Q2_0 : std_logic_vector(30 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel3_Q2_1 : std_logic_vector(30 DOWNTO 0) := (OTHERS => '0');

  --------------------------------第五级流水参数-----------------------------------
  SIGNAL S_data_pipel4_Q2 : std_logic_vector(31 DOWNTO 0);
  -----------------------------------Q3路的流水寄存器---------------------------------

  --------------------------------第一级流水参数-----------------------------------
  SIGNAL S_data_pipel0_Q3_0 : std_logic_vector(13 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel0_Q3_1 : std_logic_vector(13 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel0_Q3_2 : std_logic_vector(13 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel0_Q3_3 : std_logic_vector(13 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel0_Q3_4 : std_logic_vector(13 DOWNTO 0) := (OTHERS => '0');

  --------------------------------第二级流水参数-----------------------------------
  SIGNAL S_data_pipel1_Q3_0 : std_logic_vector(29 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel1_Q3_1 : std_logic_vector(29 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel1_Q3_2 : std_logic_vector(29 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel1_Q3_3 : std_logic_vector(29 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel1_Q3_4 : std_logic_vector(29 DOWNTO 0) := (OTHERS => '0');
  --------------------------------第三级流水参数-----------------------------------
  SIGNAL S_data_pipel2_Q3_0 : std_logic_vector(29 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel2_Q3_1 : std_logic_vector(29 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel2_Q3_2 : std_logic_vector(29 DOWNTO 0) := (OTHERS => '0');

  --------------------------------第四级流水参数-----------------------------------
  SIGNAL S_data_pipel3_Q3_0 : std_logic_vector(30 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel3_Q3_1 : std_logic_vector(30 DOWNTO 0) := (OTHERS => '0');

  --------------------------------第五级流水参数-----------------------------------
  SIGNAL S_data_pipel4_Q3 : std_logic_vector(31 DOWNTO 0);
BEGIN

  P_input_pipel : PROCESS (I_clk, I_rst_n)
  BEGIN
    IF I_rst_n = '0' THEN
      S_data_d0_I0_0 <= (OTHERS => '0');
      S_data_d0_I1_0 <= (OTHERS => '0');
      S_data_d0_I2_0 <= (OTHERS => '0');
      S_data_d0_I3_0 <= (OTHERS => '0');
      S_data_d0_I4_0 <= (OTHERS => '0');
      S_data_d0_I5_0 <= (OTHERS => '0');
      S_data_d0_I6_0 <= (OTHERS => '0');
      S_data_d0_I7_0 <= (OTHERS => '0');
      S_data_d0_Q0_0 <= (OTHERS => '0');
      S_data_d0_Q1_0 <= (OTHERS => '0');
      S_data_d0_Q2_0 <= (OTHERS => '0');
      S_data_d0_Q3_0 <= (OTHERS => '0');
      S_data_d0_Q4_0 <= (OTHERS => '0');
      S_data_d0_Q5_0 <= (OTHERS => '0');
      S_data_d0_Q6_0 <= (OTHERS => '0');
      S_data_d0_Q7_0 <= (OTHERS => '0');
      S_data_d0_I0_1 <= (OTHERS => '0');
      S_data_d0_I1_1 <= (OTHERS => '0');
      S_data_d0_I2_1 <= (OTHERS => '0');
      S_data_d0_I3_1 <= (OTHERS => '0');
      S_data_d0_I4_1 <= (OTHERS => '0');
      S_data_d0_I5_1 <= (OTHERS => '0');
      S_data_d0_I6_1 <= (OTHERS => '0');
      S_data_d0_I7_1 <= (OTHERS => '0');
      S_data_d0_Q0_1 <= (OTHERS => '0');
      S_data_d0_Q1_1 <= (OTHERS => '0');
      S_data_d0_Q2_1 <= (OTHERS => '0');
      S_data_d0_Q3_1 <= (OTHERS => '0');
      S_data_d0_Q4_1 <= (OTHERS => '0');
      S_data_d0_Q5_1 <= (OTHERS => '0');
      S_data_d0_Q6_1 <= (OTHERS => '0');
      S_data_d0_Q7_1 <= (OTHERS => '0');
    ELSIF rising_edge(I_clk) THEN
      S_data_d0_I0_0 <= I_data_d0_I0;
      S_data_d0_I1_0 <= I_data_d0_I1;
      S_data_d0_I2_0 <= I_data_d0_I2;
      S_data_d0_I3_0 <= I_data_d0_I3;
      S_data_d0_I4_0 <= I_data_d0_I4;
      S_data_d0_I5_0 <= I_data_d0_I5;
      S_data_d0_I6_0 <= I_data_d0_I6;
      S_data_d0_I7_0 <= I_data_d0_I7;
      S_data_d0_Q0_0 <= I_data_d0_Q0;
      S_data_d0_Q1_0 <= I_data_d0_Q1;
      S_data_d0_Q2_0 <= I_data_d0_Q2;
      S_data_d0_Q3_0 <= I_data_d0_Q3;
      S_data_d0_Q4_0 <= I_data_d0_Q4;
      S_data_d0_Q5_0 <= I_data_d0_Q5;
      S_data_d0_Q6_0 <= I_data_d0_Q6;
      S_data_d0_Q7_0 <= I_data_d0_Q7;
      S_data_d0_I0_1 <= S_data_d0_I0_0;
      S_data_d0_I1_1 <= S_data_d0_I1_0;
      S_data_d0_I2_1 <= S_data_d0_I2_0;
      S_data_d0_I3_1 <= S_data_d0_I3_0;
      S_data_d0_I4_1 <= S_data_d0_I4_0;
      S_data_d0_I5_1 <= S_data_d0_I5_0;
      S_data_d0_I6_1 <= S_data_d0_I6_0;
      S_data_d0_I7_1 <= S_data_d0_I7_0;
      S_data_d0_Q0_1 <= S_data_d0_Q0_0;
      S_data_d0_Q1_1 <= S_data_d0_Q1_0;
      S_data_d0_Q2_1 <= S_data_d0_Q2_0;
      S_data_d0_Q3_1 <= S_data_d0_Q3_0;
      S_data_d0_Q4_1 <= S_data_d0_Q4_0;
      S_data_d0_Q5_1 <= S_data_d0_Q5_0;
      S_data_d0_Q6_1 <= S_data_d0_Q6_0;
      S_data_d0_Q7_1 <= S_data_d0_Q7_0;
    END IF;
  END PROCESS;
  ------------------------------------I0--------------------------------------------------------------------------------
  P_I0_Decimal : PROCESS (I_clk, I_rst_n)
  BEGIN
    IF I_rst_n = '0' THEN

      S_data_pipel0_I0_0 <= (OTHERS => '0');
      S_data_pipel0_I0_1 <= (OTHERS => '0');
      S_data_pipel0_I0_2 <= (OTHERS => '0');
      S_data_pipel0_I0_3 <= (OTHERS => '0');
      S_data_pipel0_I0_4 <= (OTHERS => '0');
      S_data_pipel2_I0_0 <= (OTHERS => '0');
      S_data_pipel2_I0_1 <= (OTHERS => '0');
      S_data_pipel2_I0_2 <= (OTHERS => '0');
      S_data_pipel3_I0_0 <= (OTHERS => '0');
      S_data_pipel3_I0_1 <= (OTHERS => '0');
      s_data_pipel4_I0   <= (OTHERS => '0');
    ELSIF rising_edge(I_clk) THEN
      -------------------第一级流水 扩符号位相加-------------------------
      S_data_pipel0_I0_0 <= S_data_d0_I7_1(12) & S_data_d0_I7_1;
      S_data_pipel0_I0_1 <= (S_data_d0_I0_1(12) & S_data_d0_I0_1) + (S_data_d0_I6_0(12) & S_data_d0_I6_0);
      S_data_pipel0_I0_2 <= (S_data_d0_I2_1(12) & S_data_d0_I2_1) + (S_data_d0_I4_0(12) & S_data_d0_I4_0);
      S_data_pipel0_I0_3 <= (S_data_d0_I4_1(12) & S_data_d0_I4_1) + (S_data_d0_I2_0(12) & S_data_d0_I2_0);
      S_data_pipel0_I0_4 <= (S_data_d0_I6_1(12) & S_data_d0_I6_1) + (S_data_d0_I0_0(12) & S_data_d0_I0_0);
      -------------------第三级流水 29位扩位相加-------------------------
      S_data_pipel2_I0_0 <= (S_data_pipel1_I0_0(28) & S_data_pipel1_I0_0(28 DOWNTO 0)) + (S_data_pipel1_I0_1(28) & S_data_pipel1_I0_1(28 DOWNTO 0));
      S_data_pipel2_I0_1 <= (S_data_pipel1_I0_2(28) & S_data_pipel1_I0_2(28 DOWNTO 0));
      S_data_pipel2_I0_2 <= (S_data_pipel1_I0_3(28) & S_data_pipel1_I0_3(28 DOWNTO 0)) + (S_data_pipel1_I0_4(28) & S_data_pipel1_I0_4(28 DOWNTO 0));
      -------------------第四级流水 30位扩位相加-------------------------
      S_data_pipel3_I0_0 <= (S_data_pipel2_I0_0(29) & S_data_pipel2_I0_0);
      S_data_pipel3_I0_1 <= (S_data_pipel2_I0_1(29) & S_data_pipel2_I0_1) + (S_data_pipel2_I0_2(29) & S_data_pipel2_I0_2);
      -------------------第五级流水 26----------------------------------
      S_data_pipel4_I0 <= (S_data_pipel3_I0_0(30) & S_data_pipel3_I0_0) + (S_data_pipel3_I0_1(30) & S_data_pipel3_I0_1);
    END IF;
  END PROCESS;

  I0_p1_0_mult_gen_d1_int : mult_gen_d1_int
  PORT MAP(
    CLK  => I_clk,
    A    => S_data_pipel0_I0_0,
    B    => HB_COE7,
    CE   => I_rst_n,
    SCLR => '0',
    P    => S_data_pipel1_I0_0
  );
  I0_p1_1_mult_gen_d1_int : mult_gen_d1_int
  PORT MAP(
    CLK  => I_clk,
    A    => S_data_pipel0_I0_1,
    B    => HB_COE0,
    CE   => I_rst_n,
    SCLR => '0',
    P    => S_data_pipel1_I0_1
  );

  I0_p1_2_mult_gen_d1_int : mult_gen_d1_int
  PORT MAP(
    CLK  => I_clk,
    A    => S_data_pipel0_I0_2,
    B    => HB_COE2,
    CE   => I_rst_n,
    SCLR => '0',
    P    => S_data_pipel1_I0_2
  );

  I0_p1_3_mult_gen_d1_int : mult_gen_d1_int
  PORT MAP(
    CLK  => I_clk,
    A    => S_data_pipel0_I0_3,
    B    => HB_COE4,
    CE   => I_rst_n,
    SCLR => '0',
    P    => S_data_pipel1_I0_3
  );

  I0_p1_4_mult_gen_d1_int : mult_gen_d1_int
  PORT MAP(
    CLK  => I_clk,
    A    => S_data_pipel0_I0_4,
    B    => HB_COE6,
    CE   => I_rst_n,
    SCLR => '0',
    P    => S_data_pipel1_I0_4
  );

  ------------------------------------I1--------------------------------------------------------------------------------
  P_I1_Decimal : PROCESS (I_clk, I_rst_n)
  BEGIN
    IF I_rst_n = '0' THEN

      S_data_pipel0_I1_0 <= (OTHERS => '0');
      S_data_pipel0_I1_1 <= (OTHERS => '0');
      S_data_pipel0_I1_2 <= (OTHERS => '0');
      S_data_pipel0_I1_3 <= (OTHERS => '0');
      S_data_pipel0_I1_4 <= (OTHERS => '0');
      S_data_pipel2_I1_0 <= (OTHERS => '0');
      S_data_pipel2_I1_1 <= (OTHERS => '0');
      S_data_pipel2_I1_2 <= (OTHERS => '0');
      S_data_pipel3_I1_0 <= (OTHERS => '0');
      S_data_pipel3_I1_1 <= (OTHERS => '0');
      s_data_pipel4_I1   <= (OTHERS => '0');
    ELSIF rising_edge(I_clk) THEN
      -------------------第一级流水 扩符号位相加-------------------------
      S_data_pipel0_I1_0 <= S_data_d0_I1_0(12) & S_data_d0_I1_0;
      S_data_pipel0_I1_1 <= (S_data_d0_I2_1(12) & S_data_d0_I2_1) + (I_data_d0_I6(12) & I_data_d0_I6);
      S_data_pipel0_I1_2 <= (S_data_d0_I4_1(12) & S_data_d0_I4_1) + (S_data_d0_I6_0(12) & S_data_d0_I6_0);
      S_data_pipel0_I1_3 <= (S_data_d0_I6_1(12) & S_data_d0_I6_1) + (S_data_d0_I4_0(12) & S_data_d0_I4_0);
      S_data_pipel0_I1_4 <= (S_data_d0_I0_0(12) & S_data_d0_I0_0) + (S_data_d0_I2_0(12) & S_data_d0_I2_0);
      -------------------第三级流水 29位扩位相加-------------------------
      S_data_pipel2_I1_0 <= (S_data_pipel1_I1_0(28) & S_data_pipel1_I1_0(28 DOWNTO 0)) + (S_data_pipel1_I1_1(28) & S_data_pipel1_I1_1(28 DOWNTO 0));
      S_data_pipel2_I1_1 <= (S_data_pipel1_I1_2(28) & S_data_pipel1_I1_2(28 DOWNTO 0));
      S_data_pipel2_I1_2 <= (S_data_pipel1_I1_3(28) & S_data_pipel1_I1_3(28 DOWNTO 0)) + (S_data_pipel1_I1_4(28) & S_data_pipel1_I1_4(28 DOWNTO 0));
      -------------------第四级流水 30位扩位相加-------------------------
      S_data_pipel3_I1_0 <= (S_data_pipel2_I1_0(29) & S_data_pipel2_I1_0);
      S_data_pipel3_I1_1 <= (S_data_pipel2_I1_1(29) & S_data_pipel2_I1_1) + (S_data_pipel2_I1_2(29) & S_data_pipel2_I1_2);
      -------------------第五级流水 26----------------------------------
      S_data_pipel4_I1 <= (S_data_pipel3_I1_0(30) & S_data_pipel3_I1_0) + (S_data_pipel3_I1_1(30) & S_data_pipel3_I1_1);
    END IF;
  END PROCESS;

  I1_p1_0_mult_gen_d1_int : mult_gen_d1_int
  PORT MAP(
    CLK  => I_clk,
    A    => S_data_pipel0_I1_0,
    B    => HB_COE7,
    CE   => I_rst_n,
    SCLR => '0',
    P    => S_data_pipel1_I1_0
  );
  I1_p1_1_mult_gen_d1_int : mult_gen_d1_int
  PORT MAP(
    CLK  => I_clk,
    A    => S_data_pipel0_I1_1,
    B    => HB_COE0,
    CE   => I_rst_n,
    SCLR => '0',
    P    => S_data_pipel1_I1_1
  );

  I1_p1_2_mult_gen_d1_int : mult_gen_d1_int
  PORT MAP(
    CLK  => I_clk,
    A    => S_data_pipel0_I1_2,
    B    => HB_COE2,
    CE   => I_rst_n,
    SCLR => '0',
    P    => S_data_pipel1_I1_2
  );

  I1_p1_3_mult_gen_d1_int : mult_gen_d1_int
  PORT MAP(
    CLK  => I_clk,
    A    => S_data_pipel0_I1_3,
    B    => HB_COE4,
    CE   => I_rst_n,
    SCLR => '0',
    P    => S_data_pipel1_I1_3
  );

  I1_p1_4_mult_gen_d1_int : mult_gen_d1_int
  PORT MAP(
    CLK  => I_clk,
    A    => S_data_pipel0_I1_4,
    B    => HB_COE6,
    CE   => I_rst_n,
    SCLR => '0',
    P    => S_data_pipel1_I1_4
  );

  ------------------------------------I2--------------------------------------------------------------------------------
  P_I2_Decimal : PROCESS (I_clk, I_rst_n)
  BEGIN
    IF I_rst_n = '0' THEN

      S_data_pipel0_I2_0 <= (OTHERS => '0');
      S_data_pipel0_I2_1 <= (OTHERS => '0');
      S_data_pipel0_I2_2 <= (OTHERS => '0');
      S_data_pipel0_I2_3 <= (OTHERS => '0');
      S_data_pipel0_I2_4 <= (OTHERS => '0');
      S_data_pipel2_I2_0 <= (OTHERS => '0');
      S_data_pipel2_I2_1 <= (OTHERS => '0');
      S_data_pipel2_I2_2 <= (OTHERS => '0');
      S_data_pipel3_I2_0 <= (OTHERS => '0');
      S_data_pipel3_I2_1 <= (OTHERS => '0');
      s_data_pipel4_I2   <= (OTHERS => '0');
    ELSIF rising_edge(I_clk) THEN
      -------------------第一级流水 扩符号位相加-------------------------
      S_data_pipel0_I2_0 <= S_data_d0_I3_0(12) & S_data_d0_I3_0;
      S_data_pipel0_I2_1 <= (S_data_d0_I4_1(12) & S_data_d0_I4_1) + (I_data_d0_I2(12) & I_data_d0_I2);
      S_data_pipel0_I2_2 <= (S_data_d0_I6_1(12) & S_data_d0_I6_1) + (I_data_d0_I0(12) & I_data_d0_I0);
      S_data_pipel0_I2_3 <= (S_data_d0_I0_0(12) & S_data_d0_I0_0) + (S_data_d0_I6_0(12) & S_data_d0_I6_0);
      S_data_pipel0_I2_4 <= (S_data_d0_I2_0(12) & S_data_d0_I2_0) + (S_data_d0_I4_0(12) & S_data_d0_I4_0);
      -------------------第三级流水 29位扩位相加-------------------------
      S_data_pipel2_I2_0 <= (S_data_pipel1_I2_0(28) & S_data_pipel1_I2_0(28 DOWNTO 0)) + (S_data_pipel1_I2_1(28) & S_data_pipel1_I2_1(28 DOWNTO 0));
      S_data_pipel2_I2_1 <= (S_data_pipel1_I2_2(28) & S_data_pipel1_I2_2(28 DOWNTO 0));
      S_data_pipel2_I2_2 <= (S_data_pipel1_I2_3(28) & S_data_pipel1_I2_3(28 DOWNTO 0)) + (S_data_pipel1_I2_4(28) & S_data_pipel1_I2_4(28 DOWNTO 0));
      -------------------第四级流水 30位扩位相加-------------------------
      S_data_pipel3_I2_0 <= (S_data_pipel2_I2_0(29) & S_data_pipel2_I2_0);
      S_data_pipel3_I2_1 <= (S_data_pipel2_I2_1(29) & S_data_pipel2_I2_1) + (S_data_pipel2_I2_2(29) & S_data_pipel2_I2_2);
      -------------------第五级流水 26----------------------------------
      S_data_pipel4_I2 <= (S_data_pipel3_I2_0(30) & S_data_pipel3_I2_0) + (S_data_pipel3_I2_1(30) & S_data_pipel3_I2_1);
    END IF;
  END PROCESS;

  I2_p1_0_mult_gen_d1_int : mult_gen_d1_int
  PORT MAP(
    CLK  => I_clk,
    A    => S_data_pipel0_I2_0,
    B    => HB_COE7,
    CE   => I_rst_n,
    SCLR => '0',
    P    => S_data_pipel1_I2_0
  );
  I2_p1_1_mult_gen_d1_int : mult_gen_d1_int
  PORT MAP(
    CLK  => I_clk,
    A    => S_data_pipel0_I2_1,
    B    => HB_COE0,
    CE   => I_rst_n,
    SCLR => '0',
    P    => S_data_pipel1_I2_1
  );

  I2_p1_2_mult_gen_d1_int : mult_gen_d1_int
  PORT MAP(
    CLK  => I_clk,
    A    => S_data_pipel0_I2_2,
    B    => HB_COE2,
    CE   => I_rst_n,
    SCLR => '0',
    P    => S_data_pipel1_I2_2
  );

  I2_p1_3_mult_gen_d1_int : mult_gen_d1_int
  PORT MAP(
    CLK  => I_clk,
    A    => S_data_pipel0_I2_3,
    B    => HB_COE4,
    CE   => I_rst_n,
    SCLR => '0',
    P    => S_data_pipel1_I2_3
  );

  I2_p1_4_mult_gen_d1_int : mult_gen_d1_int
  PORT MAP(
    CLK  => I_clk,
    A    => S_data_pipel0_I2_4,
    B    => HB_COE6,
    CE   => I_rst_n,
    SCLR => '0',
    P    => S_data_pipel1_I2_4
  );

  ------------------------------------I3--------------------------------------------------------------------------------
  P_I3_Decimal : PROCESS (I_clk, I_rst_n)
  BEGIN
    IF I_rst_n = '0' THEN

      S_data_pipel0_I3_0 <= (OTHERS => '0');
      S_data_pipel0_I3_1 <= (OTHERS => '0');
      S_data_pipel0_I3_2 <= (OTHERS => '0');
      S_data_pipel0_I3_3 <= (OTHERS => '0');
      S_data_pipel0_I3_4 <= (OTHERS => '0');
      S_data_pipel2_I3_0 <= (OTHERS => '0');
      S_data_pipel2_I3_1 <= (OTHERS => '0');
      S_data_pipel2_I3_2 <= (OTHERS => '0');
      S_data_pipel3_I3_0 <= (OTHERS => '0');
      S_data_pipel3_I3_1 <= (OTHERS => '0');
      s_data_pipel4_I3   <= (OTHERS => '0');
    ELSIF rising_edge(I_clk) THEN
      -------------------第一级流水 扩符号位相加-------------------------
      S_data_pipel0_I3_0 <= S_data_d0_I5_0(12) & S_data_d0_I5_0;
      S_data_pipel0_I3_1 <= (S_data_d0_I6_1(12) & S_data_d0_I6_1) + (I_data_d0_I4(12) & I_data_d0_I4);
      S_data_pipel0_I3_2 <= (S_data_d0_I0_1(12) & S_data_d0_I0_1) + (I_data_d0_I2(12) & I_data_d0_I2);
      S_data_pipel0_I3_3 <= (S_data_d0_I2_0(12) & S_data_d0_I2_0) + (I_data_d0_I0(12) & I_data_d0_I0);
      S_data_pipel0_I3_4 <= (S_data_d0_I4_0(12) & S_data_d0_I4_0) + (S_data_d0_I6_0(12) & S_data_d0_I6_0);
      -------------------第三级流水 29位扩位相加-------------------------
      S_data_pipel2_I3_0 <= (S_data_pipel1_I3_0(28) & S_data_pipel1_I3_0(28 DOWNTO 0)) + (S_data_pipel1_I3_1(28) & S_data_pipel1_I3_1(28 DOWNTO 0));
      S_data_pipel2_I3_1 <= (S_data_pipel1_I3_2(28) & S_data_pipel1_I3_2(28 DOWNTO 0));
      S_data_pipel2_I3_2 <= (S_data_pipel1_I3_3(28) & S_data_pipel1_I3_3(28 DOWNTO 0)) + (S_data_pipel1_I3_4(28) & S_data_pipel1_I3_4(28 DOWNTO 0));
      -------------------第四级流水 30位扩位相加-------------------------
      S_data_pipel3_I3_0 <= (S_data_pipel2_I3_0(29) & S_data_pipel2_I3_0);
      S_data_pipel3_I3_1 <= (S_data_pipel2_I3_1(29) & S_data_pipel2_I3_1) + (S_data_pipel2_I3_2(29) & S_data_pipel2_I3_2);
      -------------------第五级流水 26----------------------------------
      S_data_pipel4_I3 <= (S_data_pipel3_I3_0(30) & S_data_pipel3_I3_0) + (S_data_pipel3_I3_1(30) & S_data_pipel3_I3_1);
    END IF;
  END PROCESS;

  I3_p1_0_mult_gen_d1_int : mult_gen_d1_int
  PORT MAP(
    CLK  => I_clk,
    A    => S_data_pipel0_I3_0,
    B    => HB_COE7,
    CE   => I_rst_n,
    SCLR => '0',
    P    => S_data_pipel1_I3_0
  );
  I3_p1_1_mult_gen_d1_int : mult_gen_d1_int
  PORT MAP(
    CLK  => I_clk,
    A    => S_data_pipel0_I3_1,
    B    => HB_COE0,
    CE   => I_rst_n,
    SCLR => '0',
    P    => S_data_pipel1_I3_1
  );

  I3_p1_2_mult_gen_d1_int : mult_gen_d1_int
  PORT MAP(
    CLK  => I_clk,
    A    => S_data_pipel0_I3_2,
    B    => HB_COE2,
    CE   => I_rst_n,
    SCLR => '0',
    P    => S_data_pipel1_I3_2
  );

  I3_p1_3_mult_gen_d1_int : mult_gen_d1_int
  PORT MAP(
    CLK  => I_clk,
    A    => S_data_pipel0_I3_3,
    B    => HB_COE4,
    CE   => I_rst_n,
    SCLR => '0',
    P    => S_data_pipel1_I3_3
  );

  I3_p1_4_mult_gen_d1_int : mult_gen_d1_int
  PORT MAP(
    CLK  => I_clk,
    A    => S_data_pipel0_I3_4,
    B    => HB_COE6,
    CE   => I_rst_n,
    SCLR => '0',
    P    => S_data_pipel1_I3_4
  );




   ------------------------------------Q0--------------------------------------------------------------------------------
   P_Q0_Decimal : PROCESS (I_clk, I_rst_n)
   BEGIN
     IF I_rst_n = '0' THEN
 
       S_data_pipel0_Q0_0 <= (OTHERS => '0');
       S_data_pipel0_Q0_1 <= (OTHERS => '0');
       S_data_pipel0_Q0_2 <= (OTHERS => '0');
       S_data_pipel0_Q0_3 <= (OTHERS => '0');
       S_data_pipel0_Q0_4 <= (OTHERS => '0');
       S_data_pipel2_Q0_0 <= (OTHERS => '0');
       S_data_pipel2_Q0_1 <= (OTHERS => '0');
       S_data_pipel2_Q0_2 <= (OTHERS => '0');
       S_data_pipel3_Q0_0 <= (OTHERS => '0');
       S_data_pipel3_Q0_1 <= (OTHERS => '0');
       s_data_pipel4_Q0   <= (OTHERS => '0');
     ELSIF rising_edge(I_clk) THEN
       -------------------第一级流水 扩符号位相加-------------------------
       S_data_pipel0_Q0_0 <= S_data_d0_Q7_1(12) & S_data_d0_Q7_1;
       S_data_pipel0_Q0_1 <= (S_data_d0_Q0_1(12) & S_data_d0_Q0_1) + (S_data_d0_Q6_0(12) & S_data_d0_Q6_0);
       S_data_pipel0_Q0_2 <= (S_data_d0_Q2_1(12) & S_data_d0_Q2_1) + (S_data_d0_Q4_0(12) & S_data_d0_Q4_0);
       S_data_pipel0_Q0_3 <= (S_data_d0_Q4_1(12) & S_data_d0_Q4_1) + (S_data_d0_Q2_0(12) & S_data_d0_Q2_0);
       S_data_pipel0_Q0_4 <= (S_data_d0_Q6_1(12) & S_data_d0_Q6_1) + (S_data_d0_Q0_0(12) & S_data_d0_Q0_0);
       -------------------第三级流水 29位扩位相加-------------------------
       S_data_pipel2_Q0_0 <= (S_data_pipel1_Q0_0(28) & S_data_pipel1_Q0_0(28 DOWNTO 0)) + (S_data_pipel1_Q0_1(28) & S_data_pipel1_Q0_1(28 DOWNTO 0));
       S_data_pipel2_Q0_1 <= (S_data_pipel1_Q0_2(28) & S_data_pipel1_Q0_2(28 DOWNTO 0));
       S_data_pipel2_Q0_2 <= (S_data_pipel1_Q0_3(28) & S_data_pipel1_Q0_3(28 DOWNTO 0)) + (S_data_pipel1_Q0_4(28) & S_data_pipel1_Q0_4(28 DOWNTO 0));
       -------------------第四级流水 30位扩位相加-------------------------
       S_data_pipel3_Q0_0 <= (S_data_pipel2_Q0_0(29) & S_data_pipel2_Q0_0);
       S_data_pipel3_Q0_1 <= (S_data_pipel2_Q0_1(29) & S_data_pipel2_Q0_1) + (S_data_pipel2_Q0_2(29) & S_data_pipel2_Q0_2);
       -------------------第五级流水 26----------------------------------
       S_data_pipel4_Q0 <= (S_data_pipel3_Q0_0(30) & S_data_pipel3_Q0_0) + (S_data_pipel3_Q0_1(30) & S_data_pipel3_Q0_1);
     END IF;
   END PROCESS;
 
   Q0_p1_0_mult_gen_d1_int : mult_gen_d1_int
   PORT MAP(
     CLK  => I_clk,
     A    => S_data_pipel0_Q0_0,
     B    => HB_COE7,
     CE   => I_rst_n,
     SCLR => '0',
     P    => S_data_pipel1_Q0_0
   );
   Q0_p1_1_mult_gen_d1_int : mult_gen_d1_int
   PORT MAP(
     CLK  => I_clk,
     A    => S_data_pipel0_Q0_1,
     B    => HB_COE0,
     CE   => I_rst_n,
     SCLR => '0',
     P    => S_data_pipel1_Q0_1
   );
 
   Q0_p1_2_mult_gen_d1_int : mult_gen_d1_int
   PORT MAP(
     CLK  => I_clk,
     A    => S_data_pipel0_Q0_2,
     B    => HB_COE2,
     CE   => I_rst_n,
     SCLR => '0',
     P    => S_data_pipel1_Q0_2
   );
 
   Q0_p1_3_mult_gen_d1_int : mult_gen_d1_int
   PORT MAP(
     CLK  => I_clk,
     A    => S_data_pipel0_Q0_3,
     B    => HB_COE4,
     CE   => I_rst_n,
     SCLR => '0',
     P    => S_data_pipel1_Q0_3
   );
 
   Q0_p1_4_mult_gen_d1_int : mult_gen_d1_int
   PORT MAP(
     CLK  => I_clk,
     A    => S_data_pipel0_Q0_4,
     B    => HB_COE6,
     CE   => I_rst_n,
     SCLR => '0',
     P    => S_data_pipel1_Q0_4
   );
 
   ------------------------------------Q1--------------------------------------------------------------------------------
   P_Q1_Decimal : PROCESS (I_clk, I_rst_n)
   BEGIN
     IF I_rst_n = '0' THEN
 
       S_data_pipel0_Q1_0 <= (OTHERS => '0');
       S_data_pipel0_Q1_1 <= (OTHERS => '0');
       S_data_pipel0_Q1_2 <= (OTHERS => '0');
       S_data_pipel0_Q1_3 <= (OTHERS => '0');
       S_data_pipel0_Q1_4 <= (OTHERS => '0');
       S_data_pipel2_Q1_0 <= (OTHERS => '0');
       S_data_pipel2_Q1_1 <= (OTHERS => '0');
       S_data_pipel2_Q1_2 <= (OTHERS => '0');
       S_data_pipel3_Q1_0 <= (OTHERS => '0');
       S_data_pipel3_Q1_1 <= (OTHERS => '0');
       s_data_pipel4_Q1   <= (OTHERS => '0');
     ELSIF rising_edge(I_clk) THEN
       -------------------第一级流水 扩符号位相加-------------------------
       S_data_pipel0_Q1_0 <= S_data_d0_Q1_0(12) & S_data_d0_Q1_0;
       S_data_pipel0_Q1_1 <= (S_data_d0_Q2_1(12) & S_data_d0_Q2_1) + (I_data_d0_Q6(12) & I_data_d0_Q6);
       S_data_pipel0_Q1_2 <= (S_data_d0_Q4_1(12) & S_data_d0_Q4_1) + (S_data_d0_Q6_0(12) & S_data_d0_Q6_0);
       S_data_pipel0_Q1_3 <= (S_data_d0_Q6_1(12) & S_data_d0_Q6_1) + (S_data_d0_Q4_0(12) & S_data_d0_Q4_0);
       S_data_pipel0_Q1_4 <= (S_data_d0_Q0_0(12) & S_data_d0_Q0_0) + (S_data_d0_Q2_0(12) & S_data_d0_Q2_0);
       -------------------第三级流水 29位扩位相加-------------------------
       S_data_pipel2_Q1_0 <= (S_data_pipel1_Q1_0(28) & S_data_pipel1_Q1_0(28 DOWNTO 0)) + (S_data_pipel1_Q1_1(28) & S_data_pipel1_Q1_1(28 DOWNTO 0));
       S_data_pipel2_Q1_1 <= (S_data_pipel1_Q1_2(28) & S_data_pipel1_Q1_2(28 DOWNTO 0));
       S_data_pipel2_Q1_2 <= (S_data_pipel1_Q1_3(28) & S_data_pipel1_Q1_3(28 DOWNTO 0)) + (S_data_pipel1_Q1_4(28) & S_data_pipel1_Q1_4(28 DOWNTO 0));
       -------------------第四级流水 30位扩位相加-------------------------
       S_data_pipel3_Q1_0 <= (S_data_pipel2_Q1_0(29) & S_data_pipel2_Q1_0);
       S_data_pipel3_Q1_1 <= (S_data_pipel2_Q1_1(29) & S_data_pipel2_Q1_1) + (S_data_pipel2_Q1_2(29) & S_data_pipel2_Q1_2);
       -------------------第五级流水 26----------------------------------
       S_data_pipel4_Q1 <= (S_data_pipel3_Q1_0(30) & S_data_pipel3_Q1_0) + (S_data_pipel3_Q1_1(30) & S_data_pipel3_Q1_1);
     END IF;
   END PROCESS;
 
   Q1_p1_0_mult_gen_d1_int : mult_gen_d1_int
   PORT MAP(
     CLK  => I_clk,
     A    => S_data_pipel0_Q1_0,
     B    => HB_COE7,
     CE   => I_rst_n,
     SCLR => '0',
     P    => S_data_pipel1_Q1_0
   );
   Q1_p1_1_mult_gen_d1_int : mult_gen_d1_int
   PORT MAP(
     CLK  => I_clk,
     A    => S_data_pipel0_Q1_1,
     B    => HB_COE0,
     CE   => I_rst_n,
     SCLR => '0',
     P    => S_data_pipel1_Q1_1
   );
 
   Q1_p1_2_mult_gen_d1_int : mult_gen_d1_int
   PORT MAP(
     CLK  => I_clk,
     A    => S_data_pipel0_Q1_2,
     B    => HB_COE2,
     CE   => I_rst_n,
     SCLR => '0',
     P    => S_data_pipel1_Q1_2
   );
 
   Q1_p1_3_mult_gen_d1_int : mult_gen_d1_int
   PORT MAP(
     CLK  => I_clk,
     A    => S_data_pipel0_Q1_3,
     B    => HB_COE4,
     CE   => I_rst_n,
     SCLR => '0',
     P    => S_data_pipel1_Q1_3
   );
 
   Q1_p1_4_mult_gen_d1_int : mult_gen_d1_int
   PORT MAP(
     CLK  => I_clk,
     A    => S_data_pipel0_Q1_4,
     B    => HB_COE6,
     CE   => I_rst_n,
     SCLR => '0',
     P    => S_data_pipel1_Q1_4
   );
 
   ------------------------------------Q2--------------------------------------------------------------------------------
   P_Q2_Decimal : PROCESS (I_clk, I_rst_n)
   BEGIN
     IF I_rst_n = '0' THEN
 
       S_data_pipel0_Q2_0 <= (OTHERS => '0');
       S_data_pipel0_Q2_1 <= (OTHERS => '0');
       S_data_pipel0_Q2_2 <= (OTHERS => '0');
       S_data_pipel0_Q2_3 <= (OTHERS => '0');
       S_data_pipel0_Q2_4 <= (OTHERS => '0');
       S_data_pipel2_Q2_0 <= (OTHERS => '0');
       S_data_pipel2_Q2_1 <= (OTHERS => '0');
       S_data_pipel2_Q2_2 <= (OTHERS => '0');
       S_data_pipel3_Q2_0 <= (OTHERS => '0');
       S_data_pipel3_Q2_1 <= (OTHERS => '0');
       s_data_pipel4_Q2   <= (OTHERS => '0');
     ELSIF rising_edge(I_clk) THEN
       -------------------第一级流水 扩符号位相加-------------------------
       S_data_pipel0_Q2_0 <= S_data_d0_Q3_0(12) & S_data_d0_Q3_0;
       S_data_pipel0_Q2_1 <= (S_data_d0_Q4_1(12) & S_data_d0_Q4_1) + (I_data_d0_Q2(12) & I_data_d0_Q2);
       S_data_pipel0_Q2_2 <= (S_data_d0_Q6_1(12) & S_data_d0_Q6_1) + (I_data_d0_Q0(12) & I_data_d0_Q0);
       S_data_pipel0_Q2_3 <= (S_data_d0_Q0_0(12) & S_data_d0_Q0_0) + (S_data_d0_Q6_0(12) & S_data_d0_Q6_0);
       S_data_pipel0_Q2_4 <= (S_data_d0_Q2_0(12) & S_data_d0_Q2_0) + (S_data_d0_Q4_0(12) & S_data_d0_Q4_0);
       -------------------第三级流水 29位扩位相加-------------------------
       S_data_pipel2_Q2_0 <= (S_data_pipel1_Q2_0(28) & S_data_pipel1_Q2_0(28 DOWNTO 0)) + (S_data_pipel1_Q2_1(28) & S_data_pipel1_Q2_1(28 DOWNTO 0));
       S_data_pipel2_Q2_1 <= (S_data_pipel1_Q2_2(28) & S_data_pipel1_Q2_2(28 DOWNTO 0));
       S_data_pipel2_Q2_2 <= (S_data_pipel1_Q2_3(28) & S_data_pipel1_Q2_3(28 DOWNTO 0)) + (S_data_pipel1_Q2_4(28) & S_data_pipel1_Q2_4(28 DOWNTO 0));
       -------------------第四级流水 30位扩位相加-------------------------
       S_data_pipel3_Q2_0 <= (S_data_pipel2_Q2_0(29) & S_data_pipel2_Q2_0);
       S_data_pipel3_Q2_1 <= (S_data_pipel2_Q2_1(29) & S_data_pipel2_Q2_1) + (S_data_pipel2_Q2_2(29) & S_data_pipel2_Q2_2);
       -------------------第五级流水 26----------------------------------
       S_data_pipel4_Q2 <= (S_data_pipel3_Q2_0(30) & S_data_pipel3_Q2_0) + (S_data_pipel3_Q2_1(30) & S_data_pipel3_Q2_1);
     END IF;
   END PROCESS;
 
   Q2_p1_0_mult_gen_d1_int : mult_gen_d1_int
   PORT MAP(
     CLK  => I_clk,
     A    => S_data_pipel0_Q2_0,
     B    => HB_COE7,
     CE   => I_rst_n,
     SCLR => '0',
     P    => S_data_pipel1_Q2_0
   );
   Q2_p1_1_mult_gen_d1_int : mult_gen_d1_int
   PORT MAP(
     CLK  => I_clk,
     A    => S_data_pipel0_Q2_1,
     B    => HB_COE0,
     CE   => I_rst_n,
     SCLR => '0',
     P    => S_data_pipel1_Q2_1
   );
 
   Q2_p1_2_mult_gen_d1_int : mult_gen_d1_int
   PORT MAP(
     CLK  => I_clk,
     A    => S_data_pipel0_Q2_2,
     B    => HB_COE2,
     CE   => I_rst_n,
     SCLR => '0',
     P    => S_data_pipel1_Q2_2
   );
 
   Q2_p1_3_mult_gen_d1_int : mult_gen_d1_int
   PORT MAP(
     CLK  => I_clk,
     A    => S_data_pipel0_Q2_3,
     B    => HB_COE4,
     CE   => I_rst_n,
     SCLR => '0',
     P    => S_data_pipel1_Q2_3
   );
 
   Q2_p1_4_mult_gen_d1_int : mult_gen_d1_int
   PORT MAP(
     CLK  => I_clk,
     A    => S_data_pipel0_Q2_4,
     B    => HB_COE6,
     CE   => I_rst_n,
     SCLR => '0',
     P    => S_data_pipel1_Q2_4
   );
 
   ------------------------------------Q3--------------------------------------------------------------------------------
   P_Q3_Decimal : PROCESS (I_clk, I_rst_n)
   BEGIN
     IF I_rst_n = '0' THEN
 
       S_data_pipel0_Q3_0 <= (OTHERS => '0');
       S_data_pipel0_Q3_1 <= (OTHERS => '0');
       S_data_pipel0_Q3_2 <= (OTHERS => '0');
       S_data_pipel0_Q3_3 <= (OTHERS => '0');
       S_data_pipel0_Q3_4 <= (OTHERS => '0');
       S_data_pipel2_Q3_0 <= (OTHERS => '0');
       S_data_pipel2_Q3_1 <= (OTHERS => '0');
       S_data_pipel2_Q3_2 <= (OTHERS => '0');
       S_data_pipel3_Q3_0 <= (OTHERS => '0');
       S_data_pipel3_Q3_1 <= (OTHERS => '0');
       s_data_pipel4_Q3   <= (OTHERS => '0');
     ELSIF rising_edge(I_clk) THEN
       -------------------第一级流水 扩符号位相加-------------------------
       S_data_pipel0_Q3_0 <= S_data_d0_Q5_0(12) & S_data_d0_Q5_0;
       S_data_pipel0_Q3_1 <= (S_data_d0_Q6_1(12) & S_data_d0_Q6_1) + (I_data_d0_Q4(12) & I_data_d0_Q4);
       S_data_pipel0_Q3_2 <= (S_data_d0_Q0_1(12) & S_data_d0_Q0_1) + (I_data_d0_Q2(12) & I_data_d0_Q2);
       S_data_pipel0_Q3_3 <= (S_data_d0_Q2_0(12) & S_data_d0_Q2_0) + (I_data_d0_Q0(12) & I_data_d0_Q0);
       S_data_pipel0_Q3_4 <= (S_data_d0_Q4_0(12) & S_data_d0_Q4_0) + (S_data_d0_Q6_0(12) & S_data_d0_Q6_0);
       -------------------第三级流水 29位扩位相加-------------------------
       S_data_pipel2_Q3_0 <= (S_data_pipel1_Q3_0(28) & S_data_pipel1_Q3_0(28 DOWNTO 0)) + (S_data_pipel1_Q3_1(28) & S_data_pipel1_Q3_1(28 DOWNTO 0));
       S_data_pipel2_Q3_1 <= (S_data_pipel1_Q3_2(28) & S_data_pipel1_Q3_2(28 DOWNTO 0));
       S_data_pipel2_Q3_2 <= (S_data_pipel1_Q3_3(28) & S_data_pipel1_Q3_3(28 DOWNTO 0)) + (S_data_pipel1_Q3_4(28) & S_data_pipel1_Q3_4(28 DOWNTO 0));
       -------------------第四级流水 30位扩位相加-------------------------
       S_data_pipel3_Q3_0 <= (S_data_pipel2_Q3_0(29) & S_data_pipel2_Q3_0);
       S_data_pipel3_Q3_1 <= (S_data_pipel2_Q3_1(29) & S_data_pipel2_Q3_1) + (S_data_pipel2_Q3_2(29) & S_data_pipel2_Q3_2);
       -------------------第五级流水 26----------------------------------
       S_data_pipel4_Q3 <= (S_data_pipel3_Q3_0(30) & S_data_pipel3_Q3_0) + (S_data_pipel3_Q3_1(30) & S_data_pipel3_Q3_1);
     END IF;
   END PROCESS;
 
   Q3_p1_0_mult_gen_d1_int : mult_gen_d1_int
   PORT MAP(
     CLK  => I_clk,
     A    => S_data_pipel0_Q3_0,
     B    => HB_COE7,
     CE   => I_rst_n,
     SCLR => '0',
     P    => S_data_pipel1_Q3_0
   );
   Q3_p1_1_mult_gen_d1_int : mult_gen_d1_int
   PORT MAP(
     CLK  => I_clk,
     A    => S_data_pipel0_Q3_1,
     B    => HB_COE0,
     CE   => I_rst_n,
     SCLR => '0',
     P    => S_data_pipel1_Q3_1
   );
 
   Q3_p1_2_mult_gen_d1_int : mult_gen_d1_int
   PORT MAP(
     CLK  => I_clk,
     A    => S_data_pipel0_Q3_2,
     B    => HB_COE2,
     CE   => I_rst_n,
     SCLR => '0',
     P    => S_data_pipel1_Q3_2
   );
 
   Q3_p1_3_mult_gen_d1_int : mult_gen_d1_int
   PORT MAP(
     CLK  => I_clk,
     A    => S_data_pipel0_Q3_3,
     B    => HB_COE4,
     CE   => I_rst_n,
     SCLR => '0',
     P    => S_data_pipel1_Q3_3
   );
 
   Q3_p1_4_mult_gen_d1_int : mult_gen_d1_int
   PORT MAP(
     CLK  => I_clk,
     A    => S_data_pipel0_Q3_4,
     B    => HB_COE6,
     CE   => I_rst_n,
     SCLR => '0',
     P    => S_data_pipel1_Q3_4
   );
  ----------------------------------信号输出------------------------------------------
  O_data_d1_I0 <= S_data_pipel4_I0(30 DOWNTO 15) + S_data_pipel4_I0(14);
  O_data_d1_I1 <= S_data_pipel4_I1(30 DOWNTO 15) + S_data_pipel4_I1(14);
  O_data_d1_I2 <= S_data_pipel4_I2(30 DOWNTO 15) + S_data_pipel4_I2(14);
  O_data_d1_I3 <= S_data_pipel4_I3(30 DOWNTO 15) + S_data_pipel4_I3(14);

  O_data_d1_Q0 <= S_data_pipel4_Q0(30 DOWNTO 15) + S_data_pipel4_Q0(14);
  O_data_d1_Q1 <= S_data_pipel4_Q1(30 DOWNTO 15) + S_data_pipel4_Q1(14);
  O_data_d1_Q2 <= S_data_pipel4_Q2(30 DOWNTO 15) + S_data_pipel4_Q2(14);
  O_data_d1_Q3 <= S_data_pipel4_Q3(30 DOWNTO 15) + S_data_pipel4_Q3(14);
END Behavioral;