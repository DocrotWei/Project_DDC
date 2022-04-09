----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2022/04/09 15:02:11
-- Design Name: 
-- Module Name: ddc_decimal_int5 - Behavioral
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

ENTITY ddc_decimal_int5 IS
  PORT (
    --------------------时钟---------------------------
    I_clk   : IN std_logic;
    I_rst_n : IN std_logic;
    -------------------第四级抽取输出信号--------------------------

    I_data_d4_I0 : IN std_logic_vector(15 DOWNTO 0);
    I_data_d4_Q0 : IN std_logic_vector(15 DOWNTO 0);

    -------------------第五级抽取输出信号--------------------------

    O_data_d5_I0 : OUT std_logic_vector(11 DOWNTO 0);
    O_data_d5_Q0 : OUT std_logic_vector(11 DOWNTO 0)
  );
END ENTITY ddc_decimal_int5;
ARCHITECTURE rtl OF ddc_decimal_int5 IS
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
  CONSTANT FIR_COE0 : std_logic_vector(15 DOWNTO 0) := conv_std_logic_vector(-39, 16);
  CONSTANT FIR_COE1 : std_logic_vector(15 DOWNTO 0) := conv_std_logic_vector(-100, 16);
  CONSTANT FIR_COE2 : std_logic_vector(15 DOWNTO 0) := conv_std_logic_vector(23, 16);
  CONSTANT FIR_COE3 : std_logic_vector(15 DOWNTO 0) := conv_std_logic_vector(758, 16);
  CONSTANT FIR_COE4 : std_logic_vector(15 DOWNTO 0) := conv_std_logic_vector(2452, 16);
  CONSTANT FIR_COE5 : std_logic_vector(15 DOWNTO 0) := conv_std_logic_vector(4893, 16);
  CONSTANT FIR_COE6 : std_logic_vector(15 DOWNTO 0) := conv_std_logic_vector(7149, 16);
  CONSTANT FIR_COE7 : std_logic_vector(15 DOWNTO 0) := conv_std_logic_vector(8075, 16);
  -----------------------------------输入信号流水-----------------------------------------

  SIGNAL S_data_d3_I0_0 : std_logic_vector(15 DOWNTO 0);
  SIGNAL S_data_d3_Q0_0 : std_logic_vector(15 DOWNTO 0);

  SIGNAL S_data_d3_I0_1 : std_logic_vector(15 DOWNTO 0);
  SIGNAL S_data_d3_Q0_1 : std_logic_vector(15 DOWNTO 0);

  SIGNAL S_data_d3_I0_2 : std_logic_vector(15 DOWNTO 0);
  SIGNAL S_data_d3_Q0_2 : std_logic_vector(15 DOWNTO 0);

  SIGNAL S_data_d3_I0_3 : std_logic_vector(15 DOWNTO 0);
  SIGNAL S_data_d3_Q0_3 : std_logic_vector(15 DOWNTO 0);

  SIGNAL S_data_d3_I0_4 : std_logic_vector(15 DOWNTO 0);
  SIGNAL S_data_d3_Q0_4 : std_logic_vector(15 DOWNTO 0);

  SIGNAL S_data_d3_I0_5 : std_logic_vector(15 DOWNTO 0);
  SIGNAL S_data_d3_Q0_5 : std_logic_vector(15 DOWNTO 0);

  SIGNAL S_data_d3_I0_6 : std_logic_vector(15 DOWNTO 0);
  SIGNAL S_data_d3_Q0_6 : std_logic_vector(15 DOWNTO 0);

  SIGNAL S_data_d3_I0_7 : std_logic_vector(15 DOWNTO 0);
  SIGNAL S_data_d3_Q0_7 : std_logic_vector(15 DOWNTO 0);

  SIGNAL S_data_d3_I0_8 : std_logic_vector(15 DOWNTO 0);
  SIGNAL S_data_d3_Q0_8 : std_logic_vector(15 DOWNTO 0);

  SIGNAL S_data_d3_I0_9 : std_logic_vector(15 DOWNTO 0);
  SIGNAL S_data_d3_Q0_9 : std_logic_vector(15 DOWNTO 0);

  SIGNAL S_data_d3_I0_10 : std_logic_vector(15 DOWNTO 0);
  SIGNAL S_data_d3_Q0_10 : std_logic_vector(15 DOWNTO 0);

  SIGNAL S_data_d3_I0_11 : std_logic_vector(15 DOWNTO 0);
  SIGNAL S_data_d3_Q0_11 : std_logic_vector(15 DOWNTO 0);

  SIGNAL S_data_d3_I0_12 : std_logic_vector(15 DOWNTO 0);
  SIGNAL S_data_d3_Q0_12 : std_logic_vector(15 DOWNTO 0);

  SIGNAL S_data_d3_I0_13 : std_logic_vector(15 DOWNTO 0);
  SIGNAL S_data_d3_Q0_13 : std_logic_vector(15 DOWNTO 0);

  -----------------------------------I路的流水寄存器---------------------------------

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
  -----------------------------------Q路的流水寄存器---------------------------------

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

BEGIN
  P_input_pipel : PROCESS (I_clk, I_rst_n)
  BEGIN

    IF I_rst_n = '0' THEN

      S_data_d3_I0_0 <= (OTHERS => '0');
      S_data_d3_Q0_0 <= (OTHERS => '0');

      S_data_d3_I0_1 <= (OTHERS => '0');
      S_data_d3_Q0_1 <= (OTHERS => '0');

      S_data_d3_I0_2 <= (OTHERS => '0');
      S_data_d3_Q0_2 <= (OTHERS => '0');

      S_data_d3_I0_3 <= (OTHERS => '0');
      S_data_d3_Q0_3 <= (OTHERS => '0');

      S_data_d3_I0_4 <= (OTHERS => '0');
      S_data_d3_Q0_4 <= (OTHERS => '0');

      S_data_d3_I0_5 <= (OTHERS => '0');
      S_data_d3_Q0_5 <= (OTHERS => '0');

      S_data_d3_I0_6 <= (OTHERS => '0');
      S_data_d3_Q0_6 <= (OTHERS => '0');

      S_data_d3_I0_7 <= (OTHERS => '0');
      S_data_d3_Q0_7 <= (OTHERS => '0');

      S_data_d3_I0_8 <= (OTHERS => '0');
      S_data_d3_Q0_8 <= (OTHERS => '0');

      S_data_d3_I0_9 <= (OTHERS => '0');
      S_data_d3_Q0_9 <= (OTHERS => '0');

      S_data_d3_I0_10 <= (OTHERS => '0');
      S_data_d3_Q0_10 <= (OTHERS => '0');

      S_data_d3_I0_11 <= (OTHERS => '0');
      S_data_d3_Q0_11 <= (OTHERS => '0');

      S_data_d3_I0_12 <= (OTHERS => '0');
      S_data_d3_Q0_12 <= (OTHERS => '0');

      S_data_d3_I0_13 <= (OTHERS => '0');
      S_data_d3_Q0_13 <= (OTHERS => '0');

    ELSIF rising_edge(I_clk) THEN

      S_data_d3_I0_0 <= I_data_d4_I0;
      S_data_d3_Q0_0 <= I_data_d4_Q0;

      S_data_d3_I0_1 <= S_data_d3_I0_0;
      S_data_d3_Q0_1 <= S_data_d3_Q0_0;

      S_data_d3_I0_2 <= S_data_d3_I0_1;
      S_data_d3_Q0_2 <= S_data_d3_Q0_1;

      S_data_d3_I0_3 <= S_data_d3_I0_2;
      S_data_d3_Q0_3 <= S_data_d3_Q0_2;

      S_data_d3_I0_4 <= S_data_d3_I0_3;
      S_data_d3_Q0_4 <= S_data_d3_Q0_3;

      S_data_d3_I0_5 <= S_data_d3_I0_4;
      S_data_d3_Q0_5 <= S_data_d3_Q0_4;

      S_data_d3_I0_6 <= S_data_d3_I0_5;
      S_data_d3_Q0_6 <= S_data_d3_Q0_5;

      S_data_d3_I0_7 <= S_data_d3_I0_6;
      S_data_d3_Q0_7 <= S_data_d3_Q0_6;

      S_data_d3_I0_8 <= S_data_d3_I0_7;
      S_data_d3_Q0_8 <= S_data_d3_Q0_7;

      S_data_d3_I0_9 <= S_data_d3_I0_8;
      S_data_d3_Q0_9 <= S_data_d3_Q0_8;

      S_data_d3_I0_10 <= S_data_d3_I0_9;
      S_data_d3_Q0_10 <= S_data_d3_Q0_9;

      S_data_d3_I0_11 <= S_data_d3_I0_10;
      S_data_d3_Q0_11 <= S_data_d3_Q0_10;

      S_data_d3_I0_12 <= S_data_d3_I0_11;
      S_data_d3_Q0_12 <= S_data_d3_Q0_11;

      S_data_d3_I0_13 <= S_data_d3_I0_13;
      S_data_d3_Q0_13 <= S_data_d3_Q0_13;

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
    S_data_pipel0_I0_0 <= S_data_d3_I0_6(15) & S_data_d3_I0_6;
    S_data_pipel0_I0_1 <= (S_data_d3_I0_13(15) & S_data_d3_I0_13) + (I_data_d4_I0(15) & I_data_d4_I0);
    S_data_pipel0_I0_2 <= (S_data_d3_I0_11(15) & S_data_d3_I0_11) + (S_data_d3_I0_1(15) & S_data_d3_I0_1);
    S_data_pipel0_I0_3 <= (S_data_d3_I0_9(15) & S_data_d3_I0_9) + (S_data_d3_I0_3(15) & S_data_d3_I0_3);
    S_data_pipel0_I0_4 <= (S_data_d3_I0_7(15) & S_data_d3_I0_7) + (S_data_d3_I0_5(15) & S_data_d3_I0_5);
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

I0_p1_0_mult_gen_d4_int : mult_gen_d2_int
PORT MAP(
  CLK  => I_clk,
  A    => S_data_pipel0_I0_0,
  B    => FIR_COE7,
  CE   => I_rst_n,
  SCLR => '0',
  P    => S_data_pipel1_I0_0
);

I0_p1_1_mult_gen_d4_int : mult_gen_d2_int
PORT MAP(
  CLK  => I_clk,
  A    => S_data_pipel0_I0_1,
  B    => FIR_COE0,
  CE   => I_rst_n,
  SCLR => '0',
  P    => S_data_pipel1_I0_1
);

I0_p1_2_mult_gen_d4_int : mult_gen_d2_int
PORT MAP(
  CLK  => I_clk,
  A    => S_data_pipel0_I0_2,
  B    => FIR_COE2,
  CE   => I_rst_n,
  SCLR => '0',
  P    => S_data_pipel1_I0_2
);

I0_p1_3_mult_gen_d4_int : mult_gen_d2_int
PORT MAP(
  CLK  => I_clk,
  A    => S_data_pipel0_I0_3,
  B    => FIR_COE4,
  CE   => I_rst_n,
  SCLR => '0',
  P    => S_data_pipel1_I0_3
);

I0_p1_4_mult_gen_d4_int : mult_gen_d2_int
PORT MAP(
  CLK  => I_clk,
  A    => S_data_pipel0_I0_4,
  B    => FIR_COE6,
  CE   => I_rst_n,
  SCLR => '0',
  P    => S_data_pipel1_I0_4
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
    S_data_pipel0_Q0_0 <= S_data_d3_Q0_6(15) & S_data_d3_Q0_6;
    S_data_pipel0_Q0_1 <= (S_data_d3_Q0_13(15) & S_data_d3_Q0_13) + (I_data_d4_Q0(15) & I_data_d4_Q0);
    S_data_pipel0_Q0_2 <= (S_data_d3_Q0_11(15) & S_data_d3_Q0_11) + (S_data_d3_Q0_1(15) & S_data_d3_Q0_1);
    S_data_pipel0_Q0_3 <= (S_data_d3_Q0_9(15) & S_data_d3_Q0_9) + (S_data_d3_Q0_3(15) & S_data_d3_Q0_3);
    S_data_pipel0_Q0_4 <= (S_data_d3_Q0_7(15) & S_data_d3_Q0_7) + (S_data_d3_Q0_5(15) & S_data_d3_Q0_5);
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

Q0_p1_0_mult_gen_d4_int : mult_gen_d2_int
PORT MAP(
  CLK  => I_clk,
  A    => S_data_pipel0_Q0_0,
  B    => FIR_COE7,
  CE   => I_rst_n,
  SCLR => '0',
  P    => S_data_pipel1_Q0_0
);

Q0_p1_1_mult_gen_d4_int : mult_gen_d2_int
PORT MAP(
  CLK  => I_clk,
  A    => S_data_pipel0_Q0_1,
  B    => FIR_COE0,
  CE   => I_rst_n,
  SCLR => '0',
  P    => S_data_pipel1_Q0_1
);

Q0_p1_2_mult_gen_d4_int : mult_gen_d2_int
PORT MAP(
  CLK  => I_clk,
  A    => S_data_pipel0_Q0_2,
  B    => FIR_COE2,
  CE   => I_rst_n,
  SCLR => '0',
  P    => S_data_pipel1_Q0_2
);

Q0_p1_3_mult_gen_d4_int : mult_gen_d2_int
PORT MAP(
  CLK  => I_clk,
  A    => S_data_pipel0_Q0_3,
  B    => FIR_COE4,
  CE   => I_rst_n,
  SCLR => '0',
  P    => S_data_pipel1_Q0_3
);

Q0_p1_4_mult_gen_d4_int : mult_gen_d2_int
PORT MAP(
  CLK  => I_clk,
  A    => S_data_pipel0_Q0_4,
  B    => FIR_COE6,
  CE   => I_rst_n,
  SCLR => '0',
  P    => S_data_pipel1_Q0_4
);
  

O_data_d5_I0 <= S_data_pipel4_I0(26 DOWNTO 15) + S_data_pipel4_I0(14);
O_data_d5_Q0 <= S_data_pipel4_Q0(26 DOWNTO 15) + S_data_pipel4_Q0(14);
END ARCHITECTURE;