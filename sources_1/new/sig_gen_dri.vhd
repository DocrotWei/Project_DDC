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

ENTITY sig_gen_dri IS
  PORT (
    I_clk        : IN std_logic;
    I_rst_n      : IN std_logic;
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

  CONSTANT MEM_SIZE : integer := 300000;

  SIGNAL S_data_mod0  : std_logic_vector(7 DOWNTO 0);
  SIGNAL S_data_mod1  : std_logic_vector(7 DOWNTO 0);
  SIGNAL S_data_mod2  : std_logic_vector(7 DOWNTO 0);
  SIGNAL S_data_mod3  : std_logic_vector(7 DOWNTO 0);
  SIGNAL S_data_mod4  : std_logic_vector(7 DOWNTO 0);
  SIGNAL S_data_mod5  : std_logic_vector(7 DOWNTO 0);
  SIGNAL S_data_mod6  : std_logic_vector(7 DOWNTO 0);
  SIGNAL S_data_mod7  : std_logic_vector(7 DOWNTO 0);
  SIGNAL S_data_mod8  : std_logic_vector(7 DOWNTO 0);
  SIGNAL S_data_mod9  : std_logic_vector(7 DOWNTO 0);
  SIGNAL S_data_mod10 : std_logic_vector(7 DOWNTO 0);
  SIGNAL S_data_mod11 : std_logic_vector(7 DOWNTO 0);
  SIGNAL S_data_mod12 : std_logic_vector(7 DOWNTO 0);
  SIGNAL S_data_mod13 : std_logic_vector(7 DOWNTO 0);
  SIGNAL S_data_mod14 : std_logic_vector(7 DOWNTO 0);
  SIGNAL S_data_mod15 : std_logic_vector(7 DOWNTO 0);
  SIGNAL S_addr_mem   : std_logic_vector(18 DOWNTO 0):= (others => '0' );
  SIGNAL S_douta_mem  : std_logic_vector(127 DOWNTO 0);
  SIGNAL S_dina_mem   : std_logic_vector(7 DOWNTO 0);
BEGIN


  PROCESS (I_clk, I_rst_n)
  BEGIN
    IF I_rst_n = '0' THEN
      S_data_mod0  <= (OTHERS => '0');
      S_data_mod1  <= (OTHERS => '0');
      S_data_mod2  <= (OTHERS => '0');
      S_data_mod3  <= (OTHERS => '0');
      S_data_mod4  <= (OTHERS => '0');
      S_data_mod5  <= (OTHERS => '0');
      S_data_mod6  <= (OTHERS => '0');
      S_data_mod7  <= (OTHERS => '0');
      S_data_mod8  <= (OTHERS => '0');
      S_data_mod9  <= (OTHERS => '0');
      S_data_mod10 <= (OTHERS => '0');
      S_data_mod11 <= (OTHERS => '0');
      S_data_mod12 <= (OTHERS => '0');
      S_data_mod13 <= (OTHERS => '0');
      S_data_mod14 <= (OTHERS => '0');
      S_data_mod15 <= (OTHERS => '0');
    ELSIF rising_edge(I_clk) THEN
      S_data_mod0  <= S_douta_mem(7 DOWNTO 0);
      S_data_mod1  <= S_douta_mem(15 DOWNTO 8);
      S_data_mod2  <= S_douta_mem(23 DOWNTO 16);
      S_data_mod3  <= S_douta_mem(31 DOWNTO 24);
      S_data_mod4  <= S_douta_mem(39 DOWNTO 32);
      S_data_mod5  <= S_douta_mem(47 DOWNTO 40);
      S_data_mod6  <= S_douta_mem(55 DOWNTO 48);
      S_data_mod7  <= S_douta_mem(63 DOWNTO 56);
      S_data_mod8  <= S_douta_mem(71 DOWNTO 64);
      S_data_mod9  <= S_douta_mem(79 DOWNTO 72);
      S_data_mod10 <= S_douta_mem(87 DOWNTO 80);
      S_data_mod11 <= S_douta_mem(95 DOWNTO 88);
      S_data_mod12 <= S_douta_mem(103 DOWNTO 96);
      S_data_mod13 <= S_douta_mem(111 DOWNTO 104);
      S_data_mod14 <= S_douta_mem(119 DOWNTO 112);
      S_data_mod15 <= S_douta_mem(127 DOWNTO 120);
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

  O_data_mod0  <= S_data_mod0;
  O_data_mod1  <= S_data_mod1;
  O_data_mod2  <= S_data_mod2;
  O_data_mod3  <= S_data_mod3;
  O_data_mod4  <= S_data_mod4;
  O_data_mod5  <= S_data_mod5;
  O_data_mod6  <= S_data_mod6;
  O_data_mod7  <= S_data_mod7;
  O_data_mod8  <= S_data_mod8;
  O_data_mod9  <= S_data_mod9;
  O_data_mod10 <= S_data_mod10;
  O_data_mod11 <= S_data_mod11;
  O_data_mod12 <= S_data_mod12;
  O_data_mod13 <= S_data_mod13;
  O_data_mod14 <= S_data_mod14;
  O_data_mod15 <= S_data_mod15;

END Behavioral;