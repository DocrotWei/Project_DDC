----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2022/04/08 14:42:10
-- Design Name: 
-- Module Name: ddc_decimal_int_ctr - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

ENTITY ddc_decimal_int_ctr IS
  PORT (
    I_clk   : IN std_logic;
    I_rst_n : IN std_logic;

    ----------------------下变频输入信号--------------------------------
    I_data_mod_I0  : IN std_logic_vector(7 DOWNTO 0);
    I_data_mod_Q0  : IN std_logic_vector(7 DOWNTO 0);
    I_data_mod_I1  : IN std_logic_vector(7 DOWNTO 0);
    I_data_mod_Q1  : IN std_logic_vector(7 DOWNTO 0);
    I_data_mod_I2  : IN std_logic_vector(7 DOWNTO 0);
    I_data_mod_Q2  : IN std_logic_vector(7 DOWNTO 0);
    I_data_mod_I3  : IN std_logic_vector(7 DOWNTO 0);
    I_data_mod_Q3  : IN std_logic_vector(7 DOWNTO 0);
    I_data_mod_I4  : IN std_logic_vector(7 DOWNTO 0);
    I_data_mod_Q4  : IN std_logic_vector(7 DOWNTO 0);
    I_data_mod_I5  : IN std_logic_vector(7 DOWNTO 0);
    I_data_mod_Q5  : IN std_logic_vector(7 DOWNTO 0);
    I_data_mod_I6  : IN std_logic_vector(7 DOWNTO 0);
    I_data_mod_Q6  : IN std_logic_vector(7 DOWNTO 0);
    I_data_mod_I7  : IN std_logic_vector(7 DOWNTO 0);
    I_data_mod_Q7  : IN std_logic_vector(7 DOWNTO 0);
    I_data_mod_I8  : IN std_logic_vector(7 DOWNTO 0);
    I_data_mod_Q8  : IN std_logic_vector(7 DOWNTO 0);
    I_data_mod_I9  : IN std_logic_vector(7 DOWNTO 0);
    I_data_mod_Q9  : IN std_logic_vector(7 DOWNTO 0);
    I_data_mod_I10 : IN std_logic_vector(7 DOWNTO 0);
    I_data_mod_Q10 : IN std_logic_vector(7 DOWNTO 0);
    I_data_mod_I11 : IN std_logic_vector(7 DOWNTO 0);
    I_data_mod_Q11 : IN std_logic_vector(7 DOWNTO 0);
    I_data_mod_I12 : IN std_logic_vector(7 DOWNTO 0);
    I_data_mod_Q12 : IN std_logic_vector(7 DOWNTO 0);
    I_data_mod_I13 : IN std_logic_vector(7 DOWNTO 0);
    I_data_mod_Q13 : IN std_logic_vector(7 DOWNTO 0);
    I_data_mod_I14 : IN std_logic_vector(7 DOWNTO 0);
    I_data_mod_Q14 : IN std_logic_vector(7 DOWNTO 0);
    I_data_mod_I15 : IN std_logic_vector(7 DOWNTO 0);
    I_data_mod_Q15 : IN std_logic_vector(7 DOWNTO 0);

    ------------------ 整数倍抽取输出-------------------------------------

    -- O_data_Decimal_int_I : OUT std_logic_vector(11 DOWNTO 0);
    -- O_data_Decimal_int_Q : OUT std_logic_vector(11 DOWNTO 0);
    -- -------------------第二级抽取测试输出------------------------------------------
    -- O_data_d1_I0 : OUT std_logic_vector(15 DOWNTO 0);
    -- O_data_d1_I1 : OUT std_logic_vector(15 DOWNTO 0);
    -- O_data_d1_I2 : OUT std_logic_vector(15 DOWNTO 0);
    -- O_data_d1_I3 : OUT std_logic_vector(15 DOWNTO 0);
    -- O_data_d1_Q0 : OUT std_logic_vector(15 DOWNTO 0);
    -- O_data_d1_Q1 : OUT std_logic_vector(15 DOWNTO 0);
    -- O_data_d1_Q2 : OUT std_logic_vector(15 DOWNTO 0);
    -- O_data_d1_Q3 : OUT std_logic_vector(15 DOWNTO 0);
    -- -------------------第三级抽取测试输出------------------------------------------
    -- O_data_d2_I0 : OUT std_logic_vector(15 DOWNTO 0);
    -- O_data_d2_I1 : OUT std_logic_vector(15 DOWNTO 0);
    -- O_data_d2_Q0 : OUT std_logic_vector(15 DOWNTO 0);
    -- O_data_d2_Q1 : OUT std_logic_vector(15 DOWNTO 0);

    -------------------第四级抽取测试输出----------------------------------------------
    O_data_d3_I0 : OUT std_logic_vector(15 DOWNTO 0);
    O_data_d3_Q0 : OUT std_logic_vector(15 DOWNTO 0);
    O_data_d4_I0 : OUT std_logic_vector(15 DOWNTO 0);
    O_data_d4_Q0 : OUT std_logic_vector(15 DOWNTO 0);

    -----------------内部时钟检测-------------------------------------------------------
    O_wiz_locked : OUT std_logic;
    O_clk_93_75 : OUT std_logic
  );
END ddc_decimal_int_ctr;

ARCHITECTURE Behavioral OF ddc_decimal_int_ctr IS

COMPONENT fifo_generator_0
  PORT (
    rst : IN STD_LOGIC;
    wr_clk : IN STD_LOGIC;
    rd_clk : IN STD_LOGIC;
    din : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    wr_en : IN STD_LOGIC;
    rd_en : IN STD_LOGIC;
    dout : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    full : OUT STD_LOGIC;
    empty : OUT STD_LOGIC;
    prog_empty : OUT STD_LOGIC

  );
END COMPONENT;

  COMPONENT clk_wiz_0
    PORT (-- Clock in ports
      -- Clock out ports
      clk_out1 : OUT std_logic;
      clk_out2 : OUT std_logic;
      -- Status and control signals
      reset   : IN std_logic;
      locked  : OUT std_logic;
      clk_in1 : IN std_logic
    );
  END COMPONENT;

  COMPONENT ddc_decimal_int0 IS
    PORT (
      --------------------时钟---------------------------
      I_clk   : IN std_logic;
      I_rst_n : IN std_logic;
      --------------------DDC输出信号---------------------------
      I_data_mod_I0  : IN std_logic_vector(7 DOWNTO 0);
      I_data_mod_Q0  : IN std_logic_vector(7 DOWNTO 0);
      I_data_mod_I1  : IN std_logic_vector(7 DOWNTO 0);
      I_data_mod_Q1  : IN std_logic_vector(7 DOWNTO 0);
      I_data_mod_I2  : IN std_logic_vector(7 DOWNTO 0);
      I_data_mod_Q2  : IN std_logic_vector(7 DOWNTO 0);
      I_data_mod_I3  : IN std_logic_vector(7 DOWNTO 0);
      I_data_mod_Q3  : IN std_logic_vector(7 DOWNTO 0);
      I_data_mod_I4  : IN std_logic_vector(7 DOWNTO 0);
      I_data_mod_Q4  : IN std_logic_vector(7 DOWNTO 0);
      I_data_mod_I5  : IN std_logic_vector(7 DOWNTO 0);
      I_data_mod_Q5  : IN std_logic_vector(7 DOWNTO 0);
      I_data_mod_I6  : IN std_logic_vector(7 DOWNTO 0);
      I_data_mod_Q6  : IN std_logic_vector(7 DOWNTO 0);
      I_data_mod_I7  : IN std_logic_vector(7 DOWNTO 0);
      I_data_mod_Q7  : IN std_logic_vector(7 DOWNTO 0);
      I_data_mod_I8  : IN std_logic_vector(7 DOWNTO 0);
      I_data_mod_Q8  : IN std_logic_vector(7 DOWNTO 0);
      I_data_mod_I9  : IN std_logic_vector(7 DOWNTO 0);
      I_data_mod_Q9  : IN std_logic_vector(7 DOWNTO 0);
      I_data_mod_I10 : IN std_logic_vector(7 DOWNTO 0);
      I_data_mod_Q10 : IN std_logic_vector(7 DOWNTO 0);
      I_data_mod_I11 : IN std_logic_vector(7 DOWNTO 0);
      I_data_mod_Q11 : IN std_logic_vector(7 DOWNTO 0);
      I_data_mod_I12 : IN std_logic_vector(7 DOWNTO 0);
      I_data_mod_Q12 : IN std_logic_vector(7 DOWNTO 0);
      I_data_mod_I13 : IN std_logic_vector(7 DOWNTO 0);
      I_data_mod_Q13 : IN std_logic_vector(7 DOWNTO 0);
      I_data_mod_I14 : IN std_logic_vector(7 DOWNTO 0);
      I_data_mod_Q14 : IN std_logic_vector(7 DOWNTO 0);
      I_data_mod_I15 : IN std_logic_vector(7 DOWNTO 0);
      I_data_mod_Q15 : IN std_logic_vector(7 DOWNTO 0);

      ---------------------抽取输出信号------------------------

      O_data_d0_I0 : OUT std_logic_vector(12 DOWNTO 0);
      O_data_d0_I1 : OUT std_logic_vector(12 DOWNTO 0);
      O_data_d0_I2 : OUT std_logic_vector(12 DOWNTO 0);
      O_data_d0_I3 : OUT std_logic_vector(12 DOWNTO 0);
      O_data_d0_I4 : OUT std_logic_vector(12 DOWNTO 0);
      O_data_d0_I5 : OUT std_logic_vector(12 DOWNTO 0);
      O_data_d0_I6 : OUT std_logic_vector(12 DOWNTO 0);
      O_data_d0_I7 : OUT std_logic_vector(12 DOWNTO 0);

      O_data_d0_Q0 : OUT std_logic_vector(12 DOWNTO 0);
      O_data_d0_Q1 : OUT std_logic_vector(12 DOWNTO 0);
      O_data_d0_Q2 : OUT std_logic_vector(12 DOWNTO 0);
      O_data_d0_Q3 : OUT std_logic_vector(12 DOWNTO 0);
      O_data_d0_Q4 : OUT std_logic_vector(12 DOWNTO 0);
      O_data_d0_Q5 : OUT std_logic_vector(12 DOWNTO 0);
      O_data_d0_Q6 : OUT std_logic_vector(12 DOWNTO 0);
      O_data_d0_Q7 : OUT std_logic_vector(12 DOWNTO 0)

    );
  END COMPONENT;

  COMPONENT ddc_decimal_int1 IS
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
  END COMPONENT;

  COMPONENT ddc_decimal_int2 IS
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
  END COMPONENT;

  COMPONENT ddc_decimal_int3 IS
    PORT (
      --------------------时钟---------------------------
      I_clk   : IN std_logic;
      I_rst_n : IN std_logic;

      --------------------第三级抽取输出信号-------------------------
      I_data_d2_I0 : IN std_logic_vector(15 DOWNTO 0);
      I_data_d2_I1 : IN std_logic_vector(15 DOWNTO 0);
      I_data_d2_Q0 : IN std_logic_vector(15 DOWNTO 0);
      I_data_d2_Q1 : IN std_logic_vector(15 DOWNTO 0);

      -------------------第四级抽取输出信号--------------------------

      O_data_d3_I0 : OUT std_logic_vector(15 DOWNTO 0);
      O_data_d3_Q0 : OUT std_logic_vector(15 DOWNTO 0)

    );
  END COMPONENT;

  COMPONENT ddc_decimal_int4 IS
    PORT (
      --------------------时钟---------------------------
      I_clk   : IN std_logic;
      I_rst_n : IN std_logic;
      -------------------第四级抽取输出信号--------------------------

      I_data_d3_I0 : IN std_logic_vector(15 DOWNTO 0);
      I_data_d3_Q0 : IN std_logic_vector(15 DOWNTO 0);

      -------------------第五级抽取输出信号--------------------------

      O_data_d4_I0 : OUT std_logic_vector(15 DOWNTO 0);
      O_data_d4_Q0 : OUT std_logic_vector(15 DOWNTO 0)

    );
  END COMPONENT;
  COMPONENT ddc_decimal_int5 IS
    PORT (
      --------------------时钟---------------------------
      I_clk   : IN std_logic;
      I_rst_n : IN std_logic;
      -------------------第五级抽取输出信号--------------------------

      I_data_d4_I0 : IN std_logic_vector(15 DOWNTO 0);
      I_data_d4_Q0 : IN std_logic_vector(15 DOWNTO 0);

      -------------------第六级抽取输出信号--------------------------

      O_data_d5_I0 : OUT std_logic_vector(11 DOWNTO 0);
      O_data_d5_Q0 : OUT std_logic_vector(11 DOWNTO 0)

    );
  END COMPONENT;
  -------------------------------DDC输入-----------------------------------------
  SIGNAL S_data_mod_I0  : std_logic_vector(7 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_mod_I1  : std_logic_vector(7 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_mod_I2  : std_logic_vector(7 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_mod_I3  : std_logic_vector(7 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_mod_I4  : std_logic_vector(7 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_mod_I5  : std_logic_vector(7 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_mod_I6  : std_logic_vector(7 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_mod_I7  : std_logic_vector(7 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_mod_I8  : std_logic_vector(7 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_mod_I9  : std_logic_vector(7 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_mod_I10 : std_logic_vector(7 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_mod_I11 : std_logic_vector(7 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_mod_I12 : std_logic_vector(7 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_mod_I13 : std_logic_vector(7 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_mod_I14 : std_logic_vector(7 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_mod_I15 : std_logic_vector(7 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_mod_Q0  : std_logic_vector(7 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_mod_Q1  : std_logic_vector(7 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_mod_Q2  : std_logic_vector(7 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_mod_Q3  : std_logic_vector(7 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_mod_Q4  : std_logic_vector(7 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_mod_Q5  : std_logic_vector(7 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_mod_Q6  : std_logic_vector(7 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_mod_Q7  : std_logic_vector(7 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_mod_Q8  : std_logic_vector(7 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_mod_Q9  : std_logic_vector(7 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_mod_Q10 : std_logic_vector(7 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_mod_Q11 : std_logic_vector(7 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_mod_Q12 : std_logic_vector(7 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_mod_Q13 : std_logic_vector(7 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_mod_Q14 : std_logic_vector(7 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_mod_Q15 : std_logic_vector(7 DOWNTO 0) := (OTHERS => '0');

  -------------------------------第一级抽取滤波输出--------------------------------
  SIGNAL S_data_d0_I0 : std_logic_vector(12 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_d0_I1 : std_logic_vector(12 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_d0_I2 : std_logic_vector(12 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_d0_I3 : std_logic_vector(12 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_d0_I4 : std_logic_vector(12 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_d0_I5 : std_logic_vector(12 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_d0_I6 : std_logic_vector(12 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_d0_I7 : std_logic_vector(12 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_d0_Q0 : std_logic_vector(12 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_d0_Q1 : std_logic_vector(12 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_d0_Q2 : std_logic_vector(12 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_d0_Q3 : std_logic_vector(12 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_d0_Q4 : std_logic_vector(12 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_d0_Q5 : std_logic_vector(12 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_d0_Q6 : std_logic_vector(12 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_d0_Q7 : std_logic_vector(12 DOWNTO 0) := (OTHERS => '0');
  -------------------------------第二级抽取滤波输出--------------------------------
  SIGNAL S_data_d1_I0 : std_logic_vector(15 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_d1_I1 : std_logic_vector(15 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_d1_I2 : std_logic_vector(15 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_d1_I3 : std_logic_vector(15 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_d1_Q0 : std_logic_vector(15 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_d1_Q1 : std_logic_vector(15 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_d1_Q2 : std_logic_vector(15 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_d1_Q3 : std_logic_vector(15 DOWNTO 0) := (OTHERS => '0');
  -------------------------------第三级抽取滤波输出--------------------------------
  SIGNAL S_data_d2_I0 : std_logic_vector(15 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_d2_I1 : std_logic_vector(15 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_d2_Q0 : std_logic_vector(15 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_d2_Q1 : std_logic_vector(15 DOWNTO 0) := (OTHERS => '0');
  -------------------------------第四级抽取滤波输出--------------------------------
  SIGNAL S_data_d3_I0 : std_logic_vector(15 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_d3_Q0 : std_logic_vector(15 DOWNTO 0) := (OTHERS => '0');
  -------------------------------第五级抽取滤波输出--------------------------------
  SIGNAL S_data_d4_I0 : std_logic_vector(31 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_d4_Q0 : std_logic_vector(31 DOWNTO 0) := (OTHERS => '0');

  SIGNAL S_data_d4_I0_fifo : std_logic_vector(15 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_d4_Q0_fifo : std_logic_vector(15 DOWNTO 0) := (OTHERS => '0');
  -------------------------------第六级抽取滤波输出--------------------------------
  SIGNAL S_data_d5_I0         : std_logic_vector(11 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_d5_Q0         : std_logic_vector(11 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_wiz_locked         : std_logic;
  SIGNAL S_clk_93_75          : std_logic;
  SIGNAL S_clk_46_875         : std_logic;
  SIGNAL prog_empty           : std_logic;
  SIGNAL S_prog_empty_d1      : std_logic;
  SIGNAL S_prog_empty_d2      : std_logic;
  SIGNAL S_prog_empty_falling : std_logic;
  SIGNAL rd_en                : std_logic;
    SIGNAL S_rst_inv                : std_logic;
    SIGNAL S_full :std_logic;
BEGIN
S_rst_inv <= not I_rst_n;

  ddc_decimal_int0_u : ddc_decimal_int0
  PORT MAP(
    I_clk          => I_clk,
    I_rst_n        => I_rst_n,
    I_data_mod_I0  => I_data_mod_I0,
    I_data_mod_Q0  => I_data_mod_Q0,
    I_data_mod_I1  => I_data_mod_I1,
    I_data_mod_Q1  => I_data_mod_Q1,
    I_data_mod_I2  => I_data_mod_I2,
    I_data_mod_Q2  => I_data_mod_Q2,
    I_data_mod_I3  => I_data_mod_I3,
    I_data_mod_Q3  => I_data_mod_Q3,
    I_data_mod_I4  => I_data_mod_I4,
    I_data_mod_Q4  => I_data_mod_Q4,
    I_data_mod_I5  => I_data_mod_I5,
    I_data_mod_Q5  => I_data_mod_Q5,
    I_data_mod_I6  => I_data_mod_I6,
    I_data_mod_Q6  => I_data_mod_Q6,
    I_data_mod_I7  => I_data_mod_I7,
    I_data_mod_Q7  => I_data_mod_Q7,
    I_data_mod_I8  => I_data_mod_I8,
    I_data_mod_Q8  => I_data_mod_Q8,
    I_data_mod_I9  => I_data_mod_I9,
    I_data_mod_Q9  => I_data_mod_Q9,
    I_data_mod_I10 => I_data_mod_I10,
    I_data_mod_Q10 => I_data_mod_Q10,
    I_data_mod_I11 => I_data_mod_I11,
    I_data_mod_Q11 => I_data_mod_Q11,
    I_data_mod_I12 => I_data_mod_I12,
    I_data_mod_Q12 => I_data_mod_Q12,
    I_data_mod_I13 => I_data_mod_I13,
    I_data_mod_Q13 => I_data_mod_Q13,
    I_data_mod_I14 => I_data_mod_I14,
    I_data_mod_Q14 => I_data_mod_Q14,
    I_data_mod_I15 => I_data_mod_I15,
    I_data_mod_Q15 => I_data_mod_Q15,

    O_data_d0_I0 => S_data_d0_I0,
    O_data_d0_I1 => S_data_d0_I1,
    O_data_d0_I2 => S_data_d0_I2,
    O_data_d0_I3 => S_data_d0_I3,
    O_data_d0_I4 => S_data_d0_I4,
    O_data_d0_I5 => S_data_d0_I5,
    O_data_d0_I6 => S_data_d0_I6,
    O_data_d0_I7 => S_data_d0_I7,
    O_data_d0_Q0 => S_data_d0_Q0,
    O_data_d0_Q1 => S_data_d0_Q1,
    O_data_d0_Q2 => S_data_d0_Q2,
    O_data_d0_Q3 => S_data_d0_Q3,
    O_data_d0_Q4 => S_data_d0_Q4,
    O_data_d0_Q5 => S_data_d0_Q5,
    O_data_d0_Q6 => S_data_d0_Q6,
    O_data_d0_Q7 => S_data_d0_Q7

  );

  ddc_decimal_int1_u : ddc_decimal_int1
  PORT MAP(
    I_clk        => I_clk,
    I_rst_n      => I_rst_n,
    I_data_d0_I0 => S_data_d0_I0,
    I_data_d0_I1 => S_data_d0_I1,
    I_data_d0_I2 => S_data_d0_I2,
    I_data_d0_I3 => S_data_d0_I3,
    I_data_d0_I4 => S_data_d0_I4,
    I_data_d0_I5 => S_data_d0_I5,
    I_data_d0_I6 => S_data_d0_I6,
    I_data_d0_I7 => S_data_d0_I7,
    I_data_d0_Q0 => S_data_d0_Q0,
    I_data_d0_Q1 => S_data_d0_Q1,
    I_data_d0_Q2 => S_data_d0_Q2,
    I_data_d0_Q3 => S_data_d0_Q3,
    I_data_d0_Q4 => S_data_d0_Q4,
    I_data_d0_Q5 => S_data_d0_Q5,
    I_data_d0_Q6 => S_data_d0_Q6,
    I_data_d0_Q7 => S_data_d0_Q7,
    ---------------------第二级抽取输出信号------------------------

    O_data_d1_I0 => S_data_d1_I0,
    O_data_d1_I1 => S_data_d1_I1,
    O_data_d1_I2 => S_data_d1_I2,
    O_data_d1_I3 => S_data_d1_I3,
    O_data_d1_Q0 => S_data_d1_Q0,
    O_data_d1_Q1 => S_data_d1_Q1,
    O_data_d1_Q2 => S_data_d1_Q2,
    O_data_d1_Q3 => S_data_d1_Q3
  );
  ddc_decimal_int2_u : ddc_decimal_int2
  PORT MAP(
    I_clk   => I_clk,
    I_rst_n => I_rst_n,

    ---------------------第二级抽取输出信号------------------------

    I_data_d1_I0 => S_data_d1_I0,
    I_data_d1_I1 => S_data_d1_I1,
    I_data_d1_I2 => S_data_d1_I2,
    I_data_d1_I3 => S_data_d1_I3,
    I_data_d1_Q0 => S_data_d1_Q0,
    I_data_d1_Q1 => S_data_d1_Q1,
    I_data_d1_Q2 => S_data_d1_Q2,
    I_data_d1_Q3 => S_data_d1_Q3,

    -------------------第三级抽取输出信号--------------------------

    O_data_d2_I0 => S_data_d2_I0,
    O_data_d2_I1 => S_data_d2_I1,
    O_data_d2_Q0 => S_data_d2_Q0,
    O_data_d2_Q1 => S_data_d2_Q1

  );
  ddc_decimal_int3_u : ddc_decimal_int3
  PORT MAP(
    I_clk   => I_clk,
    I_rst_n => I_rst_n,

    -------------------第三级抽取输出信号--------------------------

    I_data_d2_I0 => S_data_d2_I0,
    I_data_d2_I1 => S_data_d2_I1,
    I_data_d2_Q0 => S_data_d2_Q0,
    I_data_d2_Q1 => S_data_d2_Q1,

    -------------------第四级抽取输出信号--------------------------

    O_data_d3_I0 => S_data_d3_I0,
    O_data_d3_Q0 => S_data_d3_Q0
  );

  ddc_decimal_int4_u : ddc_decimal_int4
  PORT MAP(
    I_clk   => I_clk,
    I_rst_n => I_rst_n,

    -------------------第四级抽取输出信号--------------------------

    I_data_d3_I0 => S_data_d3_I0,
    I_data_d3_Q0 => S_data_d3_Q0,
    -------------------第四级抽取输出信号--------------------------

    O_data_d4_I0 => S_data_d4_I0_fifo,
    O_data_d4_Q0 => S_data_d4_Q0_fifo
  );

  clk_wiz_0_u : clk_wiz_0
  PORT MAP(
    -- Clock out ports  
    clk_out1 => S_clk_93_75,
    clk_out2 => S_clk_46_875,
    -- Status and control signals                
    reset  => S_rst_inv,
    locked => S_wiz_locked,
    -- Clock in ports
    clk_in1 => I_clk
  );
  
 P_rd_fifo_prog : PROCESS (S_clk_93_75, I_rst_n)
  BEGIN
    IF I_rst_n = '0' THEN
      S_prog_empty_d1      <= '1';
      S_prog_empty_d2      <= '1';
      S_prog_empty_falling <= '0';
    ELSIF rising_edge(S_clk_93_75) THEN
      S_prog_empty_d1      <= prog_empty;
      S_prog_empty_d2      <= S_prog_empty_d1;
      S_prog_empty_falling <= (NOT S_prog_empty_d1)AND S_prog_empty_d2;
    END IF;
  END PROCESS;


  P_rd_fifo : PROCESS (S_clk_93_75, I_rst_n)
  BEGIN
    IF I_rst_n = '0' THEN
      rd_en <= '0';
    ELSIF rising_edge(S_clk_93_75) THEN
      IF S_prog_empty_falling = '1' THEN
        rd_en <= '1';
      END IF;
    END IF;
  END PROCESS;
  
d3_I0_fifo_generator_0_u : fifo_generator_0
  PORT MAP (
    rst => S_rst_inv,
    wr_clk => I_clk,
    rd_clk => S_clk_93_75,
    din => S_data_d4_I0_fifo,
    wr_en => '1',
    rd_en => rd_en,
    dout => S_data_d4_I0,
    full => open,
    empty => open,
    prog_empty => prog_empty

  );



  d3_Q0_generator_0_u : fifo_generator_0
  PORT MAP(
    rst => S_rst_inv,
    wr_clk => I_clk,
    rd_clk => S_clk_93_75,
    din => S_data_d4_Q0_fifo,
    wr_en => '1',
    rd_en => rd_en,
    dout => S_data_d4_Q0,
    full => S_full,
    empty => open,
    prog_empty => prog_empty

  );


  -- ddc_decimal_int5_u : ddc_decimal_int5
  -- PORT MAP(
  --   I_clk   => S_clk_46_875,
  --   I_rst_n => I_rst_n,

  --   -------------------第五级抽取输出信号--------------------------

  --   I_data_d4_I0 => S_data_d4_I0,
  --   I_data_d4_Q0 => 1,
  --   -------------------第六级抽取输出信号--------------------------

  --   O_data_d5_I0 => S_data_d5_I0,
  --   O_data_d5_Q0 => S_data_d5_Q0
  -- );
  ---------------测试部分-------------------
  -- O_data_d1_I0 <= S_data_d1_I0;
  -- O_data_d1_I1 <= S_data_d1_I1;
  -- O_data_d1_I2 <= S_data_d1_I2;
  -- O_data_d1_I3 <= S_data_d1_I3;
  -- O_data_d1_Q0 <= S_data_d1_Q0;
  -- O_data_d1_Q1 <= S_data_d1_Q1;
  -- O_data_d1_Q2 <= S_data_d1_Q2;
  -- O_data_d1_Q3 <= S_data_d1_Q3;

  -- O_data_d2_I0 <= S_data_d2_I0;
  -- O_data_d2_I1 <= S_data_d2_I1;
  -- O_data_d2_Q0 <= S_data_d2_Q0;
  -- O_data_d2_Q1 <= S_data_d2_Q1;
  -- O_data_Decimal_int_I <= S_data_d5_I0;
  -- O_data_Decimal_int_Q <= S_data_d5_Q0;

  O_data_d3_I0 <= S_data_d3_I0;
  O_data_d3_Q0 <= S_data_d3_Q0;
  O_data_d4_I0 <= S_data_d4_I0(31 DOWNTO 16);
  O_data_d4_Q0 <= S_data_d4_Q0(31 DOWNTO 16);
  O_wiz_locked <= S_wiz_locked;
  O_clk_93_75   <= S_clk_93_75;

END Behavioral;