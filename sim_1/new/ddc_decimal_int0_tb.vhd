----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2022/04/06 20:53:05
-- Design Name: 
-- Module Name: ddc_decimal_int0_tb - Behavioral
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

-- USE ieee.Std_logic_unSigned.ALL;

USE ieee.numeric_std.ALL;
USE std.textio.ALL;
USE ieee.std_logic_textio.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_SIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
LIBRARY UNISIM;
USE UNISIM.VComponents.ALL;
ENTITY ddc_decimal_int0_tb IS

END ddc_decimal_int0_tb;

ARCHITECTURE Behavioral OF ddc_decimal_int0_tb IS
  COMPONENT DDC_ctr IS
    PORT (
      I_clk   : IN std_logic;
      I_rst_n : IN std_logic;

      ----------------------输出信号--------------------------------
      O_data_mod_I0  : OUT std_logic_vector(7 DOWNTO 0);
      O_data_mod_Q0  : OUT std_logic_vector(7 DOWNTO 0);
      O_data_mod_I1  : OUT std_logic_vector(7 DOWNTO 0);
      O_data_mod_Q1  : OUT std_logic_vector(7 DOWNTO 0);
      O_data_mod_I2  : OUT std_logic_vector(7 DOWNTO 0);
      O_data_mod_Q2  : OUT std_logic_vector(7 DOWNTO 0);
      O_data_mod_I3  : OUT std_logic_vector(7 DOWNTO 0);
      O_data_mod_Q3  : OUT std_logic_vector(7 DOWNTO 0);
      O_data_mod_I4  : OUT std_logic_vector(7 DOWNTO 0);
      O_data_mod_Q4  : OUT std_logic_vector(7 DOWNTO 0);
      O_data_mod_I5  : OUT std_logic_vector(7 DOWNTO 0);
      O_data_mod_Q5  : OUT std_logic_vector(7 DOWNTO 0);
      O_data_mod_I6  : OUT std_logic_vector(7 DOWNTO 0);
      O_data_mod_Q6  : OUT std_logic_vector(7 DOWNTO 0);
      O_data_mod_I7  : OUT std_logic_vector(7 DOWNTO 0);
      O_data_mod_Q7  : OUT std_logic_vector(7 DOWNTO 0);
      O_data_mod_I8  : OUT std_logic_vector(7 DOWNTO 0);
      O_data_mod_Q8  : OUT std_logic_vector(7 DOWNTO 0);
      O_data_mod_I9  : OUT std_logic_vector(7 DOWNTO 0);
      O_data_mod_Q9  : OUT std_logic_vector(7 DOWNTO 0);
      O_data_mod_I10 : OUT std_logic_vector(7 DOWNTO 0);
      O_data_mod_Q10 : OUT std_logic_vector(7 DOWNTO 0);
      O_data_mod_I11 : OUT std_logic_vector(7 DOWNTO 0);
      O_data_mod_Q11 : OUT std_logic_vector(7 DOWNTO 0);
      O_data_mod_I12 : OUT std_logic_vector(7 DOWNTO 0);
      O_data_mod_Q12 : OUT std_logic_vector(7 DOWNTO 0);
      O_data_mod_I13 : OUT std_logic_vector(7 DOWNTO 0);
      O_data_mod_Q13 : OUT std_logic_vector(7 DOWNTO 0);
      O_data_mod_I14 : OUT std_logic_vector(7 DOWNTO 0);
      O_data_mod_Q14 : OUT std_logic_vector(7 DOWNTO 0);
      O_data_mod_I15 : OUT std_logic_vector(7 DOWNTO 0);
      O_data_mod_Q15 : OUT std_logic_vector(7 DOWNTO 0)
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
      -- O_data_d0_I2 : OUT std_logic_vector(12 DOWNTO 0);
      -- O_data_d0_I3 : OUT std_logic_vector(12 DOWNTO 0);
      -- O_data_d0_I4 : OUT std_logic_vector(12 DOWNTO 0);
      -- O_data_d0_I5 : OUT std_logic_vector(12 DOWNTO 0);
      -- O_data_d0_I6 : OUT std_logic_vector(12 DOWNTO 0);
      -- O_data_d0_I7 : OUT std_logic_vector(12 DOWNTO 0);

      -- O_data_d0_Q0 : OUT std_logic_vector(12 DOWNTO 0);
      -- O_data_d0_Q1 : OUT std_logic_vector(12 DOWNTO 0);
      -- O_data_d0_Q2 : OUT std_logic_vector(12 DOWNTO 0);
      -- O_data_d0_Q3 : OUT std_logic_vector(12 DOWNTO 0);
      -- O_data_d0_Q4 : OUT std_logic_vector(12 DOWNTO 0);
      -- O_data_d0_Q5 : OUT std_logic_vector(12 DOWNTO 0);
      -- O_data_d0_Q6 : OUT std_logic_vector(12 DOWNTO 0);
      -- O_data_d0_Q7 : OUT std_logic_vector(12 DOWNTO 0)

      --------------------测试信号输出------------------------
      --------------------------------第一级流水参数-----------------------------------
      O_data_pipel0_I1_0 : OUT std_logic_vector(8 DOWNTO 0);
      O_data_pipel0_I1_1 : OUT std_logic_vector(8 DOWNTO 0);
      O_data_pipel0_I1_2 : OUT std_logic_vector(8 DOWNTO 0);
      O_data_pipel0_I1_3 : OUT std_logic_vector(8 DOWNTO 0);
      O_data_pipel0_I1_4 : OUT std_logic_vector(8 DOWNTO 0);

      ------------------------第二级流水参数-----------------------
      O_data_pipel1_I1_0 : OUT std_logic_vector(24 DOWNTO 0);
      O_data_pipel1_I1_1 : OUT std_logic_vector(24 DOWNTO 0);
      O_data_pipel1_I1_2 : OUT std_logic_vector(24 DOWNTO 0);
      O_data_pipel1_I1_3 : OUT std_logic_vector(24 DOWNTO 0);
      O_data_pipel1_I1_4 : OUT std_logic_vector(24 DOWNTO 0);
      ------------------------第三级流水参数-------------------------
      O_data_pipel2_I1_0 : OUT std_logic_vector(24 DOWNTO 0);
      O_data_pipel2_I1_1 : OUT std_logic_vector(24 DOWNTO 0);
      O_data_pipel2_I1_2 : OUT std_logic_vector(24 DOWNTO 0);

      ------------------------第四级流水参数-----------------------
      O_data_pipel3_I1_0 : OUT std_logic_vector(25 DOWNTO 0);
      O_data_pipel3_I1_1 : OUT std_logic_vector(25 DOWNTO 0);

      --------------------------第五级流水参数-----------------------------------
      O_data_pipel4_I1 : OUT std_logic_vector(26 DOWNTO 0)
    );
  END COMPONENT;

  SIGNAL rst_n_r    : std_logic := '0';
  SIGNAL rst_n_rise : std_logic := '0';
  SIGNAL rst_cnt    : natural   := 0;

  TYPE status_type IS (s_idle, s_write, s_write_end, s_read_begin, s_read, s_end);
  SIGNAL c_status : status_type := s_idle;

  SIGNAL cnt_from_file  : std_logic_vector(7 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_clk          : std_logic                    := '0';
  SIGNAL S_rst_n        : std_logic                    := '1';
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

  SIGNAL S_data_mod_Q0  : std_logic_vector(7 DOWNTO 0)  := (OTHERS => '0');
  SIGNAL S_data_mod_Q1  : std_logic_vector(7 DOWNTO 0)  := (OTHERS => '0');
  SIGNAL S_data_mod_Q2  : std_logic_vector(7 DOWNTO 0)  := (OTHERS => '0');
  SIGNAL S_data_mod_Q3  : std_logic_vector(7 DOWNTO 0)  := (OTHERS => '0');
  SIGNAL S_data_mod_Q4  : std_logic_vector(7 DOWNTO 0)  := (OTHERS => '0');
  SIGNAL S_data_mod_Q5  : std_logic_vector(7 DOWNTO 0)  := (OTHERS => '0');
  SIGNAL S_data_mod_Q6  : std_logic_vector(7 DOWNTO 0)  := (OTHERS => '0');
  SIGNAL S_data_mod_Q7  : std_logic_vector(7 DOWNTO 0)  := (OTHERS => '0');
  SIGNAL S_data_mod_Q8  : std_logic_vector(7 DOWNTO 0)  := (OTHERS => '0');
  SIGNAL S_data_mod_Q9  : std_logic_vector(7 DOWNTO 0)  := (OTHERS => '0');
  SIGNAL S_data_mod_Q10 : std_logic_vector(7 DOWNTO 0)  := (OTHERS => '0');
  SIGNAL S_data_mod_Q11 : std_logic_vector(7 DOWNTO 0)  := (OTHERS => '0');
  SIGNAL S_data_mod_Q12 : std_logic_vector(7 DOWNTO 0)  := (OTHERS => '0');
  SIGNAL S_data_mod_Q13 : std_logic_vector(7 DOWNTO 0)  := (OTHERS => '0');
  SIGNAL S_data_mod_Q14 : std_logic_vector(7 DOWNTO 0)  := (OTHERS => '0');
  SIGNAL S_data_mod_Q15 : std_logic_vector(7 DOWNTO 0)  := (OTHERS => '0');
  SIGNAL S_data_d0_I0   : std_logic_vector(12 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_d0_I1   : std_logic_vector(12 DOWNTO 0) := (OTHERS => '0');
  --------------------------------测试信号------------------------------------

  SIGNAL S_data_pipel0_I0_0 : std_logic_vector(8 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel0_I0_1 : std_logic_vector(8 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel0_I0_2 : std_logic_vector(8 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel0_I0_3 : std_logic_vector(8 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel0_I0_4 : std_logic_vector(8 DOWNTO 0) := (OTHERS => '0');

  --------------------------------第二级流水参数-----------------------------------
  SIGNAL S_data_pipel1_I0_0 : std_logic_vector(24 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel1_I0_1 : std_logic_vector(24 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel1_I0_2 : std_logic_vector(24 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel1_I0_3 : std_logic_vector(24 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel1_I0_4 : std_logic_vector(24 DOWNTO 0) := (OTHERS => '0');
  --------------------------------第三级流水参数-----------------------------------
  SIGNAL S_data_pipel2_I0_0 : std_logic_vector(24 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel2_I0_1 : std_logic_vector(24 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel2_I0_2 : std_logic_vector(24 DOWNTO 0) := (OTHERS => '0');

  --------------------------------第四级流水参数-----------------------------------
  SIGNAL S_data_pipel3_I0_0 : std_logic_vector(25 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel3_I0_1 : std_logic_vector(25 DOWNTO 0) := (OTHERS => '0');

  --------------------------------第一级流水参数-----------------------------------
  SIGNAL S_data_pipel0_I1_0 : std_logic_vector(8 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel0_I1_1 : std_logic_vector(8 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel0_I1_2 : std_logic_vector(8 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel0_I1_3 : std_logic_vector(8 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel0_I1_4 : std_logic_vector(8 DOWNTO 0) := (OTHERS => '0');

  --------------------------------第二级流水参数-----------------------------------
  SIGNAL S_data_pipel1_I1_0 : std_logic_vector(24 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel1_I1_1 : std_logic_vector(24 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel1_I1_2 : std_logic_vector(24 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel1_I1_3 : std_logic_vector(24 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel1_I1_4 : std_logic_vector(24 DOWNTO 0) := (OTHERS => '0');
  --------------------------------第三级流水参数-----------------------------------
  SIGNAL S_data_pipel2_I1_0 : std_logic_vector(24 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel2_I1_1 : std_logic_vector(24 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel2_I1_2 : std_logic_vector(24 DOWNTO 0) := (OTHERS => '0');

  --------------------------------第四级流水参数-----------------------------------
  SIGNAL S_data_pipel3_I1_0 : std_logic_vector(25 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel3_I1_1 : std_logic_vector(25 DOWNTO 0) := (OTHERS => '0');

  --------------------------------第五级流水参数-----------------------------------
  SIGNAL s_data_pipel4_I1 : std_logic_vector(26 DOWNTO 0);

BEGIN

  S_rst_n <= '1',
    '0' AFTER 100 ns,
    '1' AFTER 200 ns,
    '0' AFTER 200200 ns,
    '1' AFTER 200300 ns,
    '0' AFTER 400300 ns;
  S_clk <= NOT S_clk AFTER 5.333 ns;

  DDC_ctr_u : DDC_ctr
  PORT MAP(
    I_clk          => S_clk,
    I_rst_n        => S_rst_n,
    O_data_mod_I0  => S_data_mod_I0,
    O_data_mod_Q0  => S_data_mod_Q0,
    O_data_mod_I1  => S_data_mod_I1,
    O_data_mod_Q1  => S_data_mod_Q1,
    O_data_mod_I2  => S_data_mod_I2,
    O_data_mod_Q2  => S_data_mod_Q2,
    O_data_mod_I3  => S_data_mod_I3,
    O_data_mod_Q3  => S_data_mod_Q3,
    O_data_mod_I4  => S_data_mod_I4,
    O_data_mod_Q4  => S_data_mod_Q4,
    O_data_mod_I5  => S_data_mod_I5,
    O_data_mod_Q5  => S_data_mod_Q5,
    O_data_mod_I6  => S_data_mod_I6,
    O_data_mod_Q6  => S_data_mod_Q6,
    O_data_mod_I7  => S_data_mod_I7,
    O_data_mod_Q7  => S_data_mod_Q7,
    O_data_mod_I8  => S_data_mod_I8,
    O_data_mod_Q8  => S_data_mod_Q8,
    O_data_mod_I9  => S_data_mod_I9,
    O_data_mod_Q9  => S_data_mod_Q9,
    O_data_mod_I10 => S_data_mod_I10,
    O_data_mod_Q10 => S_data_mod_Q10,
    O_data_mod_I11 => S_data_mod_I11,
    O_data_mod_Q11 => S_data_mod_Q11,
    O_data_mod_I12 => S_data_mod_I12,
    O_data_mod_Q12 => S_data_mod_Q12,
    O_data_mod_I13 => S_data_mod_I13,
    O_data_mod_Q13 => S_data_mod_Q13,
    O_data_mod_I14 => S_data_mod_I14,
    O_data_mod_Q14 => S_data_mod_Q14,
    O_data_mod_I15 => S_data_mod_I15,
    O_data_mod_Q15 => S_data_mod_Q15
  );

  ddc_decimal_int0_u : ddc_decimal_int0
  PORT MAP(
    I_clk              => S_clk,
    I_rst_n            => S_rst_n,
    I_data_mod_I0      => S_data_mod_I0,
    I_data_mod_Q0      => S_data_mod_Q0,
    I_data_mod_I1      => S_data_mod_I1,
    I_data_mod_Q1      => S_data_mod_Q1,
    I_data_mod_I2      => S_data_mod_I2,
    I_data_mod_Q2      => S_data_mod_Q2,
    I_data_mod_I3      => S_data_mod_I3,
    I_data_mod_Q3      => S_data_mod_Q3,
    I_data_mod_I4      => S_data_mod_I4,
    I_data_mod_Q4      => S_data_mod_Q4,
    I_data_mod_I5      => S_data_mod_I5,
    I_data_mod_Q5      => S_data_mod_Q5,
    I_data_mod_I6      => S_data_mod_I6,
    I_data_mod_Q6      => S_data_mod_Q6,
    I_data_mod_I7      => S_data_mod_I7,
    I_data_mod_Q7      => S_data_mod_Q7,
    I_data_mod_I8      => S_data_mod_I8,
    I_data_mod_Q8      => S_data_mod_Q8,
    I_data_mod_I9      => S_data_mod_I9,
    I_data_mod_Q9      => S_data_mod_Q9,
    I_data_mod_I10     => S_data_mod_I10,
    I_data_mod_Q10     => S_data_mod_Q10,
    I_data_mod_I11     => S_data_mod_I11,
    I_data_mod_Q11     => S_data_mod_Q11,
    I_data_mod_I12     => S_data_mod_I12,
    I_data_mod_Q12     => S_data_mod_Q12,
    I_data_mod_I13     => S_data_mod_I13,
    I_data_mod_Q13     => S_data_mod_Q13,
    I_data_mod_I14     => S_data_mod_I14,
    I_data_mod_Q14     => S_data_mod_Q14,
    I_data_mod_I15     => S_data_mod_I15,
    I_data_mod_Q15     => S_data_mod_Q15,
    O_data_d0_I0       => S_data_d0_I0,
    O_data_d0_I1       => S_data_d0_I1,
    
    O_data_pipel0_I1_0 => S_data_pipel0_I1_0,
    O_data_pipel0_I1_1 => S_data_pipel0_I1_1,
    O_data_pipel0_I1_2 => S_data_pipel0_I1_2,
    O_data_pipel0_I1_3 => S_data_pipel0_I1_3,
    O_data_pipel0_I1_4 => S_data_pipel0_I1_4,
    O_data_pipel1_I1_0 => S_data_pipel1_I1_0,
    O_data_pipel1_I1_1 => S_data_pipel1_I1_1,
    O_data_pipel1_I1_2 => S_data_pipel1_I1_2,
    O_data_pipel1_I1_3 => S_data_pipel1_I1_3,
    O_data_pipel1_I1_4 => S_data_pipel1_I1_4,

    O_data_pipel2_I1_0 => S_data_pipel2_I1_0,
    O_data_pipel2_I1_1 => S_data_pipel2_I1_1,
    O_data_pipel2_I1_2 => S_data_pipel2_I1_2,
    O_data_pipel3_I1_0 => S_data_pipel3_I1_0,
    O_data_pipel3_I1_1 => S_data_pipel3_I1_1
  );

  -----------------------文件写入部分-----------------------------------
  PROCESS (S_clk)
  BEGIN
    IF rising_edge(S_clk) THEN
      rst_n_r <= S_rst_n;
    ELSE
      NULL;
    END IF;
  END PROCESS;

  rst_n_rise <= S_rst_n AND (NOT rst_n_r);

  PROCESS (S_clk)
  BEGIN
    IF rising_edge(S_clk) THEN
      IF rst_n_rise = '1' THEN
        rst_cnt <= rst_cnt + 1;
      ELSE
        NULL;
      END IF;
    ELSE
      NULL;
    END IF;
  END PROCESS;
  PROCESS (S_rst_n, S_clk)
    FILE file0           : text;
    FILE file1           : text;
    FILE file2           : text;
    FILE file3           : text;
    VARIABLE file_status : file_open_status;
    VARIABLE buf         : LINE;

    VARIABLE cnt_from_file_r : natural         := 0;
    VARIABLE file_name       : string(1 TO 11) := "nihaonihaon";
    CONSTANT rst_cnt_stop    : natural         := 3;
  BEGIN
    IF rising_edge(S_clk) THEN
      CASE c_status IS
        WHEN s_idle =>
          c_status <= s_write;
          file_open(file_status, file0, "S_data_d0_I1.txt", write_mode);
          file_open(file_status, file1, "S_data_pipel3_I1_0.txt", write_mode);
          file_open(file_status, file2, "S_data_pipel3_I1_1.txt", write_mode);
          file_open(file_status, file3, "S_data_pipel3_I1_0.txt", write_mode);
        WHEN s_write =>
          IF rst_cnt >= rst_cnt_stop THEN
            c_status <= s_end;
          ELSE
            c_status <= s_write;
          END IF;
          write(buf, conv_integer(S_data_d0_I1));
          writeline(file0, buf);
          write(buf, conv_integer(S_data_pipel3_I1_0));
          writeline(file1, buf);
          write(buf, conv_integer(S_data_pipel3_I1_1));
          writeline(file2, buf);
          write(buf, conv_integer(S_data_pipel3_I1_0));
          writeline(file3, buf);
        WHEN s_end =>
          c_status <= s_end;
          file_close(file0);
          file_close(file1);
          file_close(file2);
          file_close(file3);
        WHEN OTHERS =>
          c_status <= s_end;
      END CASE;
    ELSE
      NULL;
    END IF;
  END PROCESS;
END Behavioral;