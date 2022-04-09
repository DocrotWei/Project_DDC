----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2022/04/06 17:01:17
-- Design Name: 
-- Module Name: ddc_decimal_int0 - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

ENTITY ddc_decimal_int0 IS
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
END ddc_decimal_int0;

ARCHITECTURE Behavioral OF ddc_decimal_int0 IS

  COMPONENT mult_gen_d0_int
    PORT (
      CLK  : IN std_logic;
      A    : IN std_logic_vector(8 DOWNTO 0);
      B    : IN std_logic_vector(15 DOWNTO 0);
      CE   : IN std_logic;
      SCLR : IN std_logic;
      P    : OUT std_logic_vector(24 DOWNTO 0)
    );
  END COMPONENT;
  CONSTANT HB_COE0    : std_logic_vector(15 DOWNTO 0) := conv_std_logic_vector(-112, 16);
  CONSTANT HB_COE2    : std_logic_vector(15 DOWNTO 0) := conv_std_logic_vector(647, 16);
  CONSTANT HB_COE4    : std_logic_vector(15 DOWNTO 0) := conv_std_logic_vector(-2336, 16);
  CONSTANT HB_COE6    : std_logic_vector(15 DOWNTO 0) := conv_std_logic_vector(9991, 16);
  CONSTANT HB_COE7    : std_logic_vector(15 DOWNTO 0) := conv_std_logic_vector(16384, 16);

  --------------------------------输入信号流水--------------------------------------
  SIGNAL S_data_mod_I0  : std_logic_vector(7 DOWNTO 0);
  SIGNAL S_data_mod_Q0  : std_logic_vector(7 DOWNTO 0);
  SIGNAL S_data_mod_I1  : std_logic_vector(7 DOWNTO 0);
  SIGNAL S_data_mod_Q1  : std_logic_vector(7 DOWNTO 0);
  SIGNAL S_data_mod_I2  : std_logic_vector(7 DOWNTO 0);
  SIGNAL S_data_mod_Q2  : std_logic_vector(7 DOWNTO 0);
  SIGNAL S_data_mod_I3  : std_logic_vector(7 DOWNTO 0);
  SIGNAL S_data_mod_Q3  : std_logic_vector(7 DOWNTO 0);
  SIGNAL S_data_mod_I4  : std_logic_vector(7 DOWNTO 0);
  SIGNAL S_data_mod_Q4  : std_logic_vector(7 DOWNTO 0);
  SIGNAL S_data_mod_I5  : std_logic_vector(7 DOWNTO 0);
  SIGNAL S_data_mod_Q5  : std_logic_vector(7 DOWNTO 0);
  SIGNAL S_data_mod_I6  : std_logic_vector(7 DOWNTO 0);
  SIGNAL S_data_mod_Q6  : std_logic_vector(7 DOWNTO 0);
  SIGNAL S_data_mod_I7  : std_logic_vector(7 DOWNTO 0);
  SIGNAL S_data_mod_Q7  : std_logic_vector(7 DOWNTO 0);
  SIGNAL S_data_mod_I8  : std_logic_vector(7 DOWNTO 0);
  SIGNAL S_data_mod_Q8  : std_logic_vector(7 DOWNTO 0);
  SIGNAL S_data_mod_I9  : std_logic_vector(7 DOWNTO 0);
  SIGNAL S_data_mod_Q9  : std_logic_vector(7 DOWNTO 0);
  SIGNAL S_data_mod_I10 : std_logic_vector(7 DOWNTO 0);
  SIGNAL S_data_mod_Q10 : std_logic_vector(7 DOWNTO 0);
  SIGNAL S_data_mod_I11 : std_logic_vector(7 DOWNTO 0);
  SIGNAL S_data_mod_Q11 : std_logic_vector(7 DOWNTO 0);
  SIGNAL S_data_mod_I12 : std_logic_vector(7 DOWNTO 0);
  SIGNAL S_data_mod_Q12 : std_logic_vector(7 DOWNTO 0);
  SIGNAL S_data_mod_I13 : std_logic_vector(7 DOWNTO 0);
  SIGNAL S_data_mod_Q13 : std_logic_vector(7 DOWNTO 0);
  SIGNAL S_data_mod_I14 : std_logic_vector(7 DOWNTO 0);
  SIGNAL S_data_mod_Q14 : std_logic_vector(7 DOWNTO 0);
  SIGNAL S_data_mod_I15 : std_logic_vector(7 DOWNTO 0);
  SIGNAL S_data_mod_Q15 : std_logic_vector(7 DOWNTO 0);

  -----------------------------------I0路的流水寄存器-------------------------------

  --------------------------------第一级流水参数-----------------------------------
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

  --------------------------------第五级流水参数-----------------------------------
  SIGNAL s_data_pipel4_I0 : std_logic_vector(26 DOWNTO 0);

  -----------------------------------I1路的流水寄存器-------------------------------

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

  -----------------------------------I2路的流水寄存器-------------------------------

  --------------------------------第一级流水参数-----------------------------------
  SIGNAL S_data_pipel0_I2_0 : std_logic_vector(8 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel0_I2_1 : std_logic_vector(8 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel0_I2_2 : std_logic_vector(8 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel0_I2_3 : std_logic_vector(8 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel0_I2_4 : std_logic_vector(8 DOWNTO 0) := (OTHERS => '0');

  --------------------------------第二级流水参数-----------------------------------
  SIGNAL S_data_pipel1_I2_0 : std_logic_vector(24 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel1_I2_1 : std_logic_vector(24 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel1_I2_2 : std_logic_vector(24 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel1_I2_3 : std_logic_vector(24 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel1_I2_4 : std_logic_vector(24 DOWNTO 0) := (OTHERS => '0');
  --------------------------------第三级流水参数-----------------------------------
  SIGNAL S_data_pipel2_I2_0 : std_logic_vector(24 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel2_I2_1 : std_logic_vector(24 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel2_I2_2 : std_logic_vector(24 DOWNTO 0) := (OTHERS => '0');

  --------------------------------第四级流水参数-----------------------------------
  SIGNAL S_data_pipel3_I2_0 : std_logic_vector(25 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel3_I2_1 : std_logic_vector(25 DOWNTO 0) := (OTHERS => '0');

  --------------------------------第五级流水参数-----------------------------------
  SIGNAL s_data_pipel4_I2 : std_logic_vector(26 DOWNTO 0);

  -----------------------------------I3路的流水寄存器-------------------------------

  --------------------------------第一级流水参数-----------------------------------
  SIGNAL S_data_pipel0_I3_0 : std_logic_vector(8 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel0_I3_1 : std_logic_vector(8 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel0_I3_2 : std_logic_vector(8 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel0_I3_3 : std_logic_vector(8 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel0_I3_4 : std_logic_vector(8 DOWNTO 0) := (OTHERS => '0');

  --------------------------------第二级流水参数-----------------------------------
  SIGNAL S_data_pipel1_I3_0 : std_logic_vector(24 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel1_I3_1 : std_logic_vector(24 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel1_I3_2 : std_logic_vector(24 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel1_I3_3 : std_logic_vector(24 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel1_I3_4 : std_logic_vector(24 DOWNTO 0) := (OTHERS => '0');
  --------------------------------第三级流水参数-----------------------------------
  SIGNAL S_data_pipel2_I3_0 : std_logic_vector(24 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel2_I3_1 : std_logic_vector(24 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel2_I3_2 : std_logic_vector(24 DOWNTO 0) := (OTHERS => '0');

  --------------------------------第四级流水参数-----------------------------------
  SIGNAL S_data_pipel3_I3_0 : std_logic_vector(25 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel3_I3_1 : std_logic_vector(25 DOWNTO 0) := (OTHERS => '0');

  --------------------------------第五级流水参数-----------------------------------
  SIGNAL s_data_pipel4_I3 : std_logic_vector(26 DOWNTO 0);

  -----------------------------------I4路的流水寄存器-------------------------------

  --------------------------------第一级流水参数-----------------------------------
  SIGNAL S_data_pipel0_I4_0 : std_logic_vector(8 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel0_I4_1 : std_logic_vector(8 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel0_I4_2 : std_logic_vector(8 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel0_I4_3 : std_logic_vector(8 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel0_I4_4 : std_logic_vector(8 DOWNTO 0) := (OTHERS => '0');

  --------------------------------第二级流水参数-----------------------------------
  SIGNAL S_data_pipel1_I4_0 : std_logic_vector(24 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel1_I4_1 : std_logic_vector(24 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel1_I4_2 : std_logic_vector(24 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel1_I4_3 : std_logic_vector(24 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel1_I4_4 : std_logic_vector(24 DOWNTO 0) := (OTHERS => '0');
  --------------------------------第三级流水参数-----------------------------------
  SIGNAL S_data_pipel2_I4_0 : std_logic_vector(24 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel2_I4_1 : std_logic_vector(24 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel2_I4_2 : std_logic_vector(24 DOWNTO 0) := (OTHERS => '0');

  --------------------------------第四级流水参数-----------------------------------
  SIGNAL S_data_pipel3_I4_0 : std_logic_vector(25 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel3_I4_1 : std_logic_vector(25 DOWNTO 0) := (OTHERS => '0');

  --------------------------------第五级流水参数-----------------------------------
  SIGNAL s_data_pipel4_I4 : std_logic_vector(26 DOWNTO 0);

  -----------------------------------I5路的流水寄存器-------------------------------

  --------------------------------第一级流水参数-----------------------------------
  SIGNAL S_data_pipel0_I5_0 : std_logic_vector(8 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel0_I5_1 : std_logic_vector(8 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel0_I5_2 : std_logic_vector(8 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel0_I5_3 : std_logic_vector(8 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel0_I5_4 : std_logic_vector(8 DOWNTO 0) := (OTHERS => '0');

  --------------------------------第二级流水参数-----------------------------------
  SIGNAL S_data_pipel1_I5_0 : std_logic_vector(24 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel1_I5_1 : std_logic_vector(24 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel1_I5_2 : std_logic_vector(24 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel1_I5_3 : std_logic_vector(24 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel1_I5_4 : std_logic_vector(24 DOWNTO 0) := (OTHERS => '0');
  --------------------------------第三级流水参数-----------------------------------
  SIGNAL S_data_pipel2_I5_0 : std_logic_vector(24 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel2_I5_1 : std_logic_vector(24 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel2_I5_2 : std_logic_vector(24 DOWNTO 0) := (OTHERS => '0');

  --------------------------------第四级流水参数-----------------------------------
  SIGNAL S_data_pipel3_I5_0 : std_logic_vector(25 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel3_I5_1 : std_logic_vector(25 DOWNTO 0) := (OTHERS => '0');

  --------------------------------第五级流水参数-----------------------------------
  SIGNAL s_data_pipel4_I5 : std_logic_vector(26 DOWNTO 0);

  -----------------------------------I6路的流水寄存器-------------------------------

  --------------------------------第一级流水参数-----------------------------------
  SIGNAL S_data_pipel0_I6_0 : std_logic_vector(8 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel0_I6_1 : std_logic_vector(8 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel0_I6_2 : std_logic_vector(8 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel0_I6_3 : std_logic_vector(8 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel0_I6_4 : std_logic_vector(8 DOWNTO 0) := (OTHERS => '0');

  --------------------------------第二级流水参数-----------------------------------
  SIGNAL S_data_pipel1_I6_0 : std_logic_vector(24 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel1_I6_1 : std_logic_vector(24 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel1_I6_2 : std_logic_vector(24 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel1_I6_3 : std_logic_vector(24 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel1_I6_4 : std_logic_vector(24 DOWNTO 0) := (OTHERS => '0');
  --------------------------------第三级流水参数-----------------------------------
  SIGNAL S_data_pipel2_I6_0 : std_logic_vector(24 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel2_I6_1 : std_logic_vector(24 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel2_I6_2 : std_logic_vector(24 DOWNTO 0) := (OTHERS => '0');

  --------------------------------第四级流水参数-----------------------------------
  SIGNAL S_data_pipel3_I6_0 : std_logic_vector(25 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel3_I6_1 : std_logic_vector(25 DOWNTO 0) := (OTHERS => '0');

  --------------------------------第五级流水参数-----------------------------------
  SIGNAL s_data_pipel4_I6 : std_logic_vector(26 DOWNTO 0);

  -----------------------------------I7路的流水寄存器-------------------------------

  --------------------------------第一级流水参数-----------------------------------
  SIGNAL S_data_pipel0_I7_0 : std_logic_vector(8 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel0_I7_1 : std_logic_vector(8 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel0_I7_2 : std_logic_vector(8 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel0_I7_3 : std_logic_vector(8 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel0_I7_4 : std_logic_vector(8 DOWNTO 0) := (OTHERS => '0');

  --------------------------------第二级流水参数-----------------------------------
  SIGNAL S_data_pipel1_I7_0 : std_logic_vector(24 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel1_I7_1 : std_logic_vector(24 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel1_I7_2 : std_logic_vector(24 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel1_I7_3 : std_logic_vector(24 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel1_I7_4 : std_logic_vector(24 DOWNTO 0) := (OTHERS => '0');
  -------------------------------第三级流水参数-----------------------------------
  SIGNAL S_data_pipel2_I7_0 : std_logic_vector(24 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel2_I7_1 : std_logic_vector(24 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel2_I7_2 : std_logic_vector(24 DOWNTO 0) := (OTHERS => '0');

  --------------------------------第四级流水参数-----------------------------------
  SIGNAL S_data_pipel3_I7_0 : std_logic_vector(25 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel3_I7_1 : std_logic_vector(25 DOWNTO 0) := (OTHERS => '0');

  --------------------------------第五级流水参数-----------------------------------
  SIGNAL s_data_pipel4_I7 : std_logic_vector(26 DOWNTO 0);
  -------------------------------------------------------------------------
  --                  Q路流水寄存器
  -------------------------------------------------------------------------
  -----------------------------------Q0路的流水寄存器-------------------------------Note-> Q路抽取

  --------------------------------第一级流水参数-----------------------------------
  SIGNAL S_data_pipel0_Q0_0 : std_logic_vector(8 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel0_Q0_1 : std_logic_vector(8 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel0_Q0_2 : std_logic_vector(8 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel0_Q0_3 : std_logic_vector(8 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel0_Q0_4 : std_logic_vector(8 DOWNTO 0) := (OTHERS => '0');

  --------------------------------第二级流水参数-----------------------------------
  SIGNAL S_data_pipel1_Q0_0 : std_logic_vector(24 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel1_Q0_1 : std_logic_vector(24 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel1_Q0_2 : std_logic_vector(24 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel1_Q0_3 : std_logic_vector(24 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel1_Q0_4 : std_logic_vector(24 DOWNTO 0) := (OTHERS => '0');
  --------------------------------第三级流水参数-----------------------------------
  SIGNAL S_data_pipel2_Q0_0 : std_logic_vector(24 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel2_Q0_1 : std_logic_vector(24 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel2_Q0_2 : std_logic_vector(24 DOWNTO 0) := (OTHERS => '0');

  --------------------------------第四级流水参数-----------------------------------
  SIGNAL S_data_pipel3_Q0_0 : std_logic_vector(25 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel3_Q0_1 : std_logic_vector(25 DOWNTO 0) := (OTHERS => '0');

  --------------------------------第五级流水参数-----------------------------------
  SIGNAL s_data_pipel4_Q0 : std_logic_vector(26 DOWNTO 0);

  -----------------------------------Q1路的流水寄存器-------------------------------

  --------------------------------第一级流水参数-----------------------------------
  SIGNAL S_data_pipel0_Q1_0 : std_logic_vector(8 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel0_Q1_1 : std_logic_vector(8 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel0_Q1_2 : std_logic_vector(8 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel0_Q1_3 : std_logic_vector(8 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel0_Q1_4 : std_logic_vector(8 DOWNTO 0) := (OTHERS => '0');

  --------------------------------第二级流水参数-----------------------------------
  SIGNAL S_data_pipel1_Q1_0 : std_logic_vector(24 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel1_Q1_1 : std_logic_vector(24 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel1_Q1_2 : std_logic_vector(24 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel1_Q1_3 : std_logic_vector(24 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel1_Q1_4 : std_logic_vector(24 DOWNTO 0) := (OTHERS => '0');
  --------------------------------第三级流水参数-----------------------------------
  SIGNAL S_data_pipel2_Q1_0 : std_logic_vector(24 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel2_Q1_1 : std_logic_vector(24 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel2_Q1_2 : std_logic_vector(24 DOWNTO 0) := (OTHERS => '0');

  --------------------------------第四级流水参数-----------------------------------
  SIGNAL S_data_pipel3_Q1_0 : std_logic_vector(25 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel3_Q1_1 : std_logic_vector(25 DOWNTO 0) := (OTHERS => '0');

  --------------------------------第五级流水参数-----------------------------------
  SIGNAL s_data_pipel4_Q1 : std_logic_vector(26 DOWNTO 0);

  -----------------------------------Q2路的流水寄存器-------------------------------

  --------------------------------第一级流水参数-----------------------------------
  SIGNAL S_data_pipel0_Q2_0 : std_logic_vector(8 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel0_Q2_1 : std_logic_vector(8 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel0_Q2_2 : std_logic_vector(8 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel0_Q2_3 : std_logic_vector(8 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel0_Q2_4 : std_logic_vector(8 DOWNTO 0) := (OTHERS => '0');

  --------------------------------第二级流水参数-----------------------------------
  SIGNAL S_data_pipel1_Q2_0 : std_logic_vector(24 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel1_Q2_1 : std_logic_vector(24 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel1_Q2_2 : std_logic_vector(24 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel1_Q2_3 : std_logic_vector(24 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel1_Q2_4 : std_logic_vector(24 DOWNTO 0) := (OTHERS => '0');
  --------------------------------第三级流水参数-----------------------------------
  SIGNAL S_data_pipel2_Q2_0 : std_logic_vector(24 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel2_Q2_1 : std_logic_vector(24 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel2_Q2_2 : std_logic_vector(24 DOWNTO 0) := (OTHERS => '0');

  --------------------------------第四级流水参数-----------------------------------
  SIGNAL S_data_pipel3_Q2_0 : std_logic_vector(25 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel3_Q2_1 : std_logic_vector(25 DOWNTO 0) := (OTHERS => '0');

  --------------------------------第五级流水参数-----------------------------------
  SIGNAL s_data_pipel4_Q2 : std_logic_vector(26 DOWNTO 0);

  -----------------------------------Q3路的流水寄存器-------------------------------

  --------------------------------第一级流水参数-----------------------------------
  SIGNAL S_data_pipel0_Q3_0 : std_logic_vector(8 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel0_Q3_1 : std_logic_vector(8 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel0_Q3_2 : std_logic_vector(8 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel0_Q3_3 : std_logic_vector(8 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel0_Q3_4 : std_logic_vector(8 DOWNTO 0) := (OTHERS => '0');

  --------------------------------第二级流水参数-----------------------------------
  SIGNAL S_data_pipel1_Q3_0 : std_logic_vector(24 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel1_Q3_1 : std_logic_vector(24 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel1_Q3_2 : std_logic_vector(24 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel1_Q3_3 : std_logic_vector(24 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel1_Q3_4 : std_logic_vector(24 DOWNTO 0) := (OTHERS => '0');
  --------------------------------第三级流水参数-----------------------------------
  SIGNAL S_data_pipel2_Q3_0 : std_logic_vector(24 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel2_Q3_1 : std_logic_vector(24 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel2_Q3_2 : std_logic_vector(24 DOWNTO 0) := (OTHERS => '0');

  --------------------------------第四级流水参数-----------------------------------
  SIGNAL S_data_pipel3_Q3_0 : std_logic_vector(25 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel3_Q3_1 : std_logic_vector(25 DOWNTO 0) := (OTHERS => '0');

  --------------------------------第五级流水参数-----------------------------------
  SIGNAL s_data_pipel4_Q3 : std_logic_vector(26 DOWNTO 0);

  -----------------------------------Q4路的流水寄存器-------------------------------

  --------------------------------第一级流水参数-----------------------------------
  SIGNAL S_data_pipel0_Q4_0 : std_logic_vector(8 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel0_Q4_1 : std_logic_vector(8 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel0_Q4_2 : std_logic_vector(8 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel0_Q4_3 : std_logic_vector(8 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel0_Q4_4 : std_logic_vector(8 DOWNTO 0) := (OTHERS => '0');

  --------------------------------第二级流水参数-----------------------------------
  SIGNAL S_data_pipel1_Q4_0 : std_logic_vector(24 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel1_Q4_1 : std_logic_vector(24 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel1_Q4_2 : std_logic_vector(24 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel1_Q4_3 : std_logic_vector(24 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel1_Q4_4 : std_logic_vector(24 DOWNTO 0) := (OTHERS => '0');
  --------------------------------第三级流水参数-----------------------------------
  SIGNAL S_data_pipel2_Q4_0 : std_logic_vector(24 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel2_Q4_1 : std_logic_vector(24 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel2_Q4_2 : std_logic_vector(24 DOWNTO 0) := (OTHERS => '0');

  --------------------------------第四级流水参数-----------------------------------
  SIGNAL S_data_pipel3_Q4_0 : std_logic_vector(25 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel3_Q4_1 : std_logic_vector(25 DOWNTO 0) := (OTHERS => '0');

  --------------------------------第五级流水参数-----------------------------------
  SIGNAL s_data_pipel4_Q4 : std_logic_vector(26 DOWNTO 0);

  -----------------------------------Q5路的流水寄存器-------------------------------

  --------------------------------第一级流水参数-----------------------------------
  SIGNAL S_data_pipel0_Q5_0 : std_logic_vector(8 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel0_Q5_1 : std_logic_vector(8 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel0_Q5_2 : std_logic_vector(8 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel0_Q5_3 : std_logic_vector(8 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel0_Q5_4 : std_logic_vector(8 DOWNTO 0) := (OTHERS => '0');

  --------------------------------第二级流水参数-----------------------------------
  SIGNAL S_data_pipel1_Q5_0 : std_logic_vector(24 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel1_Q5_1 : std_logic_vector(24 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel1_Q5_2 : std_logic_vector(24 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel1_Q5_3 : std_logic_vector(24 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel1_Q5_4 : std_logic_vector(24 DOWNTO 0) := (OTHERS => '0');
  --------------------------------第三级流水参数-----------------------------------
  SIGNAL S_data_pipel2_Q5_0 : std_logic_vector(24 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel2_Q5_1 : std_logic_vector(24 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel2_Q5_2 : std_logic_vector(24 DOWNTO 0) := (OTHERS => '0');

  --------------------------------第四级流水参数-----------------------------------
  SIGNAL S_data_pipel3_Q5_0 : std_logic_vector(25 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel3_Q5_1 : std_logic_vector(25 DOWNTO 0) := (OTHERS => '0');

  --------------------------------第五级流水参数-----------------------------------
  SIGNAL s_data_pipel4_Q5 : std_logic_vector(26 DOWNTO 0);

  -----------------------------------Q6路的流水寄存器-------------------------------

  --------------------------------第一级流水参数-----------------------------------
  SIGNAL S_data_pipel0_Q6_0 : std_logic_vector(8 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel0_Q6_1 : std_logic_vector(8 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel0_Q6_2 : std_logic_vector(8 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel0_Q6_3 : std_logic_vector(8 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel0_Q6_4 : std_logic_vector(8 DOWNTO 0) := (OTHERS => '0');

  --------------------------------第二级流水参数-----------------------------------
  SIGNAL S_data_pipel1_Q6_0 : std_logic_vector(24 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel1_Q6_1 : std_logic_vector(24 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel1_Q6_2 : std_logic_vector(24 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel1_Q6_3 : std_logic_vector(24 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel1_Q6_4 : std_logic_vector(24 DOWNTO 0) := (OTHERS => '0');
  --------------------------------第三级流水参数-----------------------------------
  SIGNAL S_data_pipel2_Q6_0 : std_logic_vector(24 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel2_Q6_1 : std_logic_vector(24 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel2_Q6_2 : std_logic_vector(24 DOWNTO 0) := (OTHERS => '0');

  --------------------------------第四级流水参数-----------------------------------
  SIGNAL S_data_pipel3_Q6_0 : std_logic_vector(25 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel3_Q6_1 : std_logic_vector(25 DOWNTO 0) := (OTHERS => '0');

  --------------------------------第五级流水参数-----------------------------------
  SIGNAL s_data_pipel4_Q6 : std_logic_vector(26 DOWNTO 0);

  -----------------------------------Q7路的流水寄存器-------------------------------

  --------------------------------第一级流水参数-----------------------------------
  SIGNAL S_data_pipel0_Q7_0 : std_logic_vector(8 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel0_Q7_1 : std_logic_vector(8 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel0_Q7_2 : std_logic_vector(8 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel0_Q7_3 : std_logic_vector(8 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel0_Q7_4 : std_logic_vector(8 DOWNTO 0) := (OTHERS => '0');

  --------------------------------第二级流水参数-----------------------------------
  SIGNAL S_data_pipel1_Q7_0 : std_logic_vector(24 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel1_Q7_1 : std_logic_vector(24 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel1_Q7_2 : std_logic_vector(24 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel1_Q7_3 : std_logic_vector(24 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel1_Q7_4 : std_logic_vector(24 DOWNTO 0) := (OTHERS => '0');
  -------------------------------第三级流水参数-----------------------------------
  SIGNAL S_data_pipel2_Q7_0 : std_logic_vector(24 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel2_Q7_1 : std_logic_vector(24 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel2_Q7_2 : std_logic_vector(24 DOWNTO 0) := (OTHERS => '0');

  --------------------------------第四级流水参数-----------------------------------
  SIGNAL S_data_pipel3_Q7_0 : std_logic_vector(25 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_pipel3_Q7_1 : std_logic_vector(25 DOWNTO 0) := (OTHERS => '0');

  --------------------------------第五级流水参数-----------------------------------
  SIGNAL s_data_pipel4_Q7 : std_logic_vector(26 DOWNTO 0);
BEGIN

  P_input_pipel : PROCESS (I_clk, I_rst_n)
  BEGIN
    IF I_rst_n = '0' THEN
      S_data_mod_I0  <= (OTHERS => '0');
      S_data_mod_Q0  <= (OTHERS => '0');
      S_data_mod_I1  <= (OTHERS => '0');
      S_data_mod_Q1  <= (OTHERS => '0');
      S_data_mod_I2  <= (OTHERS => '0');
      S_data_mod_Q2  <= (OTHERS => '0');
      S_data_mod_I3  <= (OTHERS => '0');
      S_data_mod_Q3  <= (OTHERS => '0');
      S_data_mod_I4  <= (OTHERS => '0');
      S_data_mod_Q4  <= (OTHERS => '0');
      S_data_mod_I5  <= (OTHERS => '0');
      S_data_mod_Q5  <= (OTHERS => '0');
      S_data_mod_I6  <= (OTHERS => '0');
      S_data_mod_Q6  <= (OTHERS => '0');
      S_data_mod_I7  <= (OTHERS => '0');
      S_data_mod_Q7  <= (OTHERS => '0');
      S_data_mod_I8  <= (OTHERS => '0');
      S_data_mod_Q8  <= (OTHERS => '0');
      S_data_mod_I9  <= (OTHERS => '0');
      S_data_mod_Q9  <= (OTHERS => '0');
      S_data_mod_I10 <= (OTHERS => '0');
      S_data_mod_Q10 <= (OTHERS => '0');
      S_data_mod_I11 <= (OTHERS => '0');
      S_data_mod_Q11 <= (OTHERS => '0');
      S_data_mod_I12 <= (OTHERS => '0');
      S_data_mod_Q12 <= (OTHERS => '0');
      S_data_mod_I13 <= (OTHERS => '0');
      S_data_mod_Q13 <= (OTHERS => '0');
      S_data_mod_I14 <= (OTHERS => '0');
      S_data_mod_Q14 <= (OTHERS => '0');
      S_data_mod_I15 <= (OTHERS => '0');
      S_data_mod_Q15 <= (OTHERS => '0');
    ELSIF rising_edge(I_clk) THEN
      S_data_mod_I0  <= I_data_mod_I0;
      S_data_mod_Q0  <= I_data_mod_Q0;
      S_data_mod_I1  <= I_data_mod_I1;
      S_data_mod_Q1  <= I_data_mod_Q1;
      S_data_mod_I2  <= I_data_mod_I2;
      S_data_mod_Q2  <= I_data_mod_Q2;
      S_data_mod_I3  <= I_data_mod_I3;
      S_data_mod_Q3  <= I_data_mod_Q3;
      S_data_mod_I4  <= I_data_mod_I4;
      S_data_mod_Q4  <= I_data_mod_Q4;
      S_data_mod_I5  <= I_data_mod_I5;
      S_data_mod_Q5  <= I_data_mod_Q5;
      S_data_mod_I6  <= I_data_mod_I6;
      S_data_mod_Q6  <= I_data_mod_Q6;
      S_data_mod_I7  <= I_data_mod_I7;
      S_data_mod_Q7  <= I_data_mod_Q7;
      S_data_mod_I8  <= I_data_mod_I8;
      S_data_mod_Q8  <= I_data_mod_Q8;
      S_data_mod_I9  <= I_data_mod_I9;
      S_data_mod_Q9  <= I_data_mod_Q9;
      S_data_mod_I10 <= I_data_mod_I10;
      S_data_mod_Q10 <= I_data_mod_Q10;
      S_data_mod_I11 <= I_data_mod_I11;
      S_data_mod_Q11 <= I_data_mod_Q11;
      S_data_mod_I12 <= I_data_mod_I12;
      S_data_mod_Q12 <= I_data_mod_Q12;
      S_data_mod_I13 <= I_data_mod_I13;
      S_data_mod_Q13 <= I_data_mod_Q13;
      S_data_mod_I14 <= I_data_mod_I14;
      S_data_mod_Q14 <= I_data_mod_Q14;
      S_data_mod_I15 <= I_data_mod_I15;
      S_data_mod_Q15 <= I_data_mod_Q15;
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
      S_data_pipel0_I0_0 <= S_data_mod_I7(7) & S_data_mod_I7;
      S_data_pipel0_I0_1 <= (S_data_mod_I0(7) & S_data_mod_I0) + (S_data_mod_I14(7) & S_data_mod_I14);
      S_data_pipel0_I0_2 <= (S_data_mod_I2(7) & S_data_mod_I2) + (S_data_mod_I12(7) & S_data_mod_I12);
      S_data_pipel0_I0_3 <= (S_data_mod_I4(7) & S_data_mod_I4) + (S_data_mod_I10(7) & S_data_mod_I10);
      S_data_pipel0_I0_4 <= (S_data_mod_I6(7) & S_data_mod_I6) + (S_data_mod_I8(7) & S_data_mod_I8);
      -------------------第三级流水 24位扩位相加-------------------------
      S_data_pipel2_I0_0 <= (S_data_pipel1_I0_0(23) & S_data_pipel1_I0_0(23 DOWNTO 0)) + (S_data_pipel1_I0_1(23) & S_data_pipel1_I0_1(23 DOWNTO 0));
      S_data_pipel2_I0_1 <= (S_data_pipel1_I0_2(23) & S_data_pipel1_I0_2(23 DOWNTO 0));
      S_data_pipel2_I0_2 <= (S_data_pipel1_I0_3(23) & S_data_pipel1_I0_3(23 DOWNTO 0)) + (S_data_pipel1_I0_4(23) & S_data_pipel1_I0_4(23 DOWNTO 0));
      -------------------第四级流水 25位扩位相加-------------------------
      S_data_pipel3_I0_0 <= (S_data_pipel2_I0_0(24) & S_data_pipel2_I0_0);
      S_data_pipel3_I0_1 <= (S_data_pipel2_I0_1(24) & S_data_pipel2_I0_1) + (S_data_pipel2_I0_2(24) & S_data_pipel2_I0_2);
      -------------------第五级流水 26----------------------------------
      S_data_pipel4_I0 <= (S_data_pipel3_I0_0(25) & S_data_pipel3_I0_0) + (S_data_pipel3_I0_1(25) & S_data_pipel3_I0_1);
    END IF;
  END PROCESS;

  I0_p1_0_mult_gen_d0_int : mult_gen_d0_int
  PORT MAP(
    CLK  => I_clk,
    A    => S_data_pipel0_I0_0,
    B    => HB_COE7,
    CE   => I_rst_n,
    SCLR => '0',
    P    => S_data_pipel1_I0_0
  );
  I0_p1_1_mult_gen_d0_int : mult_gen_d0_int
  PORT MAP(
    CLK  => I_clk,
    A    => S_data_pipel0_I0_1,
    B    => HB_COE0,
    CE   => I_rst_n,
    SCLR => '0',
    P    => S_data_pipel1_I0_1
  );

  I0_p1_2_mult_gen_d0_int : mult_gen_d0_int
  PORT MAP(
    CLK  => I_clk,
    A    => S_data_pipel0_I0_2,
    B    => HB_COE2,
    CE   => I_rst_n,
    SCLR => '0',
    P    => S_data_pipel1_I0_2
  );

  I0_p1_3_mult_gen_d0_int : mult_gen_d0_int
  PORT MAP(
    CLK  => I_clk,
    A    => S_data_pipel0_I0_3,
    B    => HB_COE4,
    CE   => I_rst_n,
    SCLR => '0',
    P    => S_data_pipel1_I0_3
  );

  I0_p1_4_mult_gen_d0_int : mult_gen_d0_int
  PORT MAP(
    CLK  => I_clk,
    A    => S_data_pipel0_I0_4,
    B    => HB_COE6,
    CE   => I_rst_n,
    SCLR => '0',
    P    => S_data_pipel1_I0_4
  );

  ------------------------------------I1路--------------------------------------------------------------------------------
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
      S_data_pipel0_I1_0 <= S_data_mod_I9(7) & S_data_mod_I9;
      S_data_pipel0_I1_1 <= (S_data_mod_I2(7) & S_data_mod_I2) + (I_data_mod_I0(7) & I_data_mod_I0);
      S_data_pipel0_I1_2 <= (S_data_mod_I4(7) & S_data_mod_I4) + (S_data_mod_I14(7) & S_data_mod_I14);
      S_data_pipel0_I1_3 <= (S_data_mod_I6(7) & S_data_mod_I6) + (S_data_mod_I12(7) & S_data_mod_I12);
      S_data_pipel0_I1_4 <= (S_data_mod_I8(7) & S_data_mod_I8) + (S_data_mod_I10(7) & S_data_mod_I10);
      -------------------第三级流水 24位扩位相加-------------------------
      S_data_pipel2_I1_0 <= (S_data_pipel1_I1_0(23) & S_data_pipel1_I1_0(23 DOWNTO 0)) + (S_data_pipel1_I1_1(23) & S_data_pipel1_I1_1(23 DOWNTO 0));
      S_data_pipel2_I1_1 <= (S_data_pipel1_I1_2(23) & S_data_pipel1_I1_2(23 DOWNTO 0));
      S_data_pipel2_I1_2 <= (S_data_pipel1_I1_3(23) & S_data_pipel1_I1_3(23 DOWNTO 0)) + (S_data_pipel1_I1_4(23) & S_data_pipel1_I1_4(23 DOWNTO 0));
      -------------------第四级流水 25位扩位相加-------------------------
      S_data_pipel3_I1_0 <= (S_data_pipel2_I1_0(24) & S_data_pipel2_I1_0);
      S_data_pipel3_I1_1 <= (S_data_pipel2_I1_1(24) & S_data_pipel2_I1_1) + (S_data_pipel2_I1_2(24) & S_data_pipel2_I1_2);
      -------------------第五级流水 26----------------------------------
      S_data_pipel4_I1 <= (S_data_pipel3_I1_0(25) & S_data_pipel3_I1_0) + (S_data_pipel3_I1_1(25) & S_data_pipel3_I1_1);
    END IF;
  END PROCESS;

  I1_p1_0_mult_gen_d0_int : mult_gen_d0_int
  PORT MAP(
    CLK  => I_clk,
    A    => S_data_pipel0_I1_0,
    B    => HB_COE7,
    CE   => I_rst_n,
    SCLR => '0',
    P    => S_data_pipel1_I1_0
  );

  I1_p1_1_mult_gen_d0_int : mult_gen_d0_int
  PORT MAP(
    CLK  => I_clk,
    A    => S_data_pipel0_I1_1,
    B    => HB_COE0,
    CE   => I_rst_n,
    SCLR => '0',
    P    => S_data_pipel1_I1_1
  );

  I1_p1_2_mult_gen_d0_int : mult_gen_d0_int
  PORT MAP(
    CLK  => I_clk,
    A    => S_data_pipel0_I1_2,
    B    => HB_COE2,
    CE   => I_rst_n,
    SCLR => '0',
    P    => S_data_pipel1_I1_2
  );

  I1_p1_3_mult_gen_d0_int : mult_gen_d0_int
  PORT MAP(
    CLK  => I_clk,
    A    => S_data_pipel0_I1_3,
    B    => HB_COE4,
    CE   => I_rst_n,
    SCLR => '0',
    P    => S_data_pipel1_I1_3
  );

  I1_p1_4_mult_gen_d0_int : mult_gen_d0_int
  PORT MAP(
    CLK  => I_clk,
    A    => S_data_pipel0_I1_4,
    B    => HB_COE6,
    CE   => I_rst_n,
    SCLR => '0',
    P    => S_data_pipel1_I1_4
  );

  ------------------------------------I2路--------------------------------------------------------------------------------
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
      S_data_pipel0_I2_0 <= S_data_mod_I11(7) & S_data_mod_I11;
      S_data_pipel0_I2_1 <= (S_data_mod_I4(7) & S_data_mod_I4) + (I_data_mod_I2(7) & I_data_mod_I2);
      S_data_pipel0_I2_2 <= (S_data_mod_I6(7) & S_data_mod_I6) + (I_data_mod_I0(7) & I_data_mod_I0);
      S_data_pipel0_I2_3 <= (S_data_mod_I8(7) & S_data_mod_I8) + (S_data_mod_I14(7) & S_data_mod_I14);
      S_data_pipel0_I2_4 <= (S_data_mod_I10(7) & S_data_mod_I10) + (S_data_mod_I12(7) & S_data_mod_I12);
      -------------------第三级流水 24位扩位相加-------------------------
      S_data_pipel2_I2_0 <= (S_data_pipel1_I2_0(23) & S_data_pipel1_I2_0(23 DOWNTO 0)) + (S_data_pipel1_I2_1(23) & S_data_pipel1_I2_1(23 DOWNTO 0));
      S_data_pipel2_I2_1 <= (S_data_pipel1_I2_2(23) & S_data_pipel1_I2_2(23 DOWNTO 0));
      S_data_pipel2_I2_2 <= (S_data_pipel1_I2_3(23) & S_data_pipel1_I2_3(23 DOWNTO 0)) + (S_data_pipel1_I2_4(23) & S_data_pipel1_I2_4(23 DOWNTO 0));
      -------------------第四级流水 25位扩位相加-------------------------
      S_data_pipel3_I2_0 <= (S_data_pipel2_I2_0(24) & S_data_pipel2_I2_0);
      S_data_pipel3_I2_1 <= (S_data_pipel2_I2_1(24) & S_data_pipel2_I2_1) + (S_data_pipel2_I2_2(24) & S_data_pipel2_I2_2);
      -------------------第五级流水 26----------------------------------
      S_data_pipel4_I2 <= (S_data_pipel3_I2_0(25) & S_data_pipel3_I2_0) + (S_data_pipel3_I2_1(25) & S_data_pipel3_I2_1);
    END IF;
  END PROCESS;

  I2_p1_0_mult_gen_d0_int : mult_gen_d0_int
  PORT MAP(
    CLK  => I_clk,
    A    => S_data_pipel0_I2_0,
    B    => HB_COE7,
    CE   => I_rst_n,
    SCLR => '0',
    P    => S_data_pipel1_I2_0
  );

  I2_p1_1_mult_gen_d0_int : mult_gen_d0_int
  PORT MAP(
    CLK  => I_clk,
    A    => S_data_pipel0_I2_1,
    B    => HB_COE0,
    CE   => I_rst_n,
    SCLR => '0',
    P    => S_data_pipel1_I2_1
  );

  I2_p1_2_mult_gen_d0_int : mult_gen_d0_int
  PORT MAP(
    CLK  => I_clk,
    A    => S_data_pipel0_I2_2,
    B    => HB_COE2,
    CE   => I_rst_n,
    SCLR => '0',
    P    => S_data_pipel1_I2_2
  );

  I2_p1_3_mult_gen_d0_int : mult_gen_d0_int
  PORT MAP(
    CLK  => I_clk,
    A    => S_data_pipel0_I2_3,
    B    => HB_COE4,
    CE   => I_rst_n,
    SCLR => '0',
    P    => S_data_pipel1_I2_3
  );

  I2_p1_4_mult_gen_d0_int : mult_gen_d0_int
  PORT MAP(
    CLK  => I_clk,
    A    => S_data_pipel0_I2_4,
    B    => HB_COE6,
    CE   => I_rst_n,
    SCLR => '0',
    P    => S_data_pipel1_I2_4
  );

  ------------------------------------I3路--------------------------------------------------------------------------------
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
      S_data_pipel0_I3_0 <= S_data_mod_I13(7) & S_data_mod_I13;
      S_data_pipel0_I3_1 <= (S_data_mod_I6(7) & S_data_mod_I6) + (I_data_mod_I4(7) & I_data_mod_I4);
      S_data_pipel0_I3_2 <= (S_data_mod_I8(7) & S_data_mod_I8) + (I_data_mod_I2(7) & I_data_mod_I2);
      S_data_pipel0_I3_3 <= (S_data_mod_I10(7) & S_data_mod_I10) + (I_data_mod_I0(7) & I_data_mod_I0);
      S_data_pipel0_I3_4 <= (S_data_mod_I12(7) & S_data_mod_I12) + (S_data_mod_I14(7) & S_data_mod_I14);
      -------------------第三级流水 24位扩位相加-------------------------
      S_data_pipel2_I3_0 <= (S_data_pipel1_I3_0(23) & S_data_pipel1_I3_0(23 DOWNTO 0)) + (S_data_pipel1_I3_1(23) & S_data_pipel1_I3_1(23 DOWNTO 0));
      S_data_pipel2_I3_1 <= (S_data_pipel1_I3_2(23) & S_data_pipel1_I3_2(23 DOWNTO 0));
      S_data_pipel2_I3_2 <= (S_data_pipel1_I3_3(23) & S_data_pipel1_I3_3(23 DOWNTO 0)) + (S_data_pipel1_I3_4(23) & S_data_pipel1_I3_4(23 DOWNTO 0));
      -------------------第四级流水 25位扩位相加-------------------------
      S_data_pipel3_I3_0 <= (S_data_pipel2_I3_0(24) & S_data_pipel2_I3_0);
      S_data_pipel3_I3_1 <= (S_data_pipel2_I3_1(24) & S_data_pipel2_I3_1) + (S_data_pipel2_I3_2(24) & S_data_pipel2_I3_2);
      -------------------第五级流水 26----------------------------------
      S_data_pipel4_I3 <= (S_data_pipel3_I3_0(25) & S_data_pipel3_I3_0) + (S_data_pipel3_I3_1(25) & S_data_pipel3_I3_1);
    END IF;
  END PROCESS;

  I3_p1_0_mult_gen_d0_int : mult_gen_d0_int
  PORT MAP(
    CLK  => I_clk,
    A    => S_data_pipel0_I3_0,
    B    => HB_COE7,
    CE   => I_rst_n,
    SCLR => '0',
    P    => S_data_pipel1_I3_0
  );

  I3_p1_1_mult_gen_d0_int : mult_gen_d0_int
  PORT MAP(
    CLK  => I_clk,
    A    => S_data_pipel0_I3_1,
    B    => HB_COE0,
    CE   => I_rst_n,
    SCLR => '0',
    P    => S_data_pipel1_I3_1
  );

  I3_p1_2_mult_gen_d0_int : mult_gen_d0_int
  PORT MAP(
    CLK  => I_clk,
    A    => S_data_pipel0_I3_2,
    B    => HB_COE2,
    CE   => I_rst_n,
    SCLR => '0',
    P    => S_data_pipel1_I3_2
  );

  I3_p1_3_mult_gen_d0_int : mult_gen_d0_int
  PORT MAP(
    CLK  => I_clk,
    A    => S_data_pipel0_I3_3,
    B    => HB_COE4,
    CE   => I_rst_n,
    SCLR => '0',
    P    => S_data_pipel1_I3_3
  );

  I3_p1_4_mult_gen_d0_int : mult_gen_d0_int
  PORT MAP(
    CLK  => I_clk,
    A    => S_data_pipel0_I3_4,
    B    => HB_COE6,
    CE   => I_rst_n,
    SCLR => '0',
    P    => S_data_pipel1_I3_4
  );
  ------------------------------------I4路--------------------------------------------------------------------------------
  P_I4_Decimal : PROCESS (I_clk, I_rst_n)
  BEGIN
    IF I_rst_n = '0' THEN
      S_data_pipel0_I4_0 <= (OTHERS => '0');
      S_data_pipel0_I4_1 <= (OTHERS => '0');
      S_data_pipel0_I4_2 <= (OTHERS => '0');
      S_data_pipel0_I4_3 <= (OTHERS => '0');
      S_data_pipel0_I4_4 <= (OTHERS => '0');
      S_data_pipel2_I4_0 <= (OTHERS => '0');
      S_data_pipel2_I4_1 <= (OTHERS => '0');
      S_data_pipel2_I4_2 <= (OTHERS => '0');
      S_data_pipel3_I4_0 <= (OTHERS => '0');
      S_data_pipel3_I4_1 <= (OTHERS => '0');
      s_data_pipel4_I4   <= (OTHERS => '0');
    ELSIF rising_edge(I_clk) THEN
      -------------------第一级流水 扩符号位相加-------------------------
      S_data_pipel0_I4_0 <= S_data_mod_I15(7) & S_data_mod_I15;
      S_data_pipel0_I4_1 <= (S_data_mod_I8(7) & S_data_mod_I8) + (I_data_mod_I6(7) & I_data_mod_I6);
      S_data_pipel0_I4_2 <= (S_data_mod_I10(7) & S_data_mod_I10) + (I_data_mod_I4(7) & I_data_mod_I4);
      S_data_pipel0_I4_3 <= (S_data_mod_I12(7) & S_data_mod_I12) + (I_data_mod_I2(7) & I_data_mod_I2);
      S_data_pipel0_I4_4 <= (S_data_mod_I14(7) & S_data_mod_I14) + (I_data_mod_I0(7) & I_data_mod_I0);
      -------------------第三级流水 24位扩位相加-------------------------
      S_data_pipel2_I4_0 <= (S_data_pipel1_I4_0(23) & S_data_pipel1_I4_0(23 DOWNTO 0)) + (S_data_pipel1_I4_1(23) & S_data_pipel1_I4_1(23 DOWNTO 0));
      S_data_pipel2_I4_1 <= (S_data_pipel1_I4_2(23) & S_data_pipel1_I4_2(23 DOWNTO 0));
      S_data_pipel2_I4_2 <= (S_data_pipel1_I4_3(23) & S_data_pipel1_I4_3(23 DOWNTO 0)) + (S_data_pipel1_I4_4(23) & S_data_pipel1_I4_4(23 DOWNTO 0));
      -------------------第四级流水 25位扩位相加-------------------------
      S_data_pipel3_I4_0 <= (S_data_pipel2_I4_0(24) & S_data_pipel2_I4_0);
      S_data_pipel3_I4_1 <= (S_data_pipel2_I4_1(24) & S_data_pipel2_I4_1) + (S_data_pipel2_I4_2(24) & S_data_pipel2_I4_2);
      -------------------第五级流水 26----------------------------------
      S_data_pipel4_I4 <= (S_data_pipel3_I4_0(25) & S_data_pipel3_I4_0) + (S_data_pipel3_I4_1(25) & S_data_pipel3_I4_1);
    END IF;
  END PROCESS;

  I4_p1_0_mult_gen_d0_int : mult_gen_d0_int
  PORT MAP(
    CLK  => I_clk,
    A    => S_data_pipel0_I4_0,
    B    => HB_COE7,
    CE   => I_rst_n,
    SCLR => '0',
    P    => S_data_pipel1_I4_0
  );

  I4_p1_1_mult_gen_d0_int : mult_gen_d0_int
  PORT MAP(
    CLK  => I_clk,
    A    => S_data_pipel0_I4_1,
    B    => HB_COE0,
    CE   => I_rst_n,
    SCLR => '0',
    P    => S_data_pipel1_I4_1
  );

  I4_p1_2_mult_gen_d0_int : mult_gen_d0_int
  PORT MAP(
    CLK  => I_clk,
    A    => S_data_pipel0_I4_2,
    B    => HB_COE2,
    CE   => I_rst_n,
    SCLR => '0',
    P    => S_data_pipel1_I4_2
  );

  I4_p1_3_mult_gen_d0_int : mult_gen_d0_int
  PORT MAP(
    CLK  => I_clk,
    A    => S_data_pipel0_I4_3,
    B    => HB_COE4,
    CE   => I_rst_n,
    SCLR => '0',
    P    => S_data_pipel1_I4_3
  );

  I4_p1_4_mult_gen_d0_int : mult_gen_d0_int
  PORT MAP(
    CLK  => I_clk,
    A    => S_data_pipel0_I4_4,
    B    => HB_COE6,
    CE   => I_rst_n,
    SCLR => '0',
    P    => S_data_pipel1_I4_4
  );
  ------------------------------------I5路--------------------------------------------------------------------------------
  P_I5_Decimal : PROCESS (I_clk, I_rst_n)
  BEGIN
    IF I_rst_n = '0' THEN
      S_data_pipel0_I5_0 <= (OTHERS => '0');
      S_data_pipel0_I5_1 <= (OTHERS => '0');
      S_data_pipel0_I5_2 <= (OTHERS => '0');
      S_data_pipel0_I5_3 <= (OTHERS => '0');
      S_data_pipel0_I5_4 <= (OTHERS => '0');
      S_data_pipel2_I5_0 <= (OTHERS => '0');
      S_data_pipel2_I5_1 <= (OTHERS => '0');
      S_data_pipel2_I5_2 <= (OTHERS => '0');
      S_data_pipel3_I5_0 <= (OTHERS => '0');
      S_data_pipel3_I5_1 <= (OTHERS => '0');
      s_data_pipel4_I5   <= (OTHERS => '0');
    ELSIF rising_edge(I_clk) THEN
      -------------------第一级流水 扩符号位相加-------------------------
      S_data_pipel0_I5_0 <= I_data_mod_I1(7) & I_data_mod_I1;
      S_data_pipel0_I5_1 <= (S_data_mod_I10(7) & S_data_mod_I10) + (I_data_mod_I8(7) & I_data_mod_I8);
      S_data_pipel0_I5_2 <= (S_data_mod_I12(7) & S_data_mod_I12) + (I_data_mod_I6(7) & I_data_mod_I6);
      S_data_pipel0_I5_3 <= (S_data_mod_I14(7) & S_data_mod_I14) + (I_data_mod_I4(7) & I_data_mod_I4);
      S_data_pipel0_I5_4 <= (I_data_mod_I0(7) & I_data_mod_I0) + (I_data_mod_I2(7) & I_data_mod_I2);
      -------------------第三级流水 24位扩位相加-------------------------
      S_data_pipel2_I5_0 <= (S_data_pipel1_I5_0(23) & S_data_pipel1_I5_0(23 DOWNTO 0)) + (S_data_pipel1_I5_1(23) & S_data_pipel1_I5_1(23 DOWNTO 0));
      S_data_pipel2_I5_1 <= (S_data_pipel1_I5_2(23) & S_data_pipel1_I5_2(23 DOWNTO 0));
      S_data_pipel2_I5_2 <= (S_data_pipel1_I5_3(23) & S_data_pipel1_I5_3(23 DOWNTO 0)) + (S_data_pipel1_I5_4(23) & S_data_pipel1_I5_4(23 DOWNTO 0));
      -------------------第四级流水 25位扩位相加-------------------------
      S_data_pipel3_I5_0 <= (S_data_pipel2_I5_0(24) & S_data_pipel2_I5_0);
      S_data_pipel3_I5_1 <= (S_data_pipel2_I5_1(24) & S_data_pipel2_I5_1) + (S_data_pipel2_I5_2(24) & S_data_pipel2_I5_2);
      -------------------第五级流水 26----------------------------------
      S_data_pipel4_I5 <= (S_data_pipel3_I5_0(25) & S_data_pipel3_I5_0) + (S_data_pipel3_I5_1(25) & S_data_pipel3_I5_1);
    END IF;
  END PROCESS;

  I5_p1_0_mult_gen_d0_int : mult_gen_d0_int
  PORT MAP(
    CLK  => I_clk,
    A    => S_data_pipel0_I5_0,
    B    => HB_COE7,
    CE   => I_rst_n,
    SCLR => '0',
    P    => S_data_pipel1_I5_0
  );

  I5_p1_1_mult_gen_d0_int : mult_gen_d0_int
  PORT MAP(
    CLK  => I_clk,
    A    => S_data_pipel0_I5_1,
    B    => HB_COE0,
    CE   => I_rst_n,
    SCLR => '0',
    P    => S_data_pipel1_I5_1
  );

  I5_p1_2_mult_gen_d0_int : mult_gen_d0_int
  PORT MAP(
    CLK  => I_clk,
    A    => S_data_pipel0_I5_2,
    B    => HB_COE2,
    CE   => I_rst_n,
    SCLR => '0',
    P    => S_data_pipel1_I5_2
  );

  I5_p1_3_mult_gen_d0_int : mult_gen_d0_int
  PORT MAP(
    CLK  => I_clk,
    A    => S_data_pipel0_I5_3,
    B    => HB_COE4,
    CE   => I_rst_n,
    SCLR => '0',
    P    => S_data_pipel1_I5_3
  );

  I5_p1_4_mult_gen_d0_int : mult_gen_d0_int
  PORT MAP(
    CLK  => I_clk,
    A    => S_data_pipel0_I5_4,
    B    => HB_COE6,
    CE   => I_rst_n,
    SCLR => '0',
    P    => S_data_pipel1_I5_4
  );

  ------------------------------------I6路--------------------------------------------------------------------------------
  P_I6_Decimal : PROCESS (I_clk, I_rst_n)
  BEGIN
    IF I_rst_n = '0' THEN
      S_data_pipel0_I6_0 <= (OTHERS => '0');
      S_data_pipel0_I6_1 <= (OTHERS => '0');
      S_data_pipel0_I6_2 <= (OTHERS => '0');
      S_data_pipel0_I6_3 <= (OTHERS => '0');
      S_data_pipel0_I6_4 <= (OTHERS => '0');
      S_data_pipel2_I6_0 <= (OTHERS => '0');
      S_data_pipel2_I6_1 <= (OTHERS => '0');
      S_data_pipel2_I6_2 <= (OTHERS => '0');
      S_data_pipel3_I6_0 <= (OTHERS => '0');
      S_data_pipel3_I6_1 <= (OTHERS => '0');
      s_data_pipel4_I6   <= (OTHERS => '0');
    ELSIF rising_edge(I_clk) THEN
      -------------------第一级流水 扩符号位相加-------------------------
      S_data_pipel0_I6_0 <= I_data_mod_I3(7) & I_data_mod_I3;
      S_data_pipel0_I6_1 <= (S_data_mod_I12(7) & S_data_mod_I12) + (I_data_mod_I10(7) & I_data_mod_I10);
      S_data_pipel0_I6_2 <= (S_data_mod_I14(7) & S_data_mod_I14) + (I_data_mod_I8(7) & I_data_mod_I8);
      S_data_pipel0_I6_3 <= (I_data_mod_I0(7) & I_data_mod_I0) + (I_data_mod_I6(7) & I_data_mod_I6);
      S_data_pipel0_I6_4 <= (I_data_mod_I2(7) & I_data_mod_I2) + (I_data_mod_I4(7) & I_data_mod_I4);
      -------------------第三级流水 24位扩位相加-------------------------
      S_data_pipel2_I6_0 <= (S_data_pipel1_I6_0(23) & S_data_pipel1_I6_0(23 DOWNTO 0)) + (S_data_pipel1_I6_1(23) & S_data_pipel1_I6_1(23 DOWNTO 0));
      S_data_pipel2_I6_1 <= (S_data_pipel1_I6_2(23) & S_data_pipel1_I6_2(23 DOWNTO 0));
      S_data_pipel2_I6_2 <= (S_data_pipel1_I6_3(23) & S_data_pipel1_I6_3(23 DOWNTO 0)) + (S_data_pipel1_I6_4(23) & S_data_pipel1_I6_4(23 DOWNTO 0));
      -------------------第四级流水 25位扩位相加-------------------------
      S_data_pipel3_I6_0 <= (S_data_pipel2_I6_0(24) & S_data_pipel2_I6_0);
      S_data_pipel3_I6_1 <= (S_data_pipel2_I6_1(24) & S_data_pipel2_I6_1) + (S_data_pipel2_I6_2(24) & S_data_pipel2_I6_2);
      -------------------第五级流水 26----------------------------------
      S_data_pipel4_I6 <= (S_data_pipel3_I6_0(25) & S_data_pipel3_I6_0) + (S_data_pipel3_I6_1(25) & S_data_pipel3_I6_1);
    END IF;
  END PROCESS;

  I6_p1_0_mult_gen_d0_int : mult_gen_d0_int
  PORT MAP(
    CLK  => I_clk,
    A    => S_data_pipel0_I6_0,
    B    => HB_COE7,
    CE   => I_rst_n,
    SCLR => '0',
    P    => S_data_pipel1_I6_0
  );

  I6_p1_1_mult_gen_d0_int : mult_gen_d0_int
  PORT MAP(
    CLK  => I_clk,
    A    => S_data_pipel0_I6_1,
    B    => HB_COE0,
    CE   => I_rst_n,
    SCLR => '0',
    P    => S_data_pipel1_I6_1
  );

  I6_p1_2_mult_gen_d0_int : mult_gen_d0_int
  PORT MAP(
    CLK  => I_clk,
    A    => S_data_pipel0_I6_2,
    B    => HB_COE2,
    CE   => I_rst_n,
    SCLR => '0',
    P    => S_data_pipel1_I6_2
  );

  I6_p1_3_mult_gen_d0_int : mult_gen_d0_int
  PORT MAP(
    CLK  => I_clk,
    A    => S_data_pipel0_I6_3,
    B    => HB_COE4,
    CE   => I_rst_n,
    SCLR => '0',
    P    => S_data_pipel1_I6_3
  );

  I6_p1_4_mult_gen_d0_int : mult_gen_d0_int
  PORT MAP(
    CLK  => I_clk,
    A    => S_data_pipel0_I6_4,
    B    => HB_COE6,
    CE   => I_rst_n,
    SCLR => '0',
    P    => S_data_pipel1_I6_4
  );


  
  ------------------------------------I7路--------------------------------------------------------------------------------
  P_I7_Decimal : PROCESS (I_clk, I_rst_n)
  BEGIN
    IF I_rst_n = '0' THEN
      S_data_pipel0_I7_0 <= (OTHERS => '0');
      S_data_pipel0_I7_1 <= (OTHERS => '0');
      S_data_pipel0_I7_2 <= (OTHERS => '0');
      S_data_pipel0_I7_3 <= (OTHERS => '0');
      S_data_pipel0_I7_4 <= (OTHERS => '0');
      S_data_pipel2_I7_0 <= (OTHERS => '0');
      S_data_pipel2_I7_1 <= (OTHERS => '0');
      S_data_pipel2_I7_2 <= (OTHERS => '0');
      S_data_pipel3_I7_0 <= (OTHERS => '0');
      S_data_pipel3_I7_1 <= (OTHERS => '0');
      s_data_pipel4_I7   <= (OTHERS => '0');
    ELSIF rising_edge(I_clk) THEN
      -------------------第一级流水 扩符号位相加-------------------------
      S_data_pipel0_I7_0 <= I_data_mod_I5(7) & I_data_mod_I5;
      S_data_pipel0_I7_1 <= (S_data_mod_I14(7) & S_data_mod_I14) + (I_data_mod_I12(7) & I_data_mod_I12);
      S_data_pipel0_I7_2 <= (I_data_mod_I0(7) & I_data_mod_I0) + (I_data_mod_I10(7) & I_data_mod_I10);
      S_data_pipel0_I7_3 <= (I_data_mod_I2(7) & I_data_mod_I2) + (I_data_mod_I8(7) & I_data_mod_I8);
      S_data_pipel0_I7_4 <= (I_data_mod_I4(7) & I_data_mod_I4) + (I_data_mod_I6(7) & I_data_mod_I6);
      -------------------第三级流水 24位扩位相加-------------------------
      S_data_pipel2_I7_0 <= (S_data_pipel1_I7_0(23) & S_data_pipel1_I7_0(23 DOWNTO 0)) + (S_data_pipel1_I7_1(23) & S_data_pipel1_I7_1(23 DOWNTO 0));
      S_data_pipel2_I7_1 <= (S_data_pipel1_I7_2(23) & S_data_pipel1_I7_2(23 DOWNTO 0));
      S_data_pipel2_I7_2 <= (S_data_pipel1_I7_3(23) & S_data_pipel1_I7_3(23 DOWNTO 0)) + (S_data_pipel1_I7_4(23) & S_data_pipel1_I7_4(23 DOWNTO 0));
      -------------------第四级流水 25位扩位相加-------------------------
      S_data_pipel3_I7_0 <= (S_data_pipel2_I7_0(24) & S_data_pipel2_I7_0);
      S_data_pipel3_I7_1 <= (S_data_pipel2_I7_1(24) & S_data_pipel2_I7_1) + (S_data_pipel2_I7_2(24) & S_data_pipel2_I7_2);
      -------------------第五级流水 26----------------------------------
      S_data_pipel4_I7 <= (S_data_pipel3_I7_0(25) & S_data_pipel3_I7_0) + (S_data_pipel3_I7_1(25) & S_data_pipel3_I7_1);
    END IF;
  END PROCESS;

  I7_p1_0_mult_gen_d0_int : mult_gen_d0_int
  PORT MAP(
    CLK  => I_clk,
    A    => S_data_pipel0_I7_0,
    B    => HB_COE7,
    CE   => I_rst_n,
    SCLR => '0',
    P    => S_data_pipel1_I7_0
  );

  I7_p1_1_mult_gen_d0_int : mult_gen_d0_int
  PORT MAP(
    CLK  => I_clk,
    A    => S_data_pipel0_I7_1,
    B    => HB_COE0,
    CE   => I_rst_n,
    SCLR => '0',
    P    => S_data_pipel1_I7_1
  );

  I7_p1_2_mult_gen_d0_int : mult_gen_d0_int
  PORT MAP(
    CLK  => I_clk,
    A    => S_data_pipel0_I7_2,
    B    => HB_COE2,
    CE   => I_rst_n,
    SCLR => '0',
    P    => S_data_pipel1_I7_2
  );

  I7_p1_3_mult_gen_d0_int : mult_gen_d0_int
  PORT MAP(
    CLK  => I_clk,
    A    => S_data_pipel0_I7_3,
    B    => HB_COE4,
    CE   => I_rst_n,
    SCLR => '0',
    P    => S_data_pipel1_I7_3
  );

  I7_p1_4_mult_gen_d0_int : mult_gen_d0_int
  PORT MAP(
    CLK  => I_clk,
    A    => S_data_pipel0_I7_4,
    B    => HB_COE6,
    CE   => I_rst_n,
    SCLR => '0',
    P    => S_data_pipel1_I7_4
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
      S_data_pipel0_Q0_0 <= S_data_mod_Q7(7) & S_data_mod_Q7;
      S_data_pipel0_Q0_1 <= (S_data_mod_Q0(7) & S_data_mod_Q0) + (S_data_mod_Q14(7) & S_data_mod_Q14);
      S_data_pipel0_Q0_2 <= (S_data_mod_Q2(7) & S_data_mod_Q2) + (S_data_mod_Q12(7) & S_data_mod_Q12);
      S_data_pipel0_Q0_3 <= (S_data_mod_Q4(7) & S_data_mod_Q4) + (S_data_mod_Q10(7) & S_data_mod_Q10);
      S_data_pipel0_Q0_4 <= (S_data_mod_Q6(7) & S_data_mod_Q6) + (S_data_mod_Q8(7) & S_data_mod_Q8);
      -------------------第三级流水 24位扩位相加-------------------------
      S_data_pipel2_Q0_0 <= (S_data_pipel1_Q0_0(23) & S_data_pipel1_Q0_0(23 DOWNTO 0)) + (S_data_pipel1_Q0_1(23) & S_data_pipel1_Q0_1(23 DOWNTO 0));
      S_data_pipel2_Q0_1 <= (S_data_pipel1_Q0_2(23) & S_data_pipel1_Q0_2(23 DOWNTO 0));
      S_data_pipel2_Q0_2 <= (S_data_pipel1_Q0_3(23) & S_data_pipel1_Q0_3(23 DOWNTO 0)) + (S_data_pipel1_Q0_4(23) & S_data_pipel1_Q0_4(23 DOWNTO 0));
      -------------------第四级流水 25位扩位相加-------------------------
      S_data_pipel3_Q0_0 <= (S_data_pipel2_Q0_0(24) & S_data_pipel2_Q0_0);
      S_data_pipel3_Q0_1 <= (S_data_pipel2_Q0_1(24) & S_data_pipel2_Q0_1) + (S_data_pipel2_Q0_2(24) & S_data_pipel2_Q0_2);
      -------------------第五级流水 26----------------------------------
      S_data_pipel4_Q0 <= (S_data_pipel3_Q0_0(25) & S_data_pipel3_Q0_0) + (S_data_pipel3_Q0_1(25) & S_data_pipel3_Q0_1);
    END IF;
  END PROCESS;

  Q0_p1_0_mult_gen_d0_int : mult_gen_d0_int
  PORT MAP(
    CLK  => I_clk,
    A    => S_data_pipel0_Q0_0,
    B    => HB_COE7,
    CE   => I_rst_n,
    SCLR => '0',
    P    => S_data_pipel1_Q0_0
  );
  Q0_p1_1_mult_gen_d0_int : mult_gen_d0_int
  PORT MAP(
    CLK  => I_clk,
    A    => S_data_pipel0_Q0_1,
    B    => HB_COE0,
    CE   => I_rst_n,
    SCLR => '0',
    P    => S_data_pipel1_Q0_1
  );

  Q0_p1_2_mult_gen_d0_int : mult_gen_d0_int
  PORT MAP(
    CLK  => I_clk,
    A    => S_data_pipel0_Q0_2,
    B    => HB_COE2,
    CE   => I_rst_n,
    SCLR => '0',
    P    => S_data_pipel1_Q0_2
  );

  Q0_p1_3_mult_gen_d0_int : mult_gen_d0_int
  PORT MAP(
    CLK  => I_clk,
    A    => S_data_pipel0_Q0_3,
    B    => HB_COE4,
    CE   => I_rst_n,
    SCLR => '0',
    P    => S_data_pipel1_Q0_3
  );

  Q0_p1_4_mult_gen_d0_int : mult_gen_d0_int
  PORT MAP(
    CLK  => I_clk,
    A    => S_data_pipel0_Q0_4,
    B    => HB_COE6,
    CE   => I_rst_n,
    SCLR => '0',
    P    => S_data_pipel1_Q0_4
  );

  ------------------------------------Q1路--------------------------------------------------------------------------------
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
      S_data_pipel0_Q1_0 <= S_data_mod_Q9(7) & S_data_mod_Q9;
      S_data_pipel0_Q1_1 <= (S_data_mod_Q2(7) & S_data_mod_Q2) + (I_data_mod_Q0(7) & I_data_mod_Q0);
      S_data_pipel0_Q1_2 <= (S_data_mod_Q4(7) & S_data_mod_Q4) + (S_data_mod_Q14(7) & S_data_mod_Q14);
      S_data_pipel0_Q1_3 <= (S_data_mod_Q6(7) & S_data_mod_Q6) + (S_data_mod_Q12(7) & S_data_mod_Q12);
      S_data_pipel0_Q1_4 <= (S_data_mod_Q8(7) & S_data_mod_Q8) + (S_data_mod_Q10(7) & S_data_mod_Q10);
      -------------------第三级流水 24位扩位相加-------------------------
      S_data_pipel2_Q1_0 <= (S_data_pipel1_Q1_0(23) & S_data_pipel1_Q1_0(23 DOWNTO 0)) + (S_data_pipel1_Q1_1(23) & S_data_pipel1_Q1_1(23 DOWNTO 0));
      S_data_pipel2_Q1_1 <= (S_data_pipel1_Q1_2(23) & S_data_pipel1_Q1_2(23 DOWNTO 0));
      S_data_pipel2_Q1_2 <= (S_data_pipel1_Q1_3(23) & S_data_pipel1_Q1_3(23 DOWNTO 0)) + (S_data_pipel1_Q1_4(23) & S_data_pipel1_Q1_4(23 DOWNTO 0));
      -------------------第四级流水 25位扩位相加-------------------------
      S_data_pipel3_Q1_0 <= (S_data_pipel2_Q1_0(24) & S_data_pipel2_Q1_0);
      S_data_pipel3_Q1_1 <= (S_data_pipel2_Q1_1(24) & S_data_pipel2_Q1_1) + (S_data_pipel2_Q1_2(24) & S_data_pipel2_Q1_2);
      -------------------第五级流水 26----------------------------------
      S_data_pipel4_Q1 <= (S_data_pipel3_Q1_0(25) & S_data_pipel3_Q1_0) + (S_data_pipel3_Q1_1(25) & S_data_pipel3_Q1_1);
    END IF;
  END PROCESS;

  Q1_p1_0_mult_gen_d0_int : mult_gen_d0_int
  PORT MAP(
    CLK  => I_clk,
    A    => S_data_pipel0_Q1_0,
    B    => HB_COE7,
    CE   => I_rst_n,
    SCLR => '0',
    P    => S_data_pipel1_Q1_0
  );

  Q1_p1_1_mult_gen_d0_int : mult_gen_d0_int
  PORT MAP(
    CLK  => I_clk,
    A    => S_data_pipel0_Q1_1,
    B    => HB_COE0,
    CE   => I_rst_n,
    SCLR => '0',
    P    => S_data_pipel1_Q1_1
  );

  Q1_p1_2_mult_gen_d0_int : mult_gen_d0_int
  PORT MAP(
    CLK  => I_clk,
    A    => S_data_pipel0_Q1_2,
    B    => HB_COE2,
    CE   => I_rst_n,
    SCLR => '0',
    P    => S_data_pipel1_Q1_2
  );

  Q1_p1_3_mult_gen_d0_int : mult_gen_d0_int
  PORT MAP(
    CLK  => I_clk,
    A    => S_data_pipel0_Q1_3,
    B    => HB_COE4,
    CE   => I_rst_n,
    SCLR => '0',
    P    => S_data_pipel1_Q1_3
  );

  Q1_p1_4_mult_gen_d0_int : mult_gen_d0_int
  PORT MAP(
    CLK  => I_clk,
    A    => S_data_pipel0_Q1_4,
    B    => HB_COE6,
    CE   => I_rst_n,
    SCLR => '0',
    P    => S_data_pipel1_Q1_4
  );

  ------------------------------------Q2路--------------------------------------------------------------------------------
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
      S_data_pipel0_Q2_0 <= S_data_mod_Q11(7) & S_data_mod_Q11;
      S_data_pipel0_Q2_1 <= (S_data_mod_Q4(7) & S_data_mod_Q4) + (I_data_mod_Q2(7) & I_data_mod_Q2);
      S_data_pipel0_Q2_2 <= (S_data_mod_Q6(7) & S_data_mod_Q6) + (I_data_mod_Q0(7) & I_data_mod_Q0);
      S_data_pipel0_Q2_3 <= (S_data_mod_Q8(7) & S_data_mod_Q8) + (S_data_mod_Q14(7) & S_data_mod_Q14);
      S_data_pipel0_Q2_4 <= (S_data_mod_Q10(7) & S_data_mod_Q10) + (S_data_mod_Q12(7) & S_data_mod_Q12);
      -------------------第三级流水 24位扩位相加-------------------------
      S_data_pipel2_Q2_0 <= (S_data_pipel1_Q2_0(23) & S_data_pipel1_Q2_0(23 DOWNTO 0)) + (S_data_pipel1_Q2_1(23) & S_data_pipel1_Q2_1(23 DOWNTO 0));
      S_data_pipel2_Q2_1 <= (S_data_pipel1_Q2_2(23) & S_data_pipel1_Q2_2(23 DOWNTO 0));
      S_data_pipel2_Q2_2 <= (S_data_pipel1_Q2_3(23) & S_data_pipel1_Q2_3(23 DOWNTO 0)) + (S_data_pipel1_Q2_4(23) & S_data_pipel1_Q2_4(23 DOWNTO 0));
      -------------------第四级流水 25位扩位相加-------------------------
      S_data_pipel3_Q2_0 <= (S_data_pipel2_Q2_0(24) & S_data_pipel2_Q2_0);
      S_data_pipel3_Q2_1 <= (S_data_pipel2_Q2_1(24) & S_data_pipel2_Q2_1) + (S_data_pipel2_Q2_2(24) & S_data_pipel2_Q2_2);
      -------------------第五级流水 26----------------------------------
      S_data_pipel4_Q2 <= (S_data_pipel3_Q2_0(25) & S_data_pipel3_Q2_0) + (S_data_pipel3_Q2_1(25) & S_data_pipel3_Q2_1);
    END IF;
  END PROCESS;

  Q2_p1_0_mult_gen_d0_int : mult_gen_d0_int
  PORT MAP(
    CLK  => I_clk,
    A    => S_data_pipel0_Q2_0,
    B    => HB_COE7,
    CE   => I_rst_n,
    SCLR => '0',
    P    => S_data_pipel1_Q2_0
  );

  Q2_p1_1_mult_gen_d0_int : mult_gen_d0_int
  PORT MAP(
    CLK  => I_clk,
    A    => S_data_pipel0_Q2_1,
    B    => HB_COE0,
    CE   => I_rst_n,
    SCLR => '0',
    P    => S_data_pipel1_Q2_1
  );

  Q2_p1_2_mult_gen_d0_int : mult_gen_d0_int
  PORT MAP(
    CLK  => I_clk,
    A    => S_data_pipel0_Q2_2,
    B    => HB_COE2,
    CE   => I_rst_n,
    SCLR => '0',
    P    => S_data_pipel1_Q2_2
  );

  Q2_p1_3_mult_gen_d0_int : mult_gen_d0_int
  PORT MAP(
    CLK  => I_clk,
    A    => S_data_pipel0_Q2_3,
    B    => HB_COE4,
    CE   => I_rst_n,
    SCLR => '0',
    P    => S_data_pipel1_Q2_3
  );

  Q2_p1_4_mult_gen_d0_int : mult_gen_d0_int
  PORT MAP(
    CLK  => I_clk,
    A    => S_data_pipel0_Q2_4,
    B    => HB_COE6,
    CE   => I_rst_n,
    SCLR => '0',
    P    => S_data_pipel1_Q2_4
  );

  ------------------------------------Q3路--------------------------------------------------------------------------------
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
      S_data_pipel0_Q3_0 <= S_data_mod_Q13(7) & S_data_mod_Q13;
      S_data_pipel0_Q3_1 <= (S_data_mod_Q6(7) & S_data_mod_Q6) + (I_data_mod_Q4(7) & I_data_mod_Q4);
      S_data_pipel0_Q3_2 <= (S_data_mod_Q8(7) & S_data_mod_Q8) + (I_data_mod_Q2(7) & I_data_mod_Q2);
      S_data_pipel0_Q3_3 <= (S_data_mod_Q10(7) & S_data_mod_Q10) + (I_data_mod_Q0(7) & I_data_mod_Q0);
      S_data_pipel0_Q3_4 <= (S_data_mod_Q12(7) & S_data_mod_Q12) + (S_data_mod_Q14(7) & S_data_mod_Q14);
      -------------------第三级流水 24位扩位相加-------------------------
      S_data_pipel2_Q3_0 <= (S_data_pipel1_Q3_0(23) & S_data_pipel1_Q3_0(23 DOWNTO 0)) + (S_data_pipel1_Q3_1(23) & S_data_pipel1_Q3_1(23 DOWNTO 0));
      S_data_pipel2_Q3_1 <= (S_data_pipel1_Q3_2(23) & S_data_pipel1_Q3_2(23 DOWNTO 0));
      S_data_pipel2_Q3_2 <= (S_data_pipel1_Q3_3(23) & S_data_pipel1_Q3_3(23 DOWNTO 0)) + (S_data_pipel1_Q3_4(23) & S_data_pipel1_Q3_4(23 DOWNTO 0));
      -------------------第四级流水 25位扩位相加-------------------------
      S_data_pipel3_Q3_0 <= (S_data_pipel2_Q3_0(24) & S_data_pipel2_Q3_0);
      S_data_pipel3_Q3_1 <= (S_data_pipel2_Q3_1(24) & S_data_pipel2_Q3_1) + (S_data_pipel2_Q3_2(24) & S_data_pipel2_Q3_2);
      -------------------第五级流水 26----------------------------------
      S_data_pipel4_Q3 <= (S_data_pipel3_Q3_0(25) & S_data_pipel3_Q3_0) + (S_data_pipel3_Q3_1(25) & S_data_pipel3_Q3_1);
    END IF;
  END PROCESS;

  Q3_p1_0_mult_gen_d0_int : mult_gen_d0_int
  PORT MAP(
    CLK  => I_clk,
    A    => S_data_pipel0_Q3_0,
    B    => HB_COE7,
    CE   => I_rst_n,
    SCLR => '0',
    P    => S_data_pipel1_Q3_0
  );

  Q3_p1_1_mult_gen_d0_int : mult_gen_d0_int
  PORT MAP(
    CLK  => I_clk,
    A    => S_data_pipel0_Q3_1,
    B    => HB_COE0,
    CE   => I_rst_n,
    SCLR => '0',
    P    => S_data_pipel1_Q3_1
  );

  Q3_p1_2_mult_gen_d0_int : mult_gen_d0_int
  PORT MAP(
    CLK  => I_clk,
    A    => S_data_pipel0_Q3_2,
    B    => HB_COE2,
    CE   => I_rst_n,
    SCLR => '0',
    P    => S_data_pipel1_Q3_2
  );

  Q3_p1_3_mult_gen_d0_int : mult_gen_d0_int
  PORT MAP(
    CLK  => I_clk,
    A    => S_data_pipel0_Q3_3,
    B    => HB_COE4,
    CE   => I_rst_n,
    SCLR => '0',
    P    => S_data_pipel1_Q3_3
  );

  Q3_p1_4_mult_gen_d0_int : mult_gen_d0_int
  PORT MAP(
    CLK  => I_clk,
    A    => S_data_pipel0_Q3_4,
    B    => HB_COE6,
    CE   => I_rst_n,
    SCLR => '0',
    P    => S_data_pipel1_Q3_4
  );
  ------------------------------------Q4路--------------------------------------------------------------------------------
  P_Q4_Decimal : PROCESS (I_clk, I_rst_n)
  BEGIN
    IF I_rst_n = '0' THEN
      S_data_pipel0_Q4_0 <= (OTHERS => '0');
      S_data_pipel0_Q4_1 <= (OTHERS => '0');
      S_data_pipel0_Q4_2 <= (OTHERS => '0');
      S_data_pipel0_Q4_3 <= (OTHERS => '0');
      S_data_pipel0_Q4_4 <= (OTHERS => '0');
      S_data_pipel2_Q4_0 <= (OTHERS => '0');
      S_data_pipel2_Q4_1 <= (OTHERS => '0');
      S_data_pipel2_Q4_2 <= (OTHERS => '0');
      S_data_pipel3_Q4_0 <= (OTHERS => '0');
      S_data_pipel3_Q4_1 <= (OTHERS => '0');
      s_data_pipel4_Q4   <= (OTHERS => '0');
    ELSIF rising_edge(I_clk) THEN
      -------------------第一级流水 扩符号位相加-------------------------
      S_data_pipel0_Q4_0 <= S_data_mod_Q15(7) & S_data_mod_Q15;
      S_data_pipel0_Q4_1 <= (S_data_mod_Q8(7) & S_data_mod_Q8) + (I_data_mod_Q6(7) & I_data_mod_Q6);
      S_data_pipel0_Q4_2 <= (S_data_mod_Q10(7) & S_data_mod_Q10) + (I_data_mod_Q4(7) & I_data_mod_Q4);
      S_data_pipel0_Q4_3 <= (S_data_mod_Q12(7) & S_data_mod_Q12) + (I_data_mod_Q2(7) & I_data_mod_Q2);
      S_data_pipel0_Q4_4 <= (S_data_mod_Q14(7) & S_data_mod_Q14) + (I_data_mod_Q0(7) & I_data_mod_Q0);
      -------------------第三级流水 24位扩位相加-------------------------
      S_data_pipel2_Q4_0 <= (S_data_pipel1_Q4_0(23) & S_data_pipel1_Q4_0(23 DOWNTO 0)) + (S_data_pipel1_Q4_1(23) & S_data_pipel1_Q4_1(23 DOWNTO 0));
      S_data_pipel2_Q4_1 <= (S_data_pipel1_Q4_2(23) & S_data_pipel1_Q4_2(23 DOWNTO 0));
      S_data_pipel2_Q4_2 <= (S_data_pipel1_Q4_3(23) & S_data_pipel1_Q4_3(23 DOWNTO 0)) + (S_data_pipel1_Q4_4(23) & S_data_pipel1_Q4_4(23 DOWNTO 0));
      -------------------第四级流水 25位扩位相加-------------------------
      S_data_pipel3_Q4_0 <= (S_data_pipel2_Q4_0(24) & S_data_pipel2_Q4_0);
      S_data_pipel3_Q4_1 <= (S_data_pipel2_Q4_1(24) & S_data_pipel2_Q4_1) + (S_data_pipel2_Q4_2(24) & S_data_pipel2_Q4_2);
      -------------------第五级流水 26----------------------------------
      S_data_pipel4_Q4 <= (S_data_pipel3_Q4_0(25) & S_data_pipel3_Q4_0) + (S_data_pipel3_Q4_1(25) & S_data_pipel3_Q4_1);
    END IF;
  END PROCESS;

  Q4_p1_0_mult_gen_d0_int : mult_gen_d0_int
  PORT MAP(
    CLK  => I_clk,
    A    => S_data_pipel0_Q4_0,
    B    => HB_COE7,
    CE   => I_rst_n,
    SCLR => '0',
    P    => S_data_pipel1_Q4_0
  );

  Q4_p1_1_mult_gen_d0_int : mult_gen_d0_int
  PORT MAP(
    CLK  => I_clk,
    A    => S_data_pipel0_Q4_1,
    B    => HB_COE0,
    CE   => I_rst_n,
    SCLR => '0',
    P    => S_data_pipel1_Q4_1
  );

  Q4_p1_2_mult_gen_d0_int : mult_gen_d0_int
  PORT MAP(
    CLK  => I_clk,
    A    => S_data_pipel0_Q4_2,
    B    => HB_COE2,
    CE   => I_rst_n,
    SCLR => '0',
    P    => S_data_pipel1_Q4_2
  );

  Q4_p1_3_mult_gen_d0_int : mult_gen_d0_int
  PORT MAP(
    CLK  => I_clk,
    A    => S_data_pipel0_Q4_3,
    B    => HB_COE4,
    CE   => I_rst_n,
    SCLR => '0',
    P    => S_data_pipel1_Q4_3
  );

  Q4_p1_4_mult_gen_d0_int : mult_gen_d0_int
  PORT MAP(
    CLK  => I_clk,
    A    => S_data_pipel0_Q4_4,
    B    => HB_COE6,
    CE   => I_rst_n,
    SCLR => '0',
    P    => S_data_pipel1_Q4_4
  );
  ------------------------------------Q5路--------------------------------------------------------------------------------
  P_Q5_Decimal : PROCESS (I_clk, I_rst_n)
  BEGIN
    IF I_rst_n = '0' THEN
      S_data_pipel0_Q5_0 <= (OTHERS => '0');
      S_data_pipel0_Q5_1 <= (OTHERS => '0');
      S_data_pipel0_Q5_2 <= (OTHERS => '0');
      S_data_pipel0_Q5_3 <= (OTHERS => '0');
      S_data_pipel0_Q5_4 <= (OTHERS => '0');
      S_data_pipel2_Q5_0 <= (OTHERS => '0');
      S_data_pipel2_Q5_1 <= (OTHERS => '0');
      S_data_pipel2_Q5_2 <= (OTHERS => '0');
      S_data_pipel3_Q5_0 <= (OTHERS => '0');
      S_data_pipel3_Q5_1 <= (OTHERS => '0');
      s_data_pipel4_Q5   <= (OTHERS => '0');
    ELSIF rising_edge(I_clk) THEN
      -------------------第一级流水 扩符号位相加-------------------------
      S_data_pipel0_Q5_0 <= I_data_mod_Q1(7) & I_data_mod_Q1;
      S_data_pipel0_Q5_1 <= (S_data_mod_Q10(7) & S_data_mod_Q10) + (I_data_mod_Q8(7) & I_data_mod_Q8);
      S_data_pipel0_Q5_2 <= (S_data_mod_Q12(7) & S_data_mod_Q12) + (I_data_mod_Q6(7) & I_data_mod_Q6);
      S_data_pipel0_Q5_3 <= (S_data_mod_Q14(7) & S_data_mod_Q14) + (I_data_mod_Q4(7) & I_data_mod_Q4);
      S_data_pipel0_Q5_4 <= (I_data_mod_Q0(7) & I_data_mod_Q0) + (I_data_mod_Q2(7) & I_data_mod_Q2);
      -------------------第三级流水 24位扩位相加-------------------------
      S_data_pipel2_Q5_0 <= (S_data_pipel1_Q5_0(23) & S_data_pipel1_Q5_0(23 DOWNTO 0)) + (S_data_pipel1_Q5_1(23) & S_data_pipel1_Q5_1(23 DOWNTO 0));
      S_data_pipel2_Q5_1 <= (S_data_pipel1_Q5_2(23) & S_data_pipel1_Q5_2(23 DOWNTO 0));
      S_data_pipel2_Q5_2 <= (S_data_pipel1_Q5_3(23) & S_data_pipel1_Q5_3(23 DOWNTO 0)) + (S_data_pipel1_Q5_4(23) & S_data_pipel1_Q5_4(23 DOWNTO 0));
      -------------------第四级流水 25位扩位相加-------------------------
      S_data_pipel3_Q5_0 <= (S_data_pipel2_Q5_0(24) & S_data_pipel2_Q5_0);
      S_data_pipel3_Q5_1 <= (S_data_pipel2_Q5_1(24) & S_data_pipel2_Q5_1) + (S_data_pipel2_Q5_2(24) & S_data_pipel2_Q5_2);
      -------------------第五级流水 26----------------------------------
      S_data_pipel4_Q5 <= (S_data_pipel3_Q5_0(25) & S_data_pipel3_Q5_0) + (S_data_pipel3_Q5_1(25) & S_data_pipel3_Q5_1);
    END IF;
  END PROCESS;

  Q5_p1_0_mult_gen_d0_int : mult_gen_d0_int
  PORT MAP(
    CLK  => I_clk,
    A    => S_data_pipel0_Q5_0,
    B    => HB_COE7,
    CE   => I_rst_n,
    SCLR => '0',
    P    => S_data_pipel1_Q5_0
  );

  Q5_p1_1_mult_gen_d0_int : mult_gen_d0_int
  PORT MAP(
    CLK  => I_clk,
    A    => S_data_pipel0_Q5_1,
    B    => HB_COE0,
    CE   => I_rst_n,
    SCLR => '0',
    P    => S_data_pipel1_Q5_1
  );

  Q5_p1_2_mult_gen_d0_int : mult_gen_d0_int
  PORT MAP(
    CLK  => I_clk,
    A    => S_data_pipel0_Q5_2,
    B    => HB_COE2,
    CE   => I_rst_n,
    SCLR => '0',
    P    => S_data_pipel1_Q5_2
  );

  Q5_p1_3_mult_gen_d0_int : mult_gen_d0_int
  PORT MAP(
    CLK  => I_clk,
    A    => S_data_pipel0_Q5_3,
    B    => HB_COE4,
    CE   => I_rst_n,
    SCLR => '0',
    P    => S_data_pipel1_Q5_3
  );

  Q5_p1_4_mult_gen_d0_int : mult_gen_d0_int
  PORT MAP(
    CLK  => I_clk,
    A    => S_data_pipel0_Q5_4,
    B    => HB_COE6,
    CE   => I_rst_n,
    SCLR => '0',
    P    => S_data_pipel1_Q5_4
  );

  ------------------------------------I6路--------------------------------------------------------------------------------
  P_Q6_Decimal : PROCESS (I_clk, I_rst_n)
  BEGIN
    IF I_rst_n = '0' THEN
      S_data_pipel0_Q6_0 <= (OTHERS => '0');
      S_data_pipel0_Q6_1 <= (OTHERS => '0');
      S_data_pipel0_Q6_2 <= (OTHERS => '0');
      S_data_pipel0_Q6_3 <= (OTHERS => '0');
      S_data_pipel0_Q6_4 <= (OTHERS => '0');
      S_data_pipel2_Q6_0 <= (OTHERS => '0');
      S_data_pipel2_Q6_1 <= (OTHERS => '0');
      S_data_pipel2_Q6_2 <= (OTHERS => '0');
      S_data_pipel3_Q6_0 <= (OTHERS => '0');
      S_data_pipel3_Q6_1 <= (OTHERS => '0');
      s_data_pipel4_Q6   <= (OTHERS => '0');
    ELSIF rising_edge(I_clk) THEN
      -------------------第一级流水 扩符号位相加-------------------------
      S_data_pipel0_Q6_0 <= I_data_mod_Q3(7) & I_data_mod_Q3;
      S_data_pipel0_Q6_1 <= (S_data_mod_Q12(7) & S_data_mod_Q12) + (I_data_mod_Q10(7) & I_data_mod_Q10);
      S_data_pipel0_Q6_2 <= (S_data_mod_Q14(7) & S_data_mod_Q14) + (I_data_mod_Q8(7) & I_data_mod_Q8);
      S_data_pipel0_Q6_3 <= (I_data_mod_Q0(7) & I_data_mod_Q0) + (I_data_mod_Q6(7) & I_data_mod_Q6);
      S_data_pipel0_Q6_4 <= (I_data_mod_Q2(7) & I_data_mod_Q2) + (I_data_mod_Q4(7) & I_data_mod_Q4);
      -------------------第三级流水 24位扩位相加-------------------------
      S_data_pipel2_Q6_0 <= (S_data_pipel1_Q6_0(23) & S_data_pipel1_Q6_0(23 DOWNTO 0)) + (S_data_pipel1_Q6_1(23) & S_data_pipel1_Q6_1(23 DOWNTO 0));
      S_data_pipel2_Q6_1 <= (S_data_pipel1_Q6_2(23) & S_data_pipel1_Q6_2(23 DOWNTO 0));
      S_data_pipel2_Q6_2 <= (S_data_pipel1_Q6_3(23) & S_data_pipel1_Q6_3(23 DOWNTO 0)) + (S_data_pipel1_Q6_4(23) & S_data_pipel1_Q6_4(23 DOWNTO 0));
      -------------------第四级流水 25位扩位相加-------------------------
      S_data_pipel3_Q6_0 <= (S_data_pipel2_Q6_0(24) & S_data_pipel2_Q6_0);
      S_data_pipel3_Q6_1 <= (S_data_pipel2_Q6_1(24) & S_data_pipel2_Q6_1) + (S_data_pipel2_Q6_2(24) & S_data_pipel2_Q6_2);
      -------------------第五级流水 26----------------------------------
      S_data_pipel4_Q6 <= (S_data_pipel3_Q6_0(25) & S_data_pipel3_Q6_0) + (S_data_pipel3_Q6_1(25) & S_data_pipel3_Q6_1);
    END IF;
  END PROCESS;

  Q6_p1_0_mult_gen_d0_int : mult_gen_d0_int
  PORT MAP(
    CLK  => I_clk,
    A    => S_data_pipel0_Q6_0,
    B    => HB_COE7,
    CE   => I_rst_n,
    SCLR => '0',
    P    => S_data_pipel1_Q6_0
  );

  Q6_p1_1_mult_gen_d0_int : mult_gen_d0_int
  PORT MAP(
    CLK  => I_clk,
    A    => S_data_pipel0_Q6_1,
    B    => HB_COE0,
    CE   => I_rst_n,
    SCLR => '0',
    P    => S_data_pipel1_Q6_1
  );

  Q6_p1_2_mult_gen_d0_int : mult_gen_d0_int
  PORT MAP(
    CLK  => I_clk,
    A    => S_data_pipel0_Q6_2,
    B    => HB_COE2,
    CE   => I_rst_n,
    SCLR => '0',
    P    => S_data_pipel1_Q6_2
  );

  Q6_p1_3_mult_gen_d0_int : mult_gen_d0_int
  PORT MAP(
    CLK  => I_clk,
    A    => S_data_pipel0_Q6_3,
    B    => HB_COE4,
    CE   => I_rst_n,
    SCLR => '0',
    P    => S_data_pipel1_Q6_3
  );

  Q6_p1_4_mult_gen_d0_int : mult_gen_d0_int
  PORT MAP(
    CLK  => I_clk,
    A    => S_data_pipel0_Q6_4,
    B    => HB_COE6,
    CE   => I_rst_n,
    SCLR => '0',
    P    => S_data_pipel1_Q6_4
  );


  
  ------------------------------------Q7路--------------------------------------------------------------------------------
  P_Q7_Decimal : PROCESS (I_clk, I_rst_n)
  BEGIN
    IF I_rst_n = '0' THEN
      S_data_pipel0_Q7_0 <= (OTHERS => '0');
      S_data_pipel0_Q7_1 <= (OTHERS => '0');
      S_data_pipel0_Q7_2 <= (OTHERS => '0');
      S_data_pipel0_Q7_3 <= (OTHERS => '0');
      S_data_pipel0_Q7_4 <= (OTHERS => '0');
      S_data_pipel2_Q7_0 <= (OTHERS => '0');
      S_data_pipel2_Q7_1 <= (OTHERS => '0');
      S_data_pipel2_Q7_2 <= (OTHERS => '0');
      S_data_pipel3_Q7_0 <= (OTHERS => '0');
      S_data_pipel3_Q7_1 <= (OTHERS => '0');
      s_data_pipel4_Q7   <= (OTHERS => '0');
    ELSIF rising_edge(I_clk) THEN
      -------------------第一级流水 扩符号位相加-------------------------
      S_data_pipel0_Q7_0 <= I_data_mod_Q5(7) & I_data_mod_Q5;
      S_data_pipel0_Q7_1 <= (S_data_mod_Q14(7) & S_data_mod_Q14) + (I_data_mod_Q12(7) & I_data_mod_Q12);
      S_data_pipel0_Q7_2 <= (I_data_mod_Q0(7) & I_data_mod_Q0) + (I_data_mod_Q10(7) & I_data_mod_Q10);
      S_data_pipel0_Q7_3 <= (I_data_mod_Q2(7) & I_data_mod_Q2) + (I_data_mod_Q8(7) & I_data_mod_Q8);
      S_data_pipel0_Q7_4 <= (I_data_mod_Q4(7) & I_data_mod_Q4) + (I_data_mod_Q6(7) & I_data_mod_Q6);
      -------------------第三级流水 24位扩位相加-------------------------
      S_data_pipel2_Q7_0 <= (S_data_pipel1_Q7_0(23) & S_data_pipel1_Q7_0(23 DOWNTO 0)) + (S_data_pipel1_Q7_1(23) & S_data_pipel1_Q7_1(23 DOWNTO 0));
      S_data_pipel2_Q7_1 <= (S_data_pipel1_Q7_2(23) & S_data_pipel1_Q7_2(23 DOWNTO 0));
      S_data_pipel2_Q7_2 <= (S_data_pipel1_Q7_3(23) & S_data_pipel1_Q7_3(23 DOWNTO 0)) + (S_data_pipel1_Q7_4(23) & S_data_pipel1_Q7_4(23 DOWNTO 0));
      -------------------第四级流水 25位扩位相加-------------------------
      S_data_pipel3_Q7_0 <= (S_data_pipel2_Q7_0(24) & S_data_pipel2_Q7_0);
      S_data_pipel3_Q7_1 <= (S_data_pipel2_Q7_1(24) & S_data_pipel2_Q7_1) + (S_data_pipel2_Q7_2(24) & S_data_pipel2_Q7_2);
      -------------------第五级流水 26----------------------------------
      S_data_pipel4_Q7 <= (S_data_pipel3_Q7_0(25) & S_data_pipel3_Q7_0) + (S_data_pipel3_Q7_1(25) & S_data_pipel3_Q7_1);
    END IF;
  END PROCESS;

  Q7_p1_0_mult_gen_d0_int : mult_gen_d0_int
  PORT MAP(
    CLK  => I_clk,
    A    => S_data_pipel0_Q7_0,
    B    => HB_COE7,
    CE   => I_rst_n,
    SCLR => '0',
    P    => S_data_pipel1_Q7_0
  );

  Q7_p1_1_mult_gen_d0_int : mult_gen_d0_int
  PORT MAP(
    CLK  => I_clk,
    A    => S_data_pipel0_Q7_1,
    B    => HB_COE0,
    CE   => I_rst_n,
    SCLR => '0',
    P    => S_data_pipel1_Q7_1
  );

  Q7_p1_2_mult_gen_d0_int : mult_gen_d0_int
  PORT MAP(
    CLK  => I_clk,
    A    => S_data_pipel0_Q7_2,
    B    => HB_COE2,
    CE   => I_rst_n,
    SCLR => '0',
    P    => S_data_pipel1_Q7_2
  );

  Q7_p1_3_mult_gen_d0_int : mult_gen_d0_int
  PORT MAP(
    CLK  => I_clk,
    A    => S_data_pipel0_Q7_3,
    B    => HB_COE4,
    CE   => I_rst_n,
    SCLR => '0',
    P    => S_data_pipel1_Q7_3
  );

  Q7_p1_4_mult_gen_d0_int : mult_gen_d0_int
  PORT MAP(
    CLK  => I_clk,
    A    => S_data_pipel0_Q7_4,
    B    => HB_COE6,
    CE   => I_rst_n,
    SCLR => '0',
    P    => S_data_pipel1_Q7_4
  );

  ----------------------------------信号输出------------------------------------------
  O_data_d0_I0 <= S_data_pipel4_I0(22 DOWNTO 10) + S_data_pipel4_I0(9);
  O_data_d0_I1 <= S_data_pipel4_I1(22 DOWNTO 10) + S_data_pipel4_I1(9);
  O_data_d0_I2 <= S_data_pipel4_I2(22 DOWNTO 10) + S_data_pipel4_I2(9);
  O_data_d0_I3 <= S_data_pipel4_I3(22 DOWNTO 10) + S_data_pipel4_I3(9);
  O_data_d0_I4 <= S_data_pipel4_I4(22 DOWNTO 10) + S_data_pipel4_I4(9);
  O_data_d0_I5 <= S_data_pipel4_I5(22 DOWNTO 10) + S_data_pipel4_I5(9);
  O_data_d0_I6 <= S_data_pipel4_I6(22 DOWNTO 10) + S_data_pipel4_I6(9);
  O_data_d0_I7 <= S_data_pipel4_I7(22 DOWNTO 10) + S_data_pipel4_I7(9);

  O_data_d0_Q0 <= S_data_pipel4_Q0(22 DOWNTO 10) + S_data_pipel4_Q0(9);
  O_data_d0_Q1 <= S_data_pipel4_Q1(22 DOWNTO 10) + S_data_pipel4_Q1(9);
  O_data_d0_Q2 <= S_data_pipel4_Q2(22 DOWNTO 10) + S_data_pipel4_Q2(9);
  O_data_d0_Q3 <= S_data_pipel4_Q3(22 DOWNTO 10) + S_data_pipel4_Q3(9);
  O_data_d0_Q4 <= S_data_pipel4_Q4(22 DOWNTO 10) + S_data_pipel4_Q4(9);
  O_data_d0_Q5 <= S_data_pipel4_Q5(22 DOWNTO 10) + S_data_pipel4_Q5(9);
  O_data_d0_Q6 <= S_data_pipel4_Q6(22 DOWNTO 10) + S_data_pipel4_Q6(9);
  O_data_d0_Q7 <= S_data_pipel4_Q7(22 DOWNTO 10) + S_data_pipel4_Q7(9);

 
END Behavioral;