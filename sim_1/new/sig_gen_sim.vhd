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


use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_SIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
library UNISIM;
use UNISIM.VComponents.all;

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
  END COMPONENT;
  CONSTANT SIM_TIME : integer := 18750;

  SIGNAL S_clk        : std_logic := '0';
  SIGNAL S_rst_n      : std_logic := '1';
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
  SIGNAL S_sim_cnt    : std_logic_vector(18 DOWNTO 0) := (OTHERS => '0');
  SIGNAL sim_end      : std_logic                     := '0';
  SIGNAL dataOUT      : std_logic                     := '0';
  CONSTANT CLK_PERIOD : time                          := 5.333 ns;
  CONSTANT RST_PERIOD : time                          := 53.33 ns;

  SIGNAL rst_n_r    : std_logic := '0';
  SIGNAL rst_n_rise : std_logic := '0';
  SIGNAL rst_cnt    : natural   := 0;

  type status_type is (s_idle,  s_write,  s_write_end,  s_read_begin,   s_read,   s_end);
signal c_status:status_type:=s_idle;

signal cnt_from_file:std_logic_vector(7 downto 0):=(others=>'0');

BEGIN

S_rst_n<='1',
'0' after 100 ns,
'1' after 200 ns,
'0' after 1 us,
'1' after 1100 ns,
'0' after 2 us,
'1' after 2100 ns,
'0' after 3 us,
'1' after 3100 ns,
'0' after 4 us,
'1' after 4100 ns,
'0' after 5 us,
'1' after 5100 ns,
'0' after 6 us,
'1' after 6100 ns,
'0' after 7 us,
'1' after 7100 ns,
'0' after 8 us,
'1' after 8100 ns;

S_clk<=not S_clk after 5.333 ns;

  sig_gen_dri_u : sig_gen_dri
  PORT MAP(
    I_clk        => S_clk,
    I_rst_n      => S_rst_n,
    O_data_ori0  => S_data_ori0,
    O_data_ori1  => S_data_ori1,
    O_data_ori2  => S_data_ori2,
    O_data_ori3  => S_data_ori3,
    O_data_ori4  => S_data_ori4,
    O_data_ori5  => S_data_ori5,
    O_data_ori6  => S_data_ori6,
    O_data_ori7  => S_data_ori7,
    O_data_ori8  => S_data_ori8,
    O_data_ori9  => S_data_ori9,
    O_data_ori10 => S_data_ori10,
    O_data_ori11 => S_data_ori11,
    O_data_ori12 => S_data_ori12,
    O_data_ori13 => S_data_ori13,
    O_data_ori14 => S_data_ori14,
    O_data_ori15 => S_data_ori15
  );



  process(S_clk)
  begin
  if rising_edge(S_clk) then
      rst_n_r<=S_rst_n;
  else
  null;
  end if;
  end process;

  rst_n_rise<=S_rst_n and (not rst_n_r);

  process(S_clk)
  begin
  if rising_edge(S_clk) then
      if rst_n_rise='1' then
          rst_cnt<=rst_cnt+1;
      else
      null;
      end if;
  else
  null;
  end if; 
  end process;


  process(S_rst_n, S_clk)
  file file1:text;
  variable file_status:file_open_status;
  variable buf:LINE;
  --  variable cnt_from_file_r:std_logic_vector(7 downto 0):=(others=>'0');
  variable cnt_from_file_r:natural:=0;
  variable file_name:string(1 to 11):="nihaonihaon";
  constant rst_cnt_stop:natural:=10;
  begin
  if rising_edge(S_clk) then
      case c_status is
      when s_idle     =>      c_status<=s_write;
                              file_open(file_status,file1,"data_record0.txt",write_mode);                              

      when s_write    =>      if rst_cnt>=rst_cnt_stop then
                                  c_status<=s_write_end;                                  
                              else
                                  c_status<=s_write;
                              end if;
                              write(buf,conv_integer(S_data_ori0));
                              writeline(file1,buf);

      when s_write_end  =>    file_close(file1);
                              c_status<=s_end;

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


      when s_end      =>      c_status<=s_end;
                              file_close(file1);

      when others     =>      c_status<=s_end;
      end case;
  else
  null;
  end if;
  end process;


END Behavioral;







