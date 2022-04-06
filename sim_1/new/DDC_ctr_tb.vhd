----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2022/04/05 19:26:43
-- Design Name: 
-- Module Name: DDC_ctr_tb - Behavioral
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

ENTITY DDC_ctr_tb IS

END DDC_ctr_tb;

ARCHITECTURE Behavioral OF DDC_ctr_tb IS
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
  SIGNAL rst_n_r    : std_logic := '0';
  SIGNAL rst_n_rise : std_logic := '0';
  SIGNAL rst_cnt    : natural   := 0;

  TYPE status_type IS (s_idle, s_write, s_write_end, s_read_begin, s_read, s_end);
  SIGNAL c_status : status_type := s_idle;

  SIGNAL cnt_from_file : std_logic_vector(7 DOWNTO 0) := (OTHERS => '0');
  SIGNAL S_clk        : std_logic := '0';
  SIGNAL S_rst_n      : std_logic := '1';
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

S_rst_n<='1',
'0' after 100 ns,
'1' after 200 ns,
'0' after 200200 ns,
'1' after 200300 ns,
'0' after 400300 ns;


S_clk<=not S_clk after 5.333 ns;



DDC_ctr_u : DDC_ctr
port map (
    I_clk   => S_clk,
    I_rst_n => S_rst_n,
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
FILE file2           : text;
FILE file3           : text;
FILE file4           : text;
FILE file5           : text;
FILE file6           : text;
FILE file7           : text;
FILE file8           : text;
FILE file9           : text;
FILE file10         : text;
FILE file11           : text;
FILE file12          : text;
FILE file13           : text;
FILE file14           : text;
FILE file15           : text;
FILE file16           : text;
  VARIABLE file_status : file_open_status;
  VARIABLE buf         : LINE;
  --  variable cnt_from_file_r:std_logic_vector(7 downto 0):=(others=>'0');
  VARIABLE cnt_from_file_r : natural         := 0;
  VARIABLE file_name       : string(1 TO 11) := "nihaonihaon";
  CONSTANT rst_cnt_stop    : natural         := 3;
BEGIN
  IF rising_edge(S_clk) THEN
    CASE c_status IS
      WHEN s_idle => c_status <= s_write;
            file_open(file_status, file1 , "S_data_mod_I0.txt", write_mode);
            file_open(file_status, file2 , "S_data_mod_I1.txt", write_mode);
            file_open(file_status, file3 , "S_data_mod_I2.txt", write_mode);
            file_open(file_status, file4 , "S_data_mod_I3.txt", write_mode);
            file_open(file_status, file5 , "S_data_mod_I4.txt", write_mode);
            file_open(file_status, file6 , "S_data_mod_I5.txt", write_mode);
            file_open(file_status, file7 , "S_data_mod_I6.txt", write_mode);
            file_open(file_status, file8 , "S_data_mod_I7.txt", write_mode);   
            file_open(file_status, file9 , "S_data_mod_I8.txt", write_mode);
            file_open(file_status, file10, "S_data_mod_I9.txt", write_mode);
            file_open(file_status, file11, "S_data_mod_I10.txt", write_mode);
            file_open(file_status, file12, "S_data_mod_I11.txt", write_mode);   
            file_open(file_status, file13, "S_data_mod_I12.txt", write_mode);
            file_open(file_status, file14, "S_data_mod_I13.txt", write_mode);
            file_open(file_status, file15, "S_data_mod_I14.txt", write_mode);
            file_open(file_status, file16, "S_data_mod_I15.txt", write_mode);  
                                                 
      WHEN s_write => IF rst_cnt >= rst_cnt_stop THEN
        c_status <= s_write_end;
      ELSE
        c_status <= s_write;
    END IF;
        write(buf, conv_integer(S_data_mod_I0));
                writeline(file1 , buf);
        write(buf, conv_integer(S_data_mod_I1));
                writeline(file2 , buf);
        write(buf, conv_integer(S_data_mod_I2));
                writeline(file3 , buf);
        write(buf, conv_integer(S_data_mod_I3));
                writeline(file4 , buf);
        write(buf, conv_integer(S_data_mod_I4));
                writeline(file5 , buf);
        write(buf, conv_integer(S_data_mod_I5));
                writeline(file6 , buf);
        write(buf, conv_integer(S_data_mod_I6));
                writeline(file7 , buf);
        write(buf, conv_integer(S_data_mod_I7));
                writeline(file8 , buf);
        write(buf, conv_integer(S_data_mod_I8));
                writeline(file9 , buf);
        write(buf, conv_integer(S_data_mod_I9));
                writeline(file10, buf);
        write(buf, conv_integer(S_data_mod_I10));
                writeline(file11, buf);
        write(buf, conv_integer(S_data_mod_I11));
                writeline(file12, buf);
        write(buf, conv_integer(S_data_mod_I12));
                writeline(file13, buf);
        write(buf, conv_integer(S_data_mod_I13));
                writeline(file14, buf);
        write(buf, conv_integer(S_data_mod_I14));

        writeline(file15, buf);
        write(buf, conv_integer(S_data_mod_I15));

        writeline(file16, buf);  
    WHEN s_write_end => 
        file_close(file1 );
        file_close(file2 );
        file_close(file3 );
        file_close(file4 );
        file_close(file5 );
        file_close(file6 );
        file_close(file7 );
        file_close(file8 );
        file_close(file9 );
        file_close(file10);
        file_close(file11);
        file_close(file12);
        file_close(file13);
        file_close(file14);
        file_close(file15);
        file_close(file16);
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
        file_close(file1 );
        file_close(file2 );
        file_close(file3 );
        file_close(file4 );
        file_close(file5 );
        file_close(file6 );
        file_close(file7 );
        file_close(file8 );
        file_close(file9 );
        file_close(file10);
        file_close(file11);
        file_close(file12);
        file_close(file13);
        file_close(file14);
        file_close(file15);
        file_close(file16);

    WHEN OTHERS => c_status <= s_end;
  END CASE;
ELSE
  NULL;
END IF;
END PROCESS;
END Behavioral;