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

    -- O_data_Decimal_int_I : OUT std_logic_vector(12 DOWNTO 0);
    -- O_data_Decimal_int_Q : OUT std_logic_vector(12 DOWNTO 0)
    -------------------第二级抽取测试输出------------------------------------------
    -- O_data_d1_I0 : OUT std_logic_vector(15 DOWNTO 0);
    -- O_data_d1_I1 : OUT std_logic_vector(15 DOWNTO 0);
    -- O_data_d1_I2 : OUT std_logic_vector(15 DOWNTO 0);
    -- O_data_d1_I3 : OUT std_logic_vector(15 DOWNTO 0);
    -- O_data_d1_Q0 : OUT std_logic_vector(15 DOWNTO 0);
    -- O_data_d1_Q1 : OUT std_logic_vector(15 DOWNTO 0);
    -- O_data_d1_Q2 : OUT std_logic_vector(15 DOWNTO 0);
    -- O_data_d1_Q3 : OUT std_logic_vector(15 DOWNTO 0)
      -------------------第三级抽取测试输出------------------------------------------
      O_data_d2_I0 : OUT std_logic_vector(15 DOWNTO 0);
      O_data_d2_I1 : OUT std_logic_vector(15 DOWNTO 0);
      O_data_d2_Q0 : OUT std_logic_vector(15 DOWNTO 0);
      O_data_d2_Q1 : OUT std_logic_vector(15 DOWNTO 0)
  );
END ddc_decimal_int_ctr;

ARCHITECTURE Behavioral OF ddc_decimal_int_ctr IS
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

  SIGNAL O_data_d0_I0 : std_logic_vector(12 DOWNTO 0);
  SIGNAL O_data_d0_I1 : std_logic_vector(12 DOWNTO 0);
  SIGNAL O_data_d0_I2 : std_logic_vector(12 DOWNTO 0);
  SIGNAL O_data_d0_I3 : std_logic_vector(12 DOWNTO 0);
  SIGNAL O_data_d0_I4 : std_logic_vector(12 DOWNTO 0);
  SIGNAL O_data_d0_I5 : std_logic_vector(12 DOWNTO 0);
  SIGNAL O_data_d0_I6 : std_logic_vector(12 DOWNTO 0);
  SIGNAL O_data_d0_I7 : std_logic_vector(12 DOWNTO 0);

  SIGNAL O_data_d0_Q0   : std_logic_vector(12 DOWNTO 0);
  SIGNAL O_data_d0_Q1   : std_logic_vector(12 DOWNTO 0);
  SIGNAL O_data_d0_Q2   : std_logic_vector(12 DOWNTO 0);
  SIGNAL O_data_d0_Q3   : std_logic_vector(12 DOWNTO 0);
  SIGNAL O_data_d0_Q4   : std_logic_vector(12 DOWNTO 0);
  SIGNAL O_data_d0_Q5   : std_logic_vector(12 DOWNTO 0);
  SIGNAL O_data_d0_Q6   : std_logic_vector(12 DOWNTO 0);
  SIGNAL O_data_d0_Q7   : std_logic_vector(12 DOWNTO 0);
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
  SIGNAL S_data_d1_I0 : std_logic_vector(15 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_d1_I1 : std_logic_vector(15 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_d1_I2 : std_logic_vector(15 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_d1_I3 : std_logic_vector(15 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_d1_Q0 : std_logic_vector(15 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_d1_Q1 : std_logic_vector(15 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_d1_Q2 : std_logic_vector(15 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_d1_Q3 : std_logic_vector(15 DOWNTO 0) := (OTHERS => '0');

  SIGNAL S_data_d2_I0 : std_logic_vector(15 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_d2_I1 : std_logic_vector(15 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_d2_Q0 : std_logic_vector(15 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_d2_Q1 : std_logic_vector(15 DOWNTO 0) := (OTHERS => '0');

BEGIN

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
    I_clk        => I_clk,
    I_rst_n      => I_rst_n,

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

  ---------------测试部分-------------------
  -- O_data_d1_I0 <= S_data_d1_I0;
  -- O_data_d1_I1 <= S_data_d1_I1;
  -- O_data_d1_I2 <= S_data_d1_I2;
  -- O_data_d1_I3 <= S_data_d1_I3;
  -- O_data_d1_Q0 <= S_data_d1_Q0;
  -- O_data_d1_Q1 <= S_data_d1_Q1;
  -- O_data_d1_Q2 <= S_data_d1_Q2;
  -- O_data_d1_Q3 <= S_data_d1_Q3;

  O_data_d2_I0 <= S_data_d2_I0;
  O_data_d2_I1 <= S_data_d2_I1;
  O_data_d2_Q0 <= S_data_d2_Q0;
  O_data_d2_Q1 <= S_data_d2_Q1;
END Behavioral;