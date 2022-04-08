----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2022/03/31 16:50:39
-- Design Name: 
-- Module Name: DDC_ctr - Behavioral
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

LIBRARY UNISIM;
USE UNISIM.VComponents.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

ENTITY ddc_ctr IS
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
END ddc_ctr;
ARCHITECTURE Behavioral OF DDC_ctr IS

  COMPONENT sig_gen_dri
    PORT (
      I_clk   : IN std_logic;
      I_rst_n : IN std_logic;

      O_data_mod0  : OUT std_logic_vector(7 DOWNTO 0);
      O_data_mod1  : OUT std_logic_vector(7 DOWNTO 0);
      O_data_mod2  : OUT std_logic_vector(7 DOWNTO 0);
      O_data_mod3  : OUT std_logic_vector(7 DOWNTO 0);
      O_data_mod4  : OUT std_logic_vector(7 DOWNTO 0);
      O_data_mod5  : OUT std_logic_vector(7 DOWNTO 0);
      O_data_mod6  : OUT std_logic_vector(7 DOWNTO 0);
      O_data_mod7  : OUT std_logic_vector(7 DOWNTO 0);
      O_data_mod8  : OUT std_logic_vector(7 DOWNTO 0);
      O_data_mod9  : OUT std_logic_vector(7 DOWNTO 0);
      O_data_mod10 : OUT std_logic_vector(7 DOWNTO 0);
      O_data_mod11 : OUT std_logic_vector(7 DOWNTO 0);
      O_data_mod12 : OUT std_logic_vector(7 DOWNTO 0);
      O_data_mod13 : OUT std_logic_vector(7 DOWNTO 0);
      O_data_mod14 : OUT std_logic_vector(7 DOWNTO 0);
      O_data_mod15 : OUT std_logic_vector(7 DOWNTO 0)
    );
  END COMPONENT;

  COMPONENT ddc_mod_dri
    PORT (
      I_clk   : IN std_logic;
      I_rst_n : IN std_logic;
      -----------------------输入信号------------------------------
      I_data_mod0  : IN std_logic_vector(7 DOWNTO 0);
      I_data_mod1  : IN std_logic_vector(7 DOWNTO 0);
      I_data_mod2  : IN std_logic_vector(7 DOWNTO 0);
      I_data_mod3  : IN std_logic_vector(7 DOWNTO 0);
      I_data_mod4  : IN std_logic_vector(7 DOWNTO 0);
      I_data_mod5  : IN std_logic_vector(7 DOWNTO 0);
      I_data_mod6  : IN std_logic_vector(7 DOWNTO 0);
      I_data_mod7  : IN std_logic_vector(7 DOWNTO 0);
      I_data_mod8  : IN std_logic_vector(7 DOWNTO 0);
      I_data_mod9  : IN std_logic_vector(7 DOWNTO 0);
      I_data_mod10 : IN std_logic_vector(7 DOWNTO 0);
      I_data_mod11 : IN std_logic_vector(7 DOWNTO 0);
      I_data_mod12 : IN std_logic_vector(7 DOWNTO 0);
      I_data_mod13 : IN std_logic_vector(7 DOWNTO 0);
      I_data_mod14 : IN std_logic_vector(7 DOWNTO 0);
      I_data_mod15 : IN std_logic_vector(7 DOWNTO 0);

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

  SIGNAL S_data_mod0  : std_logic_vector(7 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_mod1  : std_logic_vector(7 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_mod2  : std_logic_vector(7 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_mod3  : std_logic_vector(7 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_mod4  : std_logic_vector(7 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_mod5  : std_logic_vector(7 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_mod6  : std_logic_vector(7 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_mod7  : std_logic_vector(7 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_mod8  : std_logic_vector(7 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_mod9  : std_logic_vector(7 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_mod10 : std_logic_vector(7 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_mod11 : std_logic_vector(7 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_mod12 : std_logic_vector(7 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_mod13 : std_logic_vector(7 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_mod14 : std_logic_vector(7 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_data_mod15 : std_logic_vector(7 DOWNTO 0) := (OTHERS => '0');

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

BEGIN
  sig_gen_dri_u : sig_gen_dri
  PORT MAP(
    I_clk   => I_clk,
    I_rst_n => I_rst_n,

    O_data_mod0  => S_data_mod0,
    O_data_mod1  => S_data_mod1,
    O_data_mod2  => S_data_mod2,
    O_data_mod3  => S_data_mod3,
    O_data_mod4  => S_data_mod4,
    O_data_mod5  => S_data_mod5,
    O_data_mod6  => S_data_mod6,
    O_data_mod7  => S_data_mod7,
    O_data_mod8  => S_data_mod8,
    O_data_mod9  => S_data_mod9,
    O_data_mod10 => S_data_mod10,
    O_data_mod11 => S_data_mod11,
    O_data_mod12 => S_data_mod12,
    O_data_mod13 => S_data_mod13,
    O_data_mod14 => S_data_mod14,
    O_data_mod15 => S_data_mod15
  );

  ddc_mod_dri_u : ddc_mod_dri
  PORT MAP(
    I_clk   => I_clk,
    I_rst_n => I_rst_n,
    -----------------------输入信号------------------------------
    I_data_mod0  => S_data_mod0,
    I_data_mod1  => S_data_mod1,
    I_data_mod2  => S_data_mod2,
    I_data_mod3  => S_data_mod3,
    I_data_mod4  => S_data_mod4,
    I_data_mod5  => S_data_mod5,
    I_data_mod6  => S_data_mod6,
    I_data_mod7  => S_data_mod7,
    I_data_mod8  => S_data_mod8,
    I_data_mod9  => S_data_mod9,
    I_data_mod10 => S_data_mod10,
    I_data_mod11 => S_data_mod11,
    I_data_mod12 => S_data_mod12,
    I_data_mod13 => S_data_mod13,
    I_data_mod14 => S_data_mod14,
    I_data_mod15 => S_data_mod15,

    ----------------------输出信号--------------------------------
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

  O_data_mod_I0  <= S_data_mod_I0;
  O_data_mod_Q0  <= S_data_mod_Q0;
  O_data_mod_I1  <= S_data_mod_I1;
  O_data_mod_Q1  <= S_data_mod_Q1;
  O_data_mod_I2  <= S_data_mod_I2;
  O_data_mod_Q2  <= S_data_mod_Q2;
  O_data_mod_I3  <= S_data_mod_I3;
  O_data_mod_Q3  <= S_data_mod_Q3;
  O_data_mod_I4  <= S_data_mod_I4;
  O_data_mod_Q4  <= S_data_mod_Q4;
  O_data_mod_I5  <= S_data_mod_I5;
  O_data_mod_Q5  <= S_data_mod_Q5;
  O_data_mod_I6  <= S_data_mod_I6;
  O_data_mod_Q6  <= S_data_mod_Q6;
  O_data_mod_I7  <= S_data_mod_I7;
  O_data_mod_Q7  <= S_data_mod_Q7;
  O_data_mod_I8  <= S_data_mod_I8;
  O_data_mod_Q8  <= S_data_mod_Q8;
  O_data_mod_I9  <= S_data_mod_I9;
  O_data_mod_Q9  <= S_data_mod_Q9;
  O_data_mod_I10 <= S_data_mod_I10;
  O_data_mod_Q10 <= S_data_mod_Q10;
  O_data_mod_I11 <= S_data_mod_I11;
  O_data_mod_Q11 <= S_data_mod_Q11;
  O_data_mod_I12 <= S_data_mod_I12;
  O_data_mod_Q12 <= S_data_mod_Q12;
  O_data_mod_I13 <= S_data_mod_I13;
  O_data_mod_Q13 <= S_data_mod_Q13;
  O_data_mod_I14 <= S_data_mod_I14;
  O_data_mod_Q14 <= S_data_mod_Q14;
  O_data_mod_I15 <= S_data_mod_I15;
  O_data_mod_Q15 <= S_data_mod_Q15;

END Behavioral;