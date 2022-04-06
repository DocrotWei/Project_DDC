----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2022/04/01 21:38:07
-- Design Name: 
-- Module Name: sig_gen_sim - Behavioral
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

ENTITY sig_gen_sim IS

END sig_gen_sim;

ARCHITECTURE Behavioral OF sig_gen_sim IS
  COMPONENT sig_gen_dri IS
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
  END COMPONENT;
  CONSTANT SIM_TIME : integer := 18750;

  SIGNAL S_clk        : std_logic := '0';
  SIGNAL S_rst_n      : std_logic := '1';
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
  SIGNAL S_sim_cnt    : std_logic_vector(18 DOWNTO 0) := (OTHERS => '0');
  SIGNAL sim_end      : std_logic                     := '0';
  SIGNAL dataOUT      : std_logic                     := '0';
  CONSTANT CLK_PERIOD : time                          := 5.333 ns;
  CONSTANT RST_PERIOD : time                          := 53.33 ns;

  SIGNAL rst_n_r    : std_logic := '0';
  SIGNAL rst_n_rise : std_logic := '0';
  SIGNAL rst_cnt    : natural   := 0;

  TYPE status_type IS (s_idle, s_write, s_write_end, s_read_begin, s_read, s_end);
  SIGNAL c_status : status_type := s_idle;

  SIGNAL cnt_from_file : std_logic_vector(7 DOWNTO 0) := (OTHERS => '0');

BEGIN

  S_rst_n <= '1',
    '0' AFTER 100 ns,
    '1' AFTER 200 ns,
    '0' AFTER 1 us,
    '1' AFTER 1100 ns,
    '0' AFTER 2 us,
    '1' AFTER 2100 ns,
    '0' AFTER 3 us,
    '1' AFTER 3100 ns,
    '0' AFTER 4 us,
    '1' AFTER 4100 ns,
    '0' AFTER 5 us,
    '1' AFTER 5100 ns,
    '0' AFTER 6 us,
    '1' AFTER 6100 ns,
    '0' AFTER 7 us,
    '1' AFTER 7100 ns,
    '0' AFTER 8 us,
    '1' AFTER 8100 ns;

  S_clk <= NOT S_clk AFTER 5.333 ns;

  sig_gen_dri_u : sig_gen_dri
  PORT MAP(
    I_clk        => S_clk,
    I_rst_n      => S_rst_n,
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
    FILE file1           : text;
    VARIABLE file_status : file_open_status;
    VARIABLE buf         : LINE;
    --  variable cnt_from_file_r:std_logic_vector(7 downto 0):=(others=>'0');
    VARIABLE cnt_from_file_r : natural         := 0;
    VARIABLE file_name       : string(1 TO 11) := "nihaonihaon";
    CONSTANT rst_cnt_stop    : natural         := 10;
  BEGIN
    IF rising_edge(S_clk) THEN
      CASE c_status IS
        WHEN s_idle => c_status <= s_write;
          file_open(file_status, file1, "data_record0.txt", write_mode);

        WHEN s_write => IF rst_cnt >= rst_cnt_stop THEN
          c_status <= s_write_end;
        ELSE
          c_status <= s_write;
      END IF;
      write(buf, conv_integer(S_data_mod0));
      writeline(file1, buf);

      WHEN s_write_end => file_close(file1);
      c_status <= s_end;

      -- when s_read_begin =>    file_open(file_status,file1,"sinWave.txt",read_mode);
      --                         readline(file1,buf);
      --                         --read(buf,file_name);
      --                         writeline(output,buf);
      --                         c_status<=s_read;

      -- when s_read     =>      
      --                         if endfile(file1) then
      --                             c_status<=s_end;
      --                         else
      --                             c_status<=s_read;
      --                         readline(file1,buf);
      --                         read(buf,cnt_from_file_r);
      --                         cnt_from_file<=std_logic_vector(to_unsigned(cnt_from_file_r,8));                                    
      --                         end if;
      WHEN s_end => c_status <= s_end;
      file_close(file1);

      WHEN OTHERS => c_status <= s_end;
    END CASE;
  ELSE
    NULL;
  END IF;
END PROCESS;
END Behavioral;