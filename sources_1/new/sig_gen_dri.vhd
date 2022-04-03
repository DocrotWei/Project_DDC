----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2022/04/01 16:54:42
-- Design Name: 
-- Module Name: sig_gen_dri - Behavioral
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
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

ENTITY sig_gen_dri IS
  PORT (
    i_clk        : IN std_logic;
    i_rst_n      : IN std_logic;
    o_data_ori0  : OUT std_logic_vector(7 DOWNTO 0);
    o_data_ori1  : OUT std_logic_vector(7 DOWNTO 0);
    o_data_ori2  : OUT std_logic_vector(7 DOWNTO 0);
    o_data_ori3  : OUT std_logic_vector(7 DOWNTO 0);
    o_data_ori4  : OUT std_logic_vector(7 DOWNTO 0);
    o_data_ori5  : OUT std_logic_vector(7 DOWNTO 0);
    o_data_ori6  : OUT std_logic_vector(7 DOWNTO 0);
    o_data_ori7  : OUT std_logic_vector(7 DOWNTO 0);
    o_data_ori8  : OUT std_logic_vector(7 DOWNTO 0);
    o_data_ori9  : OUT std_logic_vector(7 DOWNTO 0);
    o_data_ori10 : OUT std_logic_vector(7 DOWNTO 0);
    o_data_ori11 : OUT std_logic_vector(7 DOWNTO 0);
    o_data_ori12 : OUT std_logic_vector(7 DOWNTO 0);
    o_data_ori13 : OUT std_logic_vector(7 DOWNTO 0);
    o_data_ori14 : OUT std_logic_vector(7 DOWNTO 0);
    o_data_ori15 : OUT std_logic_vector(7 DOWNTO 0)
  );
END sig_gen_dri;

ARCHITECTURE Behavioral OF sig_gen_dri IS
  COMPONENT blk_mem_gen_0
    PORT (
      clka  : IN std_logic;
      ena   : IN std_logic;
      wea   : IN std_logic_vector(0 DOWNTO 0);
      addra : IN std_logic_vector(18 DOWNTO 0);
      dina  : IN std_logic_vector(7 DOWNTO 0);
      douta : OUT std_logic_vector(127 DOWNTO 0)
    );
  END COMPONENT;

  SIGNAL s_data_ori0  : std_logic_vector(7 DOWNTO 0);
  SIGNAL s_data_ori1  : std_logic_vector(7 DOWNTO 0);
  SIGNAL s_data_ori2  : std_logic_vector(7 DOWNTO 0);
  SIGNAL s_data_ori3  : std_logic_vector(7 DOWNTO 0);
  SIGNAL s_data_ori4  : std_logic_vector(7 DOWNTO 0);
  SIGNAL s_data_ori5  : std_logic_vector(7 DOWNTO 0);
  SIGNAL s_data_ori6  : std_logic_vector(7 DOWNTO 0);
  SIGNAL s_data_ori7  : std_logic_vector(7 DOWNTO 0);
  SIGNAL s_data_ori8  : std_logic_vector(7 DOWNTO 0);
  SIGNAL s_data_ori9  : std_logic_vector(7 DOWNTO 0);
  SIGNAL s_data_ori10 : std_logic_vector(7 DOWNTO 0);
  SIGNAL s_data_ori11 : std_logic_vector(7 DOWNTO 0);
  SIGNAL s_data_ori12 : std_logic_vector(7 DOWNTO 0);
  SIGNAL s_data_ori13 : std_logic_vector(7 DOWNTO 0);
  SIGNAL s_data_ori14 : std_logic_vector(7 DOWNTO 0);
  SIGNAL s_data_ori15 : std_logic_vector(7 DOWNTO 0);
  SIGNAL s_mem_addr   : std_logic_vector(15 DOWNTO 0);
  SIGNAL s_douta_mem  : std_logic_vector(127 DOWNTO 0);
  SIGNAL s_dina_mem   : std_logic_vector(127 DOWNTO 0);
BEGIN

  PROCESS (i_clk, i_rst_n)
  BEGIN
    IF i_rst_n = '0' THEN
      s_mem_addr <= (OTHERS => '0');
    ELSIF rising_edge(i_clk) THEN
      s_mem_addr <= s_mem_addr + x"01";
    END IF;
  END PROCESS;

  PROCESS (i_clk, i_rst_n)
  BEGIN
    IF i_rst_n = '0' THEN
      s_data_ori0  <= (OTHERS => '0');
      s_data_ori1  <= (OTHERS => '0');
      s_data_ori2  <= (OTHERS => '0');
      s_data_ori3  <= (OTHERS => '0');
      s_data_ori4  <= (OTHERS => '0');
      s_data_ori5  <= (OTHERS => '0');
      s_data_ori6  <= (OTHERS => '0');
      s_data_ori7  <= (OTHERS => '0');
      s_data_ori8  <= (OTHERS => '0');
      s_data_ori9  <= (OTHERS => '0');
      s_data_ori10 <= (OTHERS => '0');
      s_data_ori11 <= (OTHERS => '0');
      s_data_ori12 <= (OTHERS => '0');
      s_data_ori13 <= (OTHERS => '0');
      s_data_ori14 <= (OTHERS => '0');
      s_data_ori15 <= (OTHERS => '0');
    ELSIF rising_edge(i_clk) THEN
      s_data_ori0  <= s_douta_mem(7 DOWNTO 0);
      s_data_ori1  <= s_douta_mem(15 DOWNTO 8);
      s_data_ori2  <= s_douta_mem(23 DOWNTO 16);
      s_data_ori3  <= s_douta_mem(31 DOWNTO 24);
      s_data_ori4  <= s_douta_mem(39 DOWNTO 32);
      s_data_ori5  <= s_douta_mem(47 DOWNTO 40);
      s_data_ori6  <= s_douta_mem(55 DOWNTO 48);
      s_data_ori7  <= s_douta_mem(63 DOWNTO 56);
      s_data_ori8  <= s_douta_mem(71 DOWNTO 64);
      s_data_ori9  <= s_douta_mem(79 DOWNTO 72);
      s_data_ori10 <= s_douta_mem(87 DOWNTO 80);
      s_data_ori11 <= s_douta_mem(95 DOWNTO 88);
      s_data_ori12 <= s_douta_mem(103 DOWNTO 96);
      s_data_ori13 <= s_douta_mem(111 DOWNTO 104);
      s_data_ori14 <= s_douta_mem(119 DOWNTO 112);
      s_data_ori15 <= s_douta_mem(127 DOWNTO 120);
    END IF;
  END PROCESS;

  blk_men_gen_0_u : blk_mem_gen_0
  PORT MAP(
    clka  => i_clk,
    ena   => '1',
    wea   => "0",
    addra => s_mem_addr,
    dina  => s_dina_mem,
    douta => s_douta_mem
  );
END Behavioral;