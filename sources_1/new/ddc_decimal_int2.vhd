----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2022/04/08 14:59:11
-- Design Name: 
-- Module Name: ddc_decimal_int2 - Behavioral
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

ENTITY ddc_decimal_int2 IS
  PORT (
    --------------------时钟---------------------------
    I_clk   : IN std_logic;
    I_rst_n : IN std_logic;

    ---------------------第二级抽取输出信号------------------------

    I_data_d1_I0 : IN std_logic_vector(15 DOWNTO 0);
    I_data_d1_I1 : IN std_logic_vector(15 DOWNTO 0);
    I_data_d1_I2 : IN std_logic_vector(15 DOWNTO 0);
    I_data_d1_I3 : IN std_logic_vector(15 DOWNTO 0);

    I_data_d1_Q0 : IN std_logic_vector(15 DOWNTO 0);
    I_data_d1_Q1 : IN std_logic_vector(15 DOWNTO 0);
    I_data_d1_Q2 : IN std_logic_vector(15 DOWNTO 0);
    I_data_d1_Q3 : IN std_logic_vector(15 DOWNTO 0);

    --------------------第三级抽取输出信号-------------------------
    O_data_d2_I0 : OUT std_logic_vector(15 DOWNTO 0);
    O_data_d2_I1 : OUT std_logic_vector(15 DOWNTO 0);
    O_data_d2_Q0 : OUT std_logic_vector(15 DOWNTO 0);
    O_data_d2_Q1 : OUT std_logic_vector(15 DOWNTO 0)

  );
END ddc_decimal_int2;

ARCHITECTURE Behavioral OF ddc_decimal_int2 IS
  COMPONENT mult_gen_d2_int
    PORT (
      CLK  : IN std_logic;
      A    : IN std_logic_vector(16 DOWNTO 0);
      B    : IN std_logic_vector(15 DOWNTO 0);
      CE   : IN std_logic;
      SCLR : IN std_logic;
      P    : OUT std_logic_vector(32 DOWNTO 0)
    );
  END COMPONENT;

  CONSTANT HB_COE0 : std_logic_vector(15 DOWNTO 0) := conv_std_logic_vector(-112, 16);
  CONSTANT HB_COE2 : std_logic_vector(15 DOWNTO 0) := conv_std_logic_vector(647, 16);
  CONSTANT HB_COE4 : std_logic_vector(15 DOWNTO 0) := conv_std_logic_vector(-2336, 16);
  CONSTANT HB_COE6 : std_logic_vector(15 DOWNTO 0) := conv_std_logic_vector(9991, 16);
  CONSTANT HB_COE7 : std_logic_vector(15 DOWNTO 0) := conv_std_logic_vector(16384, 16);

  --------------------------输入信号流水----------------------------
  SIGNAL S_data_d1_I0_0 : std_logic_vector(15 DOWNTO 0);
  SIGNAL S_data_d1_I1_0 : std_logic_vector(15 DOWNTO 0);
  SIGNAL S_data_d1_I2_0 : std_logic_vector(15 DOWNTO 0);
  SIGNAL S_data_d1_I3_0 : std_logic_vector(15 DOWNTO 0);
  SIGNAL S_data_d1_Q0_0 : std_logic_vector(15 DOWNTO 0);
  SIGNAL S_data_d1_Q1_0 : std_logic_vector(15 DOWNTO 0);
  SIGNAL S_data_d1_Q2_0 : std_logic_vector(15 DOWNTO 0);
  SIGNAL S_data_d1_Q3_0 : std_logic_vector(15 DOWNTO 0);
  SIGNAL S_data_d1_I0_1 : std_logic_vector(15 DOWNTO 0);
  SIGNAL S_data_d1_I1_1 : std_logic_vector(15 DOWNTO 0);
  SIGNAL S_data_d1_I2_1 : std_logic_vector(15 DOWNTO 0);
  SIGNAL S_data_d1_I3_1 : std_logic_vector(15 DOWNTO 0);
  SIGNAL S_data_d1_Q0_1 : std_logic_vector(15 DOWNTO 0);
  SIGNAL S_data_d1_Q1_1 : std_logic_vector(15 DOWNTO 0);
  SIGNAL S_data_d1_Q2_1 : std_logic_vector(15 DOWNTO 0);
  SIGNAL S_data_d1_Q3_1 : std_logic_vector(15 DOWNTO 0);

  SIGNAL S_data_d1_I0_2 : std_logic_vector(15 DOWNTO 0);
  SIGNAL S_data_d1_I1_2 : std_logic_vector(15 DOWNTO 0);
  SIGNAL S_data_d1_I2_2 : std_logic_vector(15 DOWNTO 0);
  SIGNAL S_data_d1_I3_2 : std_logic_vector(15 DOWNTO 0);
  SIGNAL S_data_d1_Q0_2 : std_logic_vector(15 DOWNTO 0);
  SIGNAL S_data_d1_Q1_2 : std_logic_vector(15 DOWNTO 0);
  SIGNAL S_data_d1_Q2_2 : std_logic_vector(15 DOWNTO 0);
  SIGNAL S_data_d1_Q3_2 : std_logic_vector(15 DOWNTO 0);

  SIGNAL S_data_d1_I0_3 : std_logic_vector(15 DOWNTO 0);
  SIGNAL S_data_d1_I1_3 : std_logic_vector(15 DOWNTO 0);
  SIGNAL S_data_d1_I2_3 : std_logic_vector(15 DOWNTO 0);
  SIGNAL S_data_d1_I3_3 : std_logic_vector(15 DOWNTO 0);
  SIGNAL S_data_d1_Q0_3 : std_logic_vector(15 DOWNTO 0);
  SIGNAL S_data_d1_Q1_3 : std_logic_vector(15 DOWNTO 0);
  SIGNAL S_data_d1_Q2_3 : std_logic_vector(15 DOWNTO 0);
  SIGNAL S_data_d1_Q3_3 : std_logic_vector(15 DOWNTO 0);

  -----------------------------------I0路的流水寄存器---------------------------------

  --------------------------------第一级流水参数-----------------------------------
  SIGNAL S_data_pipel0_I0_0 : std_logic_vector(16 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel0_I0_1 : std_logic_vector(16 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel0_I0_2 : std_logic_vector(16 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel0_I0_3 : std_logic_vector(16 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel0_I0_4 : std_logic_vector(16 DOWNTO 0) := (OTHERS => '0');

  --------------------------------第二级流水参数-----------------------------------
  SIGNAL S_data_pipel1_I0_0 : std_logic_vector(32 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel1_I0_1 : std_logic_vector(32 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel1_I0_2 : std_logic_vector(32 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel1_I0_3 : std_logic_vector(32 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel1_I0_4 : std_logic_vector(32 DOWNTO 0) := (OTHERS => '0');
  --------------------------------第三级流水参数-----------------------------------
  SIGNAL S_data_pipel2_I0_0 : std_logic_vector(32 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel2_I0_1 : std_logic_vector(32 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel2_I0_2 : std_logic_vector(32 DOWNTO 0) := (OTHERS => '0');

  --------------------------------第四级流水参数-----------------------------------
  SIGNAL S_data_pipel3_I0_0 : std_logic_vector(33 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel3_I0_1 : std_logic_vector(33 DOWNTO 0) := (OTHERS => '0');

  --------------------------------第五级流水参数-----------------------------------
  SIGNAL S_data_pipel4_I0 : std_logic_vector(34 DOWNTO 0);
  -----------------------------------I1路的流水寄存器---------------------------------

  --------------------------------第一级流水参数-----------------------------------
  SIGNAL S_data_pipel0_I1_0 : std_logic_vector(16 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel0_I1_1 : std_logic_vector(16 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel0_I1_2 : std_logic_vector(16 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel0_I1_3 : std_logic_vector(16 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel0_I1_4 : std_logic_vector(16 DOWNTO 0) := (OTHERS => '0');

  --------------------------------第二级流水参数-----------------------------------
  SIGNAL S_data_pipel1_I1_0 : std_logic_vector(32 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel1_I1_1 : std_logic_vector(32 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel1_I1_2 : std_logic_vector(32 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel1_I1_3 : std_logic_vector(32 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel1_I1_4 : std_logic_vector(32 DOWNTO 0) := (OTHERS => '0');
  --------------------------------第三级流水参数-----------------------------------
  SIGNAL S_data_pipel2_I1_0 : std_logic_vector(32 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel2_I1_1 : std_logic_vector(32 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel2_I1_2 : std_logic_vector(32 DOWNTO 0) := (OTHERS => '0');

  --------------------------------第四级流水参数-----------------------------------
  SIGNAL S_data_pipel3_I1_0 : std_logic_vector(33 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel3_I1_1 : std_logic_vector(33 DOWNTO 0) := (OTHERS => '0');

  --------------------------------第五级流水参数-----------------------------------
  SIGNAL S_data_pipel4_I1 : std_logic_vector(34 DOWNTO 0);
  -----------------------------------Q0路的流水寄存器---------------------------------

  --------------------------------第一级流水参数-----------------------------------
  SIGNAL S_data_pipel0_Q0_0 : std_logic_vector(16 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel0_Q0_1 : std_logic_vector(16 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel0_Q0_2 : std_logic_vector(16 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel0_Q0_3 : std_logic_vector(16 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel0_Q0_4 : std_logic_vector(16 DOWNTO 0) := (OTHERS => '0');

  --------------------------------第二级流水参数-----------------------------------
  SIGNAL S_data_pipel1_Q0_0 : std_logic_vector(32 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel1_Q0_1 : std_logic_vector(32 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel1_Q0_2 : std_logic_vector(32 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel1_Q0_3 : std_logic_vector(32 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel1_Q0_4 : std_logic_vector(32 DOWNTO 0) := (OTHERS => '0');
  --------------------------------第三级流水参数-----------------------------------
  SIGNAL S_data_pipel2_Q0_0 : std_logic_vector(32 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel2_Q0_1 : std_logic_vector(32 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel2_Q0_2 : std_logic_vector(32 DOWNTO 0) := (OTHERS => '0');

  --------------------------------第四级流水参数-----------------------------------
  SIGNAL S_data_pipel3_Q0_0 : std_logic_vector(33 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel3_Q0_1 : std_logic_vector(33 DOWNTO 0) := (OTHERS => '0');

  --------------------------------第五级流水参数-----------------------------------
  SIGNAL S_data_pipel4_Q0 : std_logic_vector(34 DOWNTO 0);
  -----------------------------------Q1路的流水寄存器---------------------------------

  --------------------------------第一级流水参数-----------------------------------
  SIGNAL S_data_pipel0_Q1_0 : std_logic_vector(16 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel0_Q1_1 : std_logic_vector(16 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel0_Q1_2 : std_logic_vector(16 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel0_Q1_3 : std_logic_vector(16 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel0_Q1_4 : std_logic_vector(16 DOWNTO 0) := (OTHERS => '0');

  --------------------------------第二级流水参数-----------------------------------
  SIGNAL S_data_pipel1_Q1_0 : std_logic_vector(32 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel1_Q1_1 : std_logic_vector(32 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel1_Q1_2 : std_logic_vector(32 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel1_Q1_3 : std_logic_vector(32 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel1_Q1_4 : std_logic_vector(32 DOWNTO 0) := (OTHERS => '0');
  --------------------------------第三级流水参数-----------------------------------
  SIGNAL S_data_pipel2_Q1_0 : std_logic_vector(32 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel2_Q1_1 : std_logic_vector(32 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel2_Q1_2 : std_logic_vector(32 DOWNTO 0) := (OTHERS => '0');

  --------------------------------第四级流水参数-----------------------------------
  SIGNAL S_data_pipel3_Q1_0 : std_logic_vector(33 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel3_Q1_1 : std_logic_vector(33 DOWNTO 0) := (OTHERS => '0');

  --------------------------------第五级流水参数-----------------------------------
  SIGNAL S_data_pipel4_Q1 : std_logic_vector(34 DOWNTO 0);

BEGIN

  P_input_pipel : PROCESS (I_clk, I_rst_n)
  BEGIN
    IF I_rst_n = '0' THEN
      S_data_d1_I0_0 <= (OTHERS => '0');
      S_data_d1_I1_0 <= (OTHERS => '0');
      S_data_d1_I2_0 <= (OTHERS => '0');
      S_data_d1_I3_0 <= (OTHERS => '0');
      S_data_d1_Q0_0 <= (OTHERS => '0');
      S_data_d1_Q1_0 <= (OTHERS => '0');
      S_data_d1_Q2_0 <= (OTHERS => '0');
      S_data_d1_Q3_0 <= (OTHERS => '0');

      S_data_d1_I0_1 <= (OTHERS => '0');
      S_data_d1_I1_1 <= (OTHERS => '0');
      S_data_d1_I2_1 <= (OTHERS => '0');
      S_data_d1_I3_1 <= (OTHERS => '0');
      S_data_d1_Q0_1 <= (OTHERS => '0');
      S_data_d1_Q1_1 <= (OTHERS => '0');
      S_data_d1_Q2_1 <= (OTHERS => '0');
      S_data_d1_Q3_1 <= (OTHERS => '0');

      S_data_d1_I0_2 <= (OTHERS => '0');
      S_data_d1_I1_2 <= (OTHERS => '0');
      S_data_d1_I2_2 <= (OTHERS => '0');
      S_data_d1_I3_2 <= (OTHERS => '0');
      S_data_d1_Q0_2 <= (OTHERS => '0');
      S_data_d1_Q1_2 <= (OTHERS => '0');
      S_data_d1_Q2_2 <= (OTHERS => '0');
      S_data_d1_Q3_2 <= (OTHERS => '0');
    ELSIF rising_edge(I_clk) THEN
      S_data_d1_I0_0 <= I_data_d1_I0;
      S_data_d1_I1_0 <= I_data_d1_I1;
      S_data_d1_I2_0 <= I_data_d1_I2;
      S_data_d1_I3_0 <= I_data_d1_I3;
      S_data_d1_Q0_0 <= I_data_d1_Q0;
      S_data_d1_Q1_0 <= I_data_d1_Q1;
      S_data_d1_Q2_0 <= I_data_d1_Q2;
      S_data_d1_Q3_0 <= I_data_d1_Q3;

      S_data_d1_I0_1 <= S_data_d1_I0_0;
      S_data_d1_I1_1 <= S_data_d1_I1_0;
      S_data_d1_I2_1 <= S_data_d1_I2_0;
      S_data_d1_I3_1 <= S_data_d1_I3_0;
      S_data_d1_Q0_1 <= S_data_d1_Q0_0;
      S_data_d1_Q1_1 <= S_data_d1_Q1_0;
      S_data_d1_Q2_1 <= S_data_d1_Q2_0;
      S_data_d1_Q3_1 <= S_data_d1_Q3_0;

      S_data_d1_I0_2 <= S_data_d1_I0_1;
      S_data_d1_I1_2 <= S_data_d1_I1_1;
      S_data_d1_I2_2 <= S_data_d1_I2_1;
      S_data_d1_I3_2 <= S_data_d1_I3_1;
      S_data_d1_Q0_2 <= S_data_d1_Q0_1;
      S_data_d1_Q1_2 <= S_data_d1_Q1_1;
      S_data_d1_Q2_2 <= S_data_d1_Q2_1;
      S_data_d1_Q3_2 <= S_data_d1_Q3_1;

      S_data_d1_I0_3 <= S_data_d1_I0_2;
      S_data_d1_I1_3 <= S_data_d1_I1_2;
      S_data_d1_I2_3 <= S_data_d1_I2_2;
      S_data_d1_I3_3 <= S_data_d1_I3_2;
      S_data_d1_Q0_3 <= S_data_d1_Q0_2;
      S_data_d1_Q1_3 <= S_data_d1_Q1_2;
      S_data_d1_Q2_3 <= S_data_d1_Q2_2;
      S_data_d1_Q3_3 <= S_data_d1_Q3_2;
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
      S_data_pipel0_I0_0 <= S_data_d1_I3_2(15) & S_data_d1_I3_2;
      S_data_pipel0_I0_1 <= (S_data_d1_I0_3(15) & S_data_d1_I0_3) + (S_data_d1_I2_0(15) & S_data_d1_I2_0);
      S_data_pipel0_I0_2 <= (S_data_d1_I2_3(15) & S_data_d1_I2_3) + (S_data_d1_I0_0(15) & S_data_d1_I0_0);
      S_data_pipel0_I0_3 <= (S_data_d1_I0_2(15) & S_data_d1_I0_2) + (S_data_d1_I2_1(15) & S_data_d1_I2_1);
      S_data_pipel0_I0_4 <= (S_data_d1_I2_2(15) & S_data_d1_I2_2) + (S_data_d1_I0_1(15) & S_data_d1_I0_1);
      -------------------第三级流水 32位扩位相加-------------------------
      S_data_pipel2_I0_0 <= (S_data_pipel1_I0_0(31) & S_data_pipel1_I0_0(31 DOWNTO 0)) + (S_data_pipel1_I0_1(31) & S_data_pipel1_I0_1(31 DOWNTO 0));
      S_data_pipel2_I0_1 <= (S_data_pipel1_I0_2(31) & S_data_pipel1_I0_2(31 DOWNTO 0));
      S_data_pipel2_I0_2 <= (S_data_pipel1_I0_3(31) & S_data_pipel1_I0_3(31 DOWNTO 0)) + (S_data_pipel1_I0_4(31) & S_data_pipel1_I0_4(31 DOWNTO 0));
      -------------------第四级流水 33位扩位相加-------------------------
      S_data_pipel3_I0_0 <= (S_data_pipel2_I0_0(32) & S_data_pipel2_I0_0);
      S_data_pipel3_I0_1 <= (S_data_pipel2_I0_1(32) & S_data_pipel2_I0_1) + (S_data_pipel2_I0_2(32) & S_data_pipel2_I0_2);
      -------------------第五级流水 26----------------------------------
      S_data_pipel4_I0 <= (S_data_pipel3_I0_0(33) & S_data_pipel3_I0_0) + (S_data_pipel3_I0_1(33) & S_data_pipel3_I0_1);
    END IF;
  END PROCESS;

  I0_p1_0_mult_gen_d2_int : mult_gen_d2_int
  PORT MAP(
    CLK  => I_clk,
    A    => S_data_pipel0_I0_0,
    B    => HB_COE7,
    CE   => I_rst_n,
    SCLR => '0',
    P    => S_data_pipel1_I0_0
  );
  I0_p1_1_mult_gen_d2_int : mult_gen_d2_int
  PORT MAP(
    CLK  => I_clk,
    A    => S_data_pipel0_I0_1,
    B    => HB_COE0,
    CE   => I_rst_n,
    SCLR => '0',
    P    => S_data_pipel1_I0_1
  );

  I0_p1_2_mult_gen_d2_int : mult_gen_d2_int
  PORT MAP(
    CLK  => I_clk,
    A    => S_data_pipel0_I0_2,
    B    => HB_COE2,
    CE   => I_rst_n,
    SCLR => '0',
    P    => S_data_pipel1_I0_2
  );

  I0_p1_3_mult_gen_d2_int : mult_gen_d2_int
  PORT MAP(
    CLK  => I_clk,
    A    => S_data_pipel0_I0_3,
    B    => HB_COE4,
    CE   => I_rst_n,
    SCLR => '0',
    P    => S_data_pipel1_I0_3
  );

  I0_p1_4_mult_gen_d2_int : mult_gen_d2_int
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
      S_data_pipel0_I1_0 <= S_data_d1_I1_1(15) & S_data_d1_I1_1;
      S_data_pipel0_I1_1 <= (S_data_d1_I2_3(15) & S_data_d1_I2_3) + (I_data_d1_I0(15) & I_data_d1_I0);
      S_data_pipel0_I1_2 <= (S_data_d1_I0_2(15) & S_data_d1_I0_2) + (S_data_d1_I2_0(15) & S_data_d1_I2_0);
      S_data_pipel0_I1_3 <= (S_data_d1_I2_2(15) & S_data_d1_I2_2) + (S_data_d1_I0_0(15) & S_data_d1_I0_0);
      S_data_pipel0_I1_4 <= (S_data_d1_I0_1(15) & S_data_d1_I0_1) + (S_data_d1_I2_1(15) & S_data_d1_I2_1);
      -------------------第三级流水 32位扩位相加-------------------------
      S_data_pipel2_I1_0 <= (S_data_pipel1_I1_0(31) & S_data_pipel1_I1_0(31 DOWNTO 0)) + (S_data_pipel1_I1_1(31) & S_data_pipel1_I1_1(31 DOWNTO 0));
      S_data_pipel2_I1_1 <= (S_data_pipel1_I1_2(31) & S_data_pipel1_I1_2(31 DOWNTO 0));
      S_data_pipel2_I1_2 <= (S_data_pipel1_I1_3(31) & S_data_pipel1_I1_3(31 DOWNTO 0)) + (S_data_pipel1_I1_4(31) & S_data_pipel1_I1_4(31 DOWNTO 0));
      -------------------第四级流水 33位扩位相加-------------------------
      S_data_pipel3_I1_0 <= (S_data_pipel2_I1_0(32) & S_data_pipel2_I1_0);
      S_data_pipel3_I1_1 <= (S_data_pipel2_I1_1(32) & S_data_pipel2_I1_1) + (S_data_pipel2_I1_2(32) & S_data_pipel2_I1_2);
      -------------------第五级流水 26----------------------------------
      S_data_pipel4_I1 <= (S_data_pipel3_I1_0(33) & S_data_pipel3_I1_0) + (S_data_pipel3_I1_1(33) & S_data_pipel3_I1_1);
    END IF;
  END PROCESS;

  I1_p1_0_mult_gen_d2_int : mult_gen_d2_int
  PORT MAP(
    CLK  => I_clk,
    A    => S_data_pipel0_I1_0,
    B    => HB_COE7,
    CE   => I_rst_n,
    SCLR => '0',
    P    => S_data_pipel1_I1_0
  );
  I1_p1_1_mult_gen_d2_int : mult_gen_d2_int
  PORT MAP(
    CLK  => I_clk,
    A    => S_data_pipel0_I1_1,
    B    => HB_COE0,
    CE   => I_rst_n,
    SCLR => '0',
    P    => S_data_pipel1_I1_1
  );

  I1_p1_2_mult_gen_d2_int : mult_gen_d2_int
  PORT MAP(
    CLK  => I_clk,
    A    => S_data_pipel0_I1_2,
    B    => HB_COE2,
    CE   => I_rst_n,
    SCLR => '0',
    P    => S_data_pipel1_I1_2
  );

  I1_p1_3_mult_gen_d2_int : mult_gen_d2_int
  PORT MAP(
    CLK  => I_clk,
    A    => S_data_pipel0_I1_3,
    B    => HB_COE4,
    CE   => I_rst_n,
    SCLR => '0',
    P    => S_data_pipel1_I1_3
  );

  I1_p1_4_mult_gen_d2_int : mult_gen_d2_int
  PORT MAP(
    CLK  => I_clk,
    A    => S_data_pipel0_I1_4,
    B    => HB_COE6,
    CE   => I_rst_n,
    SCLR => '0',
    P    => S_data_pipel1_I1_4
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
        S_data_pipel0_Q0_0 <= S_data_d1_Q3_2(15) & S_data_d1_Q3_2;
        S_data_pipel0_Q0_1 <= (S_data_d1_Q0_3(15) & S_data_d1_Q0_3) + (S_data_d1_Q2_0(15) & S_data_d1_Q2_0);
        S_data_pipel0_Q0_2 <= (S_data_d1_Q2_3(15) & S_data_d1_Q2_3) + (S_data_d1_Q0_0(15) & S_data_d1_Q0_0);
        S_data_pipel0_Q0_3 <= (S_data_d1_Q0_2(15) & S_data_d1_Q0_2) + (S_data_d1_Q2_1(15) & S_data_d1_Q2_1);
        S_data_pipel0_Q0_4 <= (S_data_d1_Q2_2(15) & S_data_d1_Q2_2) + (S_data_d1_Q0_1(15) & S_data_d1_Q0_1);
        -------------------第三级流水 32位扩位相加-------------------------
        S_data_pipel2_Q0_0 <= (S_data_pipel1_Q0_0(31) & S_data_pipel1_Q0_0(31 DOWNTO 0)) + (S_data_pipel1_Q0_1(31) & S_data_pipel1_Q0_1(31 DOWNTO 0));
        S_data_pipel2_Q0_1 <= (S_data_pipel1_Q0_2(31) & S_data_pipel1_Q0_2(31 DOWNTO 0));
        S_data_pipel2_Q0_2 <= (S_data_pipel1_Q0_3(31) & S_data_pipel1_Q0_3(31 DOWNTO 0)) + (S_data_pipel1_Q0_4(31) & S_data_pipel1_Q0_4(31 DOWNTO 0));
        -------------------第四级流水 33位扩位相加-------------------------
        S_data_pipel3_Q0_0 <= (S_data_pipel2_Q0_0(32) & S_data_pipel2_Q0_0);
        S_data_pipel3_Q0_1 <= (S_data_pipel2_Q0_1(32) & S_data_pipel2_Q0_1) + (S_data_pipel2_Q0_2(32) & S_data_pipel2_Q0_2);
        -------------------第五级流水 26----------------------------------
        S_data_pipel4_Q0 <= (S_data_pipel3_Q0_0(33) & S_data_pipel3_Q0_0) + (S_data_pipel3_Q0_1(33) & S_data_pipel3_Q0_1);
      END IF;
    END PROCESS;
  
    Q0_p1_0_mult_gen_d2_int : mult_gen_d2_int
    PORT MAP(
      CLK  => I_clk,
      A    => S_data_pipel0_Q0_0,
      B    => HB_COE7,
      CE   => I_rst_n,
      SCLR => '0',
      P    => S_data_pipel1_Q0_0
    );
    Q0_p1_1_mult_gen_d2_int : mult_gen_d2_int
    PORT MAP(
      CLK  => I_clk,
      A    => S_data_pipel0_Q0_1,
      B    => HB_COE0,
      CE   => I_rst_n,
      SCLR => '0',
      P    => S_data_pipel1_Q0_1
    );
  
    Q0_p1_2_mult_gen_d2_int : mult_gen_d2_int
    PORT MAP(
      CLK  => I_clk,
      A    => S_data_pipel0_Q0_2,
      B    => HB_COE2,
      CE   => I_rst_n,
      SCLR => '0',
      P    => S_data_pipel1_Q0_2
    );
  
    Q0_p1_3_mult_gen_d2_int : mult_gen_d2_int
    PORT MAP(
      CLK  => I_clk,
      A    => S_data_pipel0_Q0_3,
      B    => HB_COE4,
      CE   => I_rst_n,
      SCLR => '0',
      P    => S_data_pipel1_Q0_3
    );
  
    Q0_p1_4_mult_gen_d2_int : mult_gen_d2_int
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
        S_data_pipel0_Q1_0 <= S_data_d1_Q1_1(15) & S_data_d1_Q1_1;
        S_data_pipel0_Q1_1 <= (S_data_d1_Q2_3(15) & S_data_d1_Q2_3) + (I_data_d1_Q0(15) & I_data_d1_Q0);
        S_data_pipel0_Q1_2 <= (S_data_d1_Q0_2(15) & S_data_d1_Q0_2) + (S_data_d1_Q2_0(15) & S_data_d1_Q2_0);
        S_data_pipel0_Q1_3 <= (S_data_d1_Q2_2(15) & S_data_d1_Q2_2) + (S_data_d1_Q0_0(15) & S_data_d1_Q0_0);
        S_data_pipel0_Q1_4 <= (S_data_d1_Q0_1(15) & S_data_d1_Q0_1) + (S_data_d1_Q2_1(15) & S_data_d1_Q2_1);
        -------------------第三级流水 32位扩位相加-------------------------
        S_data_pipel2_Q1_0 <= (S_data_pipel1_Q1_0(31) & S_data_pipel1_Q1_0(31 DOWNTO 0)) + (S_data_pipel1_Q1_1(31) & S_data_pipel1_Q1_1(31 DOWNTO 0));
        S_data_pipel2_Q1_1 <= (S_data_pipel1_Q1_2(31) & S_data_pipel1_Q1_2(31 DOWNTO 0));
        S_data_pipel2_Q1_2 <= (S_data_pipel1_Q1_3(31) & S_data_pipel1_Q1_3(31 DOWNTO 0)) + (S_data_pipel1_Q1_4(31) & S_data_pipel1_Q1_4(31 DOWNTO 0));
        -------------------第四级流水 33位扩位相加-------------------------
        S_data_pipel3_Q1_0 <= (S_data_pipel2_Q1_0(32) & S_data_pipel2_Q1_0);
        S_data_pipel3_Q1_1 <= (S_data_pipel2_Q1_1(32) & S_data_pipel2_Q1_1) + (S_data_pipel2_Q1_2(32) & S_data_pipel2_Q1_2);
        -------------------第五级流水 26----------------------------------
        S_data_pipel4_Q1 <= (S_data_pipel3_Q1_0(33) & S_data_pipel3_Q1_0) + (S_data_pipel3_Q1_1(33) & S_data_pipel3_Q1_1);
      END IF;
    END PROCESS;
  
    Q1_p1_0_mult_gen_d2_int : mult_gen_d2_int
    PORT MAP(
      CLK  => I_clk,
      A    => S_data_pipel0_Q1_0,
      B    => HB_COE7,
      CE   => I_rst_n,
      SCLR => '0',
      P    => S_data_pipel1_Q1_0
    );
    Q1_p1_1_mult_gen_d2_int : mult_gen_d2_int
    PORT MAP(
      CLK  => I_clk,
      A    => S_data_pipel0_Q1_1,
      B    => HB_COE0,
      CE   => I_rst_n,
      SCLR => '0',
      P    => S_data_pipel1_Q1_1
    );
  
    Q1_p1_2_mult_gen_d2_int : mult_gen_d2_int
    PORT MAP(
      CLK  => I_clk,
      A    => S_data_pipel0_Q1_2,
      B    => HB_COE2,
      CE   => I_rst_n,
      SCLR => '0',
      P    => S_data_pipel1_Q1_2
    );
  
    Q1_p1_3_mult_gen_d2_int : mult_gen_d2_int
    PORT MAP(
      CLK  => I_clk,
      A    => S_data_pipel0_Q1_3,
      B    => HB_COE4,
      CE   => I_rst_n,
      SCLR => '0',
      P    => S_data_pipel1_Q1_3
    );
  
    Q1_p1_4_mult_gen_d2_int : mult_gen_d2_int
    PORT MAP(
      CLK  => I_clk,
      A    => S_data_pipel0_Q1_4,
      B    => HB_COE6,
      CE   => I_rst_n,
      SCLR => '0',
      P    => S_data_pipel1_Q1_4
    );

  O_data_d2_I0 <= S_data_pipel4_I0(30 DOWNTO 15) + S_data_pipel4_I0(14);
  O_data_d2_I1 <= S_data_pipel4_I1(30 DOWNTO 15) + S_data_pipel4_I1(14);
  O_data_d2_Q0 <= S_data_pipel4_Q0(30 DOWNTO 15) + S_data_pipel4_Q0(14);
  O_data_d2_Q1 <= S_data_pipel4_Q1(30 DOWNTO 15) + S_data_pipel4_Q1(14);
END ARCHITECTURE;