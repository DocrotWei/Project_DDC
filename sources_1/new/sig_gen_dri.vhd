----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2022/04/01 16:54:42
-- DeSign Name: 
-- Module Name: Sig_gen_dri - Behavioral
-- Project Name: 
-- Target DeviceS: 
-- Tool VerSionS: 
-- DeScription: 
-- 
-- DependencieS: 
-- 
-- ReviSion:
-- ReviSion 0.01 - File Created
-- Additional CommentS:
-- 
----------------------------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE ieee.Std_logic_1164.ALL;
USE ieee.Std_logic_unSigned.ALL;
-- Uncomment the following library declaration if uSing
-- arithmetic functionS with Signed or UnSigned valueS
--uSe IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if inStantiating
-- any Xilinx leaf cellS in thiS code.
--library UNISIM;
--uSe UNISIM.VComponentS.all;

ENTITY Sig_gen_dri IS
  PORT (
    I_clk        : IN std_logic;
    I_rst_n      : IN std_logic;
    O_data_ori0  : OUT std_logic_vector(7 DOWNTO 0);
    O_data_ori1  : OUT std_logic_vector(7 DOWNTO 0);
    O_data_ori2  : OUT std_logic_vector(7 DOWNTO 0);
    O_data_ori3  : OUT std_logic_vector(7 DOWNTO 0);
    O_data_ori4  : OUT std_logic_vector(7 DOWNTO 0);
    O_data_ori5  : OUT std_logic_vector(7 DOWNTO 0);
    O_data_ori6  : OUT std_logic_vector(7 DOWNTO 0);
    O_data_ori7  : OUT std_logic_vector(7 DOWNTO 0);
    O_data_ori8  : OUT std_logic_vector(7 DOWNTO 0);
    O_data_ori9  : OUT std_logic_vector(7 DOWNTO 0);
    O_data_ori10 : OUT std_logic_vector(7 DOWNTO 0);
    O_data_ori11 : OUT std_logic_vector(7 DOWNTO 0);
    O_data_ori12 : OUT std_logic_vector(7 DOWNTO 0);
    O_data_ori13 : OUT std_logic_vector(7 DOWNTO 0);
    O_data_ori14 : OUT std_logic_vector(7 DOWNTO 0);
    O_data_ori15 : OUT std_logic_vector(7 DOWNTO 0)
  );
END Sig_gen_dri;

ARCHITECTURE Behavioral OF Sig_gen_dri IS
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

  CONSTANT MEM_SIZE : integer := 300000;

  SIGNAL S_data_ori0  : std_logic_vector(7 DOWNTO 0);
  SIGNAL S_data_ori1  : std_logic_vector(7 DOWNTO 0);
  SIGNAL S_data_ori2  : std_logic_vector(7 DOWNTO 0);
  SIGNAL S_data_ori3  : std_logic_vector(7 DOWNTO 0);
  SIGNAL S_data_ori4  : std_logic_vector(7 DOWNTO 0);
  SIGNAL S_data_ori5  : std_logic_vector(7 DOWNTO 0);
  SIGNAL S_data_ori6  : std_logic_vector(7 DOWNTO 0);
  SIGNAL S_data_ori7  : std_logic_vector(7 DOWNTO 0);
  SIGNAL S_data_ori8  : std_logic_vector(7 DOWNTO 0);
  SIGNAL S_data_ori9  : std_logic_vector(7 DOWNTO 0);
  SIGNAL S_data_ori10 : std_logic_vector(7 DOWNTO 0);
  SIGNAL S_data_ori11 : std_logic_vector(7 DOWNTO 0);
  SIGNAL S_data_ori12 : std_logic_vector(7 DOWNTO 0);
  SIGNAL S_data_ori13 : std_logic_vector(7 DOWNTO 0);
  SIGNAL S_data_ori14 : std_logic_vector(7 DOWNTO 0);
  SIGNAL S_data_ori15 : std_logic_vector(7 DOWNTO 0);
  SIGNAL S_addr_mem   : std_logic_vector(18 DOWNTO 0):= (others => '0' );
  SIGNAL S_douta_mem  : std_logic_vector(127 DOWNTO 0);
  SIGNAL S_dina_mem   : std_logic_vector(7 DOWNTO 0);
BEGIN


  PROCESS (I_clk, I_rst_n)
  BEGIN
    IF I_rst_n = '0' THEN
      S_data_ori0  <= (OTHERS => '0');
      S_data_ori1  <= (OTHERS => '0');
      S_data_ori2  <= (OTHERS => '0');
      S_data_ori3  <= (OTHERS => '0');
      S_data_ori4  <= (OTHERS => '0');
      S_data_ori5  <= (OTHERS => '0');
      S_data_ori6  <= (OTHERS => '0');
      S_data_ori7  <= (OTHERS => '0');
      S_data_ori8  <= (OTHERS => '0');
      S_data_ori9  <= (OTHERS => '0');
      S_data_ori10 <= (OTHERS => '0');
      S_data_ori11 <= (OTHERS => '0');
      S_data_ori12 <= (OTHERS => '0');
      S_data_ori13 <= (OTHERS => '0');
      S_data_ori14 <= (OTHERS => '0');
      S_data_ori15 <= (OTHERS => '0');
    ELSIF rising_edge(I_clk) THEN
      S_data_ori0  <= S_douta_mem(7 DOWNTO 0);
      S_data_ori1  <= S_douta_mem(15 DOWNTO 8);
      S_data_ori2  <= S_douta_mem(23 DOWNTO 16);
      S_data_ori3  <= S_douta_mem(31 DOWNTO 24);
      S_data_ori4  <= S_douta_mem(39 DOWNTO 32);
      S_data_ori5  <= S_douta_mem(47 DOWNTO 40);
      S_data_ori6  <= S_douta_mem(55 DOWNTO 48);
      S_data_ori7  <= S_douta_mem(63 DOWNTO 56);
      S_data_ori8  <= S_douta_mem(71 DOWNTO 64);
      S_data_ori9  <= S_douta_mem(79 DOWNTO 72);
      S_data_ori10 <= S_douta_mem(87 DOWNTO 80);
      S_data_ori11 <= S_douta_mem(95 DOWNTO 88);
      S_data_ori12 <= S_douta_mem(103 DOWNTO 96);
      S_data_ori13 <= S_douta_mem(111 DOWNTO 104);
      S_data_ori14 <= S_douta_mem(119 DOWNTO 112);
      S_data_ori15 <= S_douta_mem(127 DOWNTO 120);
    END IF;
  END PROCESS;

  blk_men_gen_0_u : blk_mem_gen_0
  PORT MAP(
    clka  => I_clk,
    ena   => '1',
    wea   => "0",
    addra => S_addr_mem,
    dina  => S_dina_mem,
    douta => S_douta_mem
  );

  PROCESS (I_clk, I_rst_n)
  BEGIN
    IF I_rst_n = '0' THEN
      S_addr_mem <= (OTHERS => '0');
    ELSIF rising_edge(I_clk) THEN
      IF S_addr_mem = MEM_SIZE THEN
        S_addr_mem <= (OTHERS => '0');
      ELSE
        S_addr_mem <= S_addr_mem + x"10";
      END IF;
    END IF;
  END PROCESS;

  O_data_ori0  <= S_data_ori0;
  O_data_ori1  <= S_data_ori1;
  O_data_ori2  <= S_data_ori2;
  O_data_ori3  <= S_data_ori3;
  O_data_ori4  <= S_data_ori4;
  O_data_ori5  <= S_data_ori5;
  O_data_ori6  <= S_data_ori6;
  O_data_ori7  <= S_data_ori7;
  O_data_ori8  <= S_data_ori8;
  O_data_ori9  <= S_data_ori9;
  O_data_ori10 <= S_data_ori10;
  O_data_ori11 <= S_data_ori11;
  O_data_ori12 <= S_data_ori12;
  O_data_ori13 <= S_data_ori13;
  O_data_ori14 <= S_data_ori14;
  O_data_ori15 <= S_data_ori15;

END Behavioral;