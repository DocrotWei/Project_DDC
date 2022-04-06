----------------------------------------------------------------------------------
-- Company: HIT
-- Engineer: 陈学伟
-- 
-- Create Date: 2022/03/31 19:55:56
-- Design Name: 
-- ddcule Name: ddc_mod_dri - Behavioral
-- Project Name: DDC_project
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
USE IEEE.STD_LOGIC_arith.ALL;
USE IEEE.STD_LOGIC_unsigned.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

ENTITY ddc_mod_dri IS
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
    o_data_mod_I0  : OUT std_logic_vector(7 DOWNTO 0);
    o_data_mod_Q0  : OUT std_logic_vector(7 DOWNTO 0);
    o_data_mod_I1  : OUT std_logic_vector(7 DOWNTO 0);
    o_data_mod_Q1  : OUT std_logic_vector(7 DOWNTO 0);
    o_data_mod_I2  : OUT std_logic_vector(7 DOWNTO 0);
    o_data_mod_Q2  : OUT std_logic_vector(7 DOWNTO 0);
    o_data_mod_I3  : OUT std_logic_vector(7 DOWNTO 0);
    o_data_mod_Q3  : OUT std_logic_vector(7 DOWNTO 0);
    o_data_mod_I4  : OUT std_logic_vector(7 DOWNTO 0);
    o_data_mod_Q4  : OUT std_logic_vector(7 DOWNTO 0);
    o_data_mod_I5  : OUT std_logic_vector(7 DOWNTO 0);
    o_data_mod_Q5  : OUT std_logic_vector(7 DOWNTO 0);
    o_data_mod_I6  : OUT std_logic_vector(7 DOWNTO 0);
    o_data_mod_Q6  : OUT std_logic_vector(7 DOWNTO 0);
    o_data_mod_I7  : OUT std_logic_vector(7 DOWNTO 0);
    o_data_mod_Q7  : OUT std_logic_vector(7 DOWNTO 0);
    o_data_mod_I8  : OUT std_logic_vector(7 DOWNTO 0);
    o_data_mod_Q8  : OUT std_logic_vector(7 DOWNTO 0);
    o_data_mod_I9  : OUT std_logic_vector(7 DOWNTO 0);
    o_data_mod_Q9  : OUT std_logic_vector(7 DOWNTO 0);
    o_data_mod_I10 : OUT std_logic_vector(7 DOWNTO 0);
    o_data_mod_Q10 : OUT std_logic_vector(7 DOWNTO 0);
    o_data_mod_I11 : OUT std_logic_vector(7 DOWNTO 0);
    o_data_mod_Q11 : OUT std_logic_vector(7 DOWNTO 0);
    o_data_mod_I12 : OUT std_logic_vector(7 DOWNTO 0);
    o_data_mod_Q12 : OUT std_logic_vector(7 DOWNTO 0);
    o_data_mod_I13 : OUT std_logic_vector(7 DOWNTO 0);
    o_data_mod_Q13 : OUT std_logic_vector(7 DOWNTO 0);
    o_data_mod_I14 : OUT std_logic_vector(7 DOWNTO 0);
    o_data_mod_Q14 : OUT std_logic_vector(7 DOWNTO 0);
    o_data_mod_I15 : OUT std_logic_vector(7 DOWNTO 0);
    o_data_mod_Q15 : OUT std_logic_vector(7 DOWNTO 0)
  );
END ddc_mod_dri;
ARCHITECTURE Behavioral OF ddc_mod_dri IS

  ------------------------------IP核例化部分---------------------------------------
  COMPONENT ddS_compiler_0
    PORT (
      aclk                : IN std_logic;
      aresetn             : IN std_logic;
      s_axis_phase_tvalid : IN std_logic;
      s_axis_phase_tdata  : IN std_logic_vector(15 DOWNTO 0);
      m_axiS_data_tvalid  : OUT std_logic;
      m_axiS_data_tdata   : OUT std_logic_vector(31 DOWNTO 0)
    );
  END COMPONENT;

  COMPONENT mult_gen_0
    PORT (
      CLK  : IN std_logic;
      A    : IN std_logic_vector(7 DOWNTO 0);
      B    : IN std_logic_vector(15 DOWNTO 0);
      CE   : IN std_logic;
      SCLR : IN std_logic;
      P    : OUT std_logic_vector(23 DOWNTO 0)
    );
  END COMPONENT;
  -----------------------------固定参数部分----------------------------------------
  CONSTANT Freq_Word     : std_logic_vector(46 DOWNTO 0) := "00000000000000000000000000000000000000000000000";--750M
  CONSTANT Phase_inital0  : std_logic_vector(47 DOWNTO 0) := "000000000000000000000000000000000000000000000000"; 
  CONSTANT Phase_inital1  : std_logic_vector(47 DOWNTO 0) := "010000000000000000000000000000000000000000000000";
  CONSTANT Phase_inital2  : std_logic_vector(47 DOWNTO 0) := "100000000000000000000000000000000000000000000000";
  CONSTANT Phase_inital3  : std_logic_vector(47 DOWNTO 0) := "110000000000000000000000000000000000000000000000";
  CONSTANT Phase_inital4  : std_logic_vector(47 DOWNTO 0) := "000000000000000000000000000000000000000000000000";
  CONSTANT Phase_inital5  : std_logic_vector(47 DOWNTO 0) := "010000000000000000000000000000000000000000000000"; 
  CONSTANT Phase_inital6  : std_logic_vector(47 DOWNTO 0) := "100000000000000000000000000000000000000000000000"; 
  CONSTANT Phase_inital7  : std_logic_vector(47 DOWNTO 0) := "110000000000000000000000000000000000000000000000"; 
  CONSTANT Phase_inital8  : std_logic_vector(47 DOWNTO 0) := "000000000000000000000000000000000000000000000000"; 
  CONSTANT Phase_inital9  : std_logic_vector(47 DOWNTO 0) := "010000000000000000000000000000000000000000000000"; 
  CONSTANT Phase_inital10 : std_logic_vector(47 DOWNTO 0) := "100000000000000000000000000000000000000000000000"; 
  CONSTANT Phase_inital11 : std_logic_vector(47 DOWNTO 0) := "110000000000000000000000000000000000000000000000"; 
  CONSTANT Phase_inital12 : std_logic_vector(47 DOWNTO 0) := "000000000000000000000000000000000000000000000000"; 
  CONSTANT Phase_inital13 : std_logic_vector(47 DOWNTO 0) := "010000000000000000000000000000000000000000000000"; 
  CONSTANT Phase_inital14 : std_logic_vector(47 DOWNTO 0) := "100000000000000000000000000000000000000000000000"; 
  CONSTANT Phase_inital15 : std_logic_vector(47 DOWNTO 0) := "110000000000000000000000000000000000000000000000"; 


  ----------------------------可变参数部分----------------------------------------
  SIGNAL s_PhaseWord        : std_logic_vector(47 DOWNTO 0);
  SIGNAL S_dds_valid_lane0  : std_logic; --dds 通道有效信号
  SIGNAL S_dds_valid_lane1  : std_logic;
  SIGNAL S_dds_valid_lane2  : std_logic;
  SIGNAL S_dds_valid_lane3  : std_logic;
  SIGNAL S_dds_valid_lane4  : std_logic;
  SIGNAL S_dds_valid_lane5  : std_logic;
  SIGNAL S_dds_valid_lane6  : std_logic;
  SIGNAL S_dds_valid_lane7  : std_logic;
  SIGNAL S_dds_valid_lane8  : std_logic;
  SIGNAL S_dds_valid_lane9  : std_logic;
  SIGNAL S_dds_valid_lane10 : std_logic;
  SIGNAL S_dds_valid_lane11 : std_logic;
  SIGNAL S_dds_valid_lane12 : std_logic;
  SIGNAL S_dds_valid_lane13 : std_logic;
  SIGNAL S_dds_valid_lane14 : std_logic;
  SIGNAL S_dds_valid_lane15 : std_logic;

  SIGNAL S_data_lane0  : std_logic_vector(31 DOWNTO 0); --dds通道有效数据
  SIGNAL S_data_lane1  : std_logic_vector(31 DOWNTO 0);
  SIGNAL S_data_lane2  : std_logic_vector(31 DOWNTO 0);
  SIGNAL S_data_lane3  : std_logic_vector(31 DOWNTO 0);
  SIGNAL S_data_lane4  : std_logic_vector(31 DOWNTO 0);
  SIGNAL S_data_lane5  : std_logic_vector(31 DOWNTO 0);
  SIGNAL S_data_lane6  : std_logic_vector(31 DOWNTO 0);
  SIGNAL S_data_lane7  : std_logic_vector(31 DOWNTO 0);
  SIGNAL S_data_lane8  : std_logic_vector(31 DOWNTO 0);
  SIGNAL S_data_lane9  : std_logic_vector(31 DOWNTO 0);
  SIGNAL S_data_lane10 : std_logic_vector(31 DOWNTO 0);
  SIGNAL S_data_lane11 : std_logic_vector(31 DOWNTO 0);
  SIGNAL S_data_lane12 : std_logic_vector(31 DOWNTO 0);
  SIGNAL S_data_lane13 : std_logic_vector(31 DOWNTO 0);
  SIGNAL S_data_lane14 : std_logic_vector(31 DOWNTO 0);
  SIGNAL S_data_lane15 : std_logic_vector(31 DOWNTO 0);

  SIGNAL s_Phase_Accu : std_logic_vector(47 DOWNTO 0); --DDS相位累加字
  SIGNAL s_Phase0     : std_logic_vector(47 DOWNTO 0); --DDS相位
  SIGNAL s_Phase1     : std_logic_vector(47 DOWNTO 0);
  SIGNAL s_Phase2     : std_logic_vector(47 DOWNTO 0);
  SIGNAL s_Phase3     : std_logic_vector(47 DOWNTO 0);
  SIGNAL s_Phase4     : std_logic_vector(47 DOWNTO 0);
  SIGNAL s_Phase5     : std_logic_vector(47 DOWNTO 0);
  SIGNAL s_Phase6     : std_logic_vector(47 DOWNTO 0);
  SIGNAL s_Phase7     : std_logic_vector(47 DOWNTO 0);
  SIGNAL s_Phase8     : std_logic_vector(47 DOWNTO 0);
  SIGNAL s_Phase9     : std_logic_vector(47 DOWNTO 0);
  SIGNAL s_Phase10    : std_logic_vector(47 DOWNTO 0);
  SIGNAL s_Phase11    : std_logic_vector(47 DOWNTO 0);
  SIGNAL s_Phase12    : std_logic_vector(47 DOWNTO 0);
  SIGNAL s_Phase13    : std_logic_vector(47 DOWNTO 0);
  SIGNAL s_Phase14    : std_logic_vector(47 DOWNTO 0);
  SIGNAL s_Phase15    : std_logic_vector(47 DOWNTO 0);

  SIGNAL s_Phase0_16bit  : std_logic_vector(15 DOWNTO 0); --DDS 相位前16位
  SIGNAL s_Phase1_16bit  : std_logic_vector(15 DOWNTO 0);
  SIGNAL s_Phase2_16bit  : std_logic_vector(15 DOWNTO 0);
  SIGNAL s_Phase3_16bit  : std_logic_vector(15 DOWNTO 0);
  SIGNAL s_Phase4_16bit  : std_logic_vector(15 DOWNTO 0);
  SIGNAL s_Phase5_16bit  : std_logic_vector(15 DOWNTO 0);
  SIGNAL s_Phase6_16bit  : std_logic_vector(15 DOWNTO 0);
  SIGNAL s_Phase7_16bit  : std_logic_vector(15 DOWNTO 0);
  SIGNAL s_Phase8_16bit  : std_logic_vector(15 DOWNTO 0);
  SIGNAL s_Phase9_16bit  : std_logic_vector(15 DOWNTO 0);
  SIGNAL s_Phase10_16bit : std_logic_vector(15 DOWNTO 0);
  SIGNAL s_Phase11_16bit : std_logic_vector(15 DOWNTO 0);
  SIGNAL s_Phase12_16bit : std_logic_vector(15 DOWNTO 0);
  SIGNAL s_Phase13_16bit : std_logic_vector(15 DOWNTO 0);
  SIGNAL s_Phase14_16bit : std_logic_vector(15 DOWNTO 0);
  SIGNAL s_Phase15_16bit : std_logic_vector(15 DOWNTO 0);

  -----------------------------载波信号---------------------------
  SIGNAL S_cos_mod0  : std_logic_vector(15 DOWNTO 0);
  SIGNAL S_cos_mod1  : std_logic_vector(15 DOWNTO 0);
  SIGNAL S_cos_mod2  : std_logic_vector(15 DOWNTO 0);
  SIGNAL S_cos_mod3  : std_logic_vector(15 DOWNTO 0);
  SIGNAL S_cos_mod4  : std_logic_vector(15 DOWNTO 0);
  SIGNAL S_cos_mod5  : std_logic_vector(15 DOWNTO 0);
  SIGNAL S_cos_mod6  : std_logic_vector(15 DOWNTO 0);
  SIGNAL S_cos_mod7  : std_logic_vector(15 DOWNTO 0);
  SIGNAL S_cos_mod8  : std_logic_vector(15 DOWNTO 0);
  SIGNAL S_cos_mod9  : std_logic_vector(15 DOWNTO 0);
  SIGNAL S_cos_mod10 : std_logic_vector(15 DOWNTO 0);
  SIGNAL S_cos_mod11 : std_logic_vector(15 DOWNTO 0);
  SIGNAL S_cos_mod12 : std_logic_vector(15 DOWNTO 0);
  SIGNAL S_cos_mod13 : std_logic_vector(15 DOWNTO 0);
  SIGNAL S_cos_mod14 : std_logic_vector(15 DOWNTO 0);
  SIGNAL S_cos_mod15 : std_logic_vector(15 DOWNTO 0);

  SIGNAL S_sin_mod0  : std_logic_vector(15 DOWNTO 0);
  SIGNAL S_sin_mod1  : std_logic_vector(15 DOWNTO 0);
  SIGNAL S_sin_mod2  : std_logic_vector(15 DOWNTO 0);
  SIGNAL S_sin_mod3  : std_logic_vector(15 DOWNTO 0);
  SIGNAL S_sin_mod4  : std_logic_vector(15 DOWNTO 0);
  SIGNAL S_sin_mod5  : std_logic_vector(15 DOWNTO 0);
  SIGNAL S_sin_mod6  : std_logic_vector(15 DOWNTO 0);
  SIGNAL S_sin_mod7  : std_logic_vector(15 DOWNTO 0);
  SIGNAL S_sin_mod8  : std_logic_vector(15 DOWNTO 0);
  SIGNAL S_sin_mod9  : std_logic_vector(15 DOWNTO 0);
  SIGNAL S_sin_mod10 : std_logic_vector(15 DOWNTO 0);
  SIGNAL S_sin_mod11 : std_logic_vector(15 DOWNTO 0);
  SIGNAL S_sin_mod12 : std_logic_vector(15 DOWNTO 0);
  SIGNAL S_sin_mod13 : std_logic_vector(15 DOWNTO 0);
  SIGNAL S_sin_mod14 : std_logic_vector(15 DOWNTO 0);
  SIGNAL S_sin_mod15 : std_logic_vector(15 DOWNTO 0);

  ---------------------未截位前输出-----------------------------
  SIGNAL S_data_mod_I0_24bit  : std_logic_vector(23 DOWNTO 0);
  SIGNAL S_data_mod_Q0_24bit  : std_logic_vector(23 DOWNTO 0);
  SIGNAL S_data_mod_I1_24bit  : std_logic_vector(23 DOWNTO 0);
  SIGNAL S_data_mod_Q1_24bit  : std_logic_vector(23 DOWNTO 0);
  SIGNAL S_data_mod_I2_24bit  : std_logic_vector(23 DOWNTO 0);
  SIGNAL S_data_mod_Q2_24bit  : std_logic_vector(23 DOWNTO 0);
  SIGNAL S_data_mod_I3_24bit  : std_logic_vector(23 DOWNTO 0);
  SIGNAL S_data_mod_Q3_24bit  : std_logic_vector(23 DOWNTO 0);
  SIGNAL S_data_mod_I4_24bit  : std_logic_vector(23 DOWNTO 0);
  SIGNAL S_data_mod_Q4_24bit  : std_logic_vector(23 DOWNTO 0);
  SIGNAL S_data_mod_I5_24bit  : std_logic_vector(23 DOWNTO 0);
  SIGNAL S_data_mod_Q5_24bit  : std_logic_vector(23 DOWNTO 0);
  SIGNAL S_data_mod_I6_24bit  : std_logic_vector(23 DOWNTO 0);
  SIGNAL S_data_mod_Q6_24bit  : std_logic_vector(23 DOWNTO 0);
  SIGNAL S_data_mod_I7_24bit  : std_logic_vector(23 DOWNTO 0);
  SIGNAL S_data_mod_Q7_24bit  : std_logic_vector(23 DOWNTO 0);
  SIGNAL S_data_mod_I8_24bit  : std_logic_vector(23 DOWNTO 0);
  SIGNAL S_data_mod_Q8_24bit  : std_logic_vector(23 DOWNTO 0);
  SIGNAL S_data_mod_I9_24bit  : std_logic_vector(23 DOWNTO 0);
  SIGNAL S_data_mod_Q9_24bit  : std_logic_vector(23 DOWNTO 0);
  SIGNAL S_data_mod_I10_24bit : std_logic_vector(23 DOWNTO 0);
  SIGNAL S_data_mod_Q10_24bit : std_logic_vector(23 DOWNTO 0);
  SIGNAL S_data_mod_I11_24bit : std_logic_vector(23 DOWNTO 0);
  SIGNAL S_data_mod_Q11_24bit : std_logic_vector(23 DOWNTO 0);
  SIGNAL S_data_mod_I12_24bit : std_logic_vector(23 DOWNTO 0);
  SIGNAL S_data_mod_Q12_24bit : std_logic_vector(23 DOWNTO 0);
  SIGNAL S_data_mod_I13_24bit : std_logic_vector(23 DOWNTO 0);
  SIGNAL S_data_mod_Q13_24bit : std_logic_vector(23 DOWNTO 0);
  SIGNAL S_data_mod_I14_24bit : std_logic_vector(23 DOWNTO 0);
  SIGNAL S_data_mod_Q14_24bit : std_logic_vector(23 DOWNTO 0);
  SIGNAL S_data_mod_I15_24bit : std_logic_vector(23 DOWNTO 0);
  SIGNAL S_data_mod_Q15_24bit : std_logic_vector(23 DOWNTO 0);

BEGIN
  -----------------------------------------------------
  --							DDS
  -----------------------------------------------------

  --Odd
  PROCESS (I_clk, I_rst_n)
  BEGIN
    IF I_rst_n = '0' THEN
      --		init_Phase1 <= (others=>'0');
      S_PhaseWord <= (OTHERS => '0');
    ELSIF rising_edge(I_clk) THEN
      --		init_Phase1 <= sxt(Freq_Word,34);
      S_PhaseWord <= Freq_Word & '0';

    END IF;
  END PROCESS;

  PROCESS (I_clk, I_rst_n)
  BEGIN
    IF I_rst_n = '0' THEN
      s_Phase_Accu <= (OTHERS => '0');
    ELSIF rising_edge(I_clk) THEN
      s_Phase_Accu <= s_Phase_Accu + s_PhaseWord;
    END IF;
  END PROCESS;

  PROCESS (I_clk, I_rst_n)
  BEGIN
    IF I_rst_n = '0' THEN
      s_Phase1 <= (OTHERS => '0');
      --		Phase2 <= (others=>'0');
    ELSIF rising_edge(I_clk) THEN
      s_Phase0  <= Phase_inital0+s_Phase_Accu;
      s_Phase1  <= Phase_inital1+ s_Phase_Accu;
      s_Phase2  <= Phase_inital2 + s_Phase_Accu;
      s_Phase3  <= Phase_inital3 + s_Phase_Accu;
      s_Phase4  <= Phase_inital4 + s_Phase_Accu;
      s_Phase5  <= Phase_inital5 + s_Phase_Accu;
      s_Phase6  <= Phase_inital6 + s_Phase_Accu;
      s_Phase7  <= Phase_inital7 + s_Phase_Accu;
      s_Phase8  <= Phase_inital8 + s_Phase_Accu;
      s_Phase9  <= Phase_inital9 + s_Phase_Accu;
      s_Phase10 <= Phase_inital10 + s_Phase_Accu;
      s_Phase11 <= Phase_inital11 + s_Phase_Accu;
      s_Phase12 <= Phase_inital12 + s_Phase_Accu;
      s_Phase13 <= Phase_inital13 + s_Phase_Accu;
      s_Phase14 <= Phase_inital14 + s_Phase_Accu;
      s_Phase15 <= Phase_inital15 + s_Phase_Accu;
    END IF;
  END PROCESS;
  s_Phase0_16bit  <=s_Phase0(47 DOWNTO 32) +s_Phase0(31);
  s_Phase1_16bit  <=s_Phase1(47 DOWNTO 32)+s_Phase1(31);
  s_Phase2_16bit  <=s_Phase2(47 DOWNTO 32)+s_Phase2(31);
  s_Phase3_16bit  <=s_Phase3(47 DOWNTO 32)+s_Phase3(31);
  s_Phase4_16bit  <=s_Phase4(47 DOWNTO 32)+s_Phase4(31);
  s_Phase5_16bit  <=s_Phase5(47 DOWNTO 32)+s_Phase5(31);
  s_Phase6_16bit  <=s_Phase6(47 DOWNTO 32)+s_Phase6(31);
  s_Phase7_16bit  <=s_Phase7(47 DOWNTO 32)+s_Phase7(31);
  s_Phase8_16bit  <=s_Phase8(47 DOWNTO 32)+s_Phase8(31);
  s_Phase9_16bit  <=s_Phase9(47 DOWNTO 32)+s_Phase9(31);
  s_Phase10_16bit <=s_Phase10(47 DOWNTO 32)+s_Phase10(31);
  s_Phase11_16bit <=s_Phase11(47 DOWNTO 32)+s_Phase11(31);
  s_Phase12_16bit <=s_Phase12(47 DOWNTO 32)+s_Phase12(31);
  s_Phase13_16bit <=s_Phase13(47 DOWNTO 32)+s_Phase13(31);
  s_Phase14_16bit <=s_Phase14(47 DOWNTO 32)+s_Phase14(31);
  s_Phase15_16bit <=s_Phase15(47 DOWNTO 32)+s_Phase15(31);

  Sin_Cosine_Lut_lane0 : ddS_compiler_0
  PORT MAP
  (
    aclk                => I_clk,
    aresetn             => I_rst_n,
    s_axis_phase_tvalid => '1',
    s_axis_phase_tdata  => s_Phase0_16bit,
    m_axiS_data_tvalid  => S_dds_valid_lane0,
    m_axiS_data_tdata   => S_data_lane0
  );

  Sin_Cosine_Lut_lane1 : ddS_compiler_0
  PORT MAP
  (
    aclk                => I_clk,
    aresetn             => I_rst_n,
    s_axis_phase_tvalid => '1',
    s_axis_phase_tdata  => s_Phase1_16bit,
    m_axiS_data_tvalid  => S_dds_valid_lane1,
    m_axiS_data_tdata   => S_data_lane1
  );

  Sin_Cosine_Lut_lane2 : ddS_compiler_0
  PORT MAP
  (
    aclk                => I_clk,
    aresetn             => I_rst_n,
    s_axis_phase_tvalid => '1',
    s_axis_phase_tdata  => s_Phase2_16bit,
    m_axiS_data_tvalid  => S_dds_valid_lane2,
    m_axiS_data_tdata   => S_data_lane2
  );

  Sin_Cosine_Lut_lane3 : ddS_compiler_0
  PORT MAP
  (
    aclk                => I_clk,
    aresetn             => I_rst_n,
    s_axis_phase_tvalid => '1',
    s_axis_phase_tdata  => s_Phase3_16bit,
    m_axiS_data_tvalid  => S_dds_valid_lane3,
    m_axiS_data_tdata   => S_data_lane3
  );

  Sin_Cosine_Lut_lane4 : ddS_compiler_0
  PORT MAP
  (
    aclk                => I_clk,
    aresetn             => I_rst_n,
    s_axis_phase_tvalid => '1',
    s_axis_phase_tdata  => s_Phase4_16bit,
    m_axiS_data_tvalid  => S_dds_valid_lane4,
    m_axiS_data_tdata   => S_data_lane4
  );

  Sin_Cosine_Lut_lane5 : ddS_compiler_0
  PORT MAP
  (
    aclk                => I_clk,
    aresetn             => I_rst_n,
    s_axis_phase_tvalid => '1',
    s_axis_phase_tdata  => s_Phase5_16bit,
    m_axiS_data_tvalid  => S_dds_valid_lane5,
    m_axiS_data_tdata   => S_data_lane5
  );

  Sin_Cosine_Lut_lane6 : ddS_compiler_0
  PORT MAP
  (
    aclk                => I_clk,
    aresetn             => I_rst_n,
    s_axis_phase_tvalid => '1',
    s_axis_phase_tdata  => s_Phase6_16bit,
    m_axiS_data_tvalid  => S_dds_valid_lane6,
    m_axiS_data_tdata   => S_data_lane6
  );

  Sin_Cosine_Lut_lane7 : ddS_compiler_0
  PORT MAP
  (
    aclk                => I_clk,
    aresetn             => I_rst_n,
    s_axis_phase_tvalid => '1',
    s_axis_phase_tdata  => s_Phase7_16bit,
    m_axiS_data_tvalid  => S_dds_valid_lane7,
    m_axiS_data_tdata   => S_data_lane7
  );

  Sin_Cosine_Lut_lane8 : ddS_compiler_0
  PORT MAP
  (
    aclk                => I_clk,
    aresetn             => I_rst_n,
    s_axis_phase_tvalid => '1',
    s_axis_phase_tdata  => s_Phase8_16bit,
    m_axiS_data_tvalid  => S_dds_valid_lane8,
    m_axiS_data_tdata   => S_data_lane8
  );

  Sin_Cosine_Lut_lane9 : ddS_compiler_0
  PORT MAP
  (
    aclk                => I_clk,
    aresetn             => I_rst_n,
    s_axis_phase_tvalid => '1',
    s_axis_phase_tdata  => s_Phase9_16bit,
    m_axiS_data_tvalid  => S_dds_valid_lane9,
    m_axiS_data_tdata   => S_data_lane9
  );

  Sin_Cosine_Lut_lane10 : ddS_compiler_0
  PORT MAP
  (
    aclk                => I_clk,
    aresetn             => I_rst_n,
    s_axis_phase_tvalid => '1',
    s_axis_phase_tdata  => s_Phase10_16bit,
    m_axiS_data_tvalid  => S_dds_valid_lane10,
    m_axiS_data_tdata   => S_data_lane10
  );

  Sin_Cosine_Lut_lane11 : ddS_compiler_0
  PORT MAP
  (
    aclk                => I_clk,
    aresetn             => I_rst_n,
    s_axis_phase_tvalid => '1',
    s_axis_phase_tdata  => s_Phase11_16bit,
    m_axiS_data_tvalid  => S_dds_valid_lane11,
    m_axiS_data_tdata   => S_data_lane11
  );

  Sin_Cosine_Lut_lane12 : ddS_compiler_0
  PORT MAP
  (
    aclk                => I_clk,
    aresetn             => I_rst_n,
    s_axis_phase_tvalid => '1',
    s_axis_phase_tdata  => s_Phase12_16bit,
    m_axiS_data_tvalid  => S_dds_valid_lane12,
    m_axiS_data_tdata   => S_data_lane12
  );

  Sin_Cosine_Lut_lane13 : ddS_compiler_0
  PORT MAP
  (
    aclk                => I_clk,
    aresetn             => I_rst_n,
    s_axis_phase_tvalid => '1',
    s_axis_phase_tdata  => s_Phase13_16bit,
    m_axiS_data_tvalid  => S_dds_valid_lane13,
    m_axiS_data_tdata   => S_data_lane13
  );

  Sin_Cosine_Lut_lane14 : ddS_compiler_0
  PORT MAP
  (
    aclk                => I_clk,
    aresetn             => I_rst_n,
    s_axis_phase_tvalid => '1',
    s_axis_phase_tdata  => s_Phase14_16bit,
    m_axiS_data_tvalid  => S_dds_valid_lane14,
    m_axiS_data_tdata   => S_data_lane14
  );

  Sin_Cosine_Lut_lane15 : ddS_compiler_0
  PORT MAP
  (
    aclk                => I_clk,
    aresetn             => I_rst_n,
    s_axis_phase_tvalid => '1',
    s_axis_phase_tdata  => s_Phase15_16bit,
    m_axiS_data_tvalid  => S_dds_valid_lane15,
    m_axiS_data_tdata   => S_data_lane15
  );

  PROCESS (I_rst_n, I_clk)
  BEGIN
    IF (I_rst_n = '0') THEN
      S_cos_mod0  <= (OTHERS => '0');
      S_cos_mod1  <= (OTHERS => '0');
      S_cos_mod2  <= (OTHERS => '0');
      S_cos_mod3  <= (OTHERS => '0');
      S_cos_mod4  <= (OTHERS => '0');
      S_cos_mod5  <= (OTHERS => '0');
      S_cos_mod6  <= (OTHERS => '0');
      S_cos_mod7  <= (OTHERS => '0');
      S_cos_mod8  <= (OTHERS => '0');
      S_cos_mod9  <= (OTHERS => '0');
      S_cos_mod10 <= (OTHERS => '0');
      S_cos_mod11 <= (OTHERS => '0');
      S_cos_mod12 <= (OTHERS => '0');
      S_cos_mod13 <= (OTHERS => '0');
      S_cos_mod14 <= (OTHERS => '0');
      S_cos_mod15 <= (OTHERS => '0');

      S_sin_mod0  <= (OTHERS => '0');
      S_sin_mod1  <= (OTHERS => '0');
      S_sin_mod2  <= (OTHERS => '0');
      S_sin_mod3  <= (OTHERS => '0');
      S_sin_mod4  <= (OTHERS => '0');
      S_sin_mod5  <= (OTHERS => '0');
      S_sin_mod6  <= (OTHERS => '0');
      S_sin_mod7  <= (OTHERS => '0');
      S_sin_mod8  <= (OTHERS => '0');
      S_sin_mod9  <= (OTHERS => '0');
      S_sin_mod10 <= (OTHERS => '0');
      S_sin_mod11 <= (OTHERS => '0');
      S_sin_mod12 <= (OTHERS => '0');
      S_sin_mod13 <= (OTHERS => '0');
      S_sin_mod14 <= (OTHERS => '0');
      S_sin_mod15 <= (OTHERS => '0');
    ELSIF (I_clk'event AND I_clk = '1') THEN
      IF ((S_dds_valid_lane0 AND S_dds_valid_lane1 AND S_dds_valid_lane2 AND S_dds_valid_lane3 AND S_dds_valid_lane4 AND S_dds_valid_lane5 AND S_dds_valid_lane6 AND S_dds_valid_lane7 AND S_dds_valid_lane8 AND S_dds_valid_lane9 AND S_dds_valid_lane10 AND S_dds_valid_lane11 AND S_dds_valid_lane12 AND S_dds_valid_lane13 AND S_dds_valid_lane14 AND S_dds_valid_lane15) = '1') THEN
        S_cos_mod0  <= (S_data_lane0 (15 DOWNTO 0));
        S_cos_mod1  <= (S_data_lane1 (15 DOWNTO 0));
        S_cos_mod2  <= (S_data_lane2 (15 DOWNTO 0));
        S_cos_mod3  <= (S_data_lane3 (15 DOWNTO 0));
        S_cos_mod4  <= (S_data_lane4 (15 DOWNTO 0));
        S_cos_mod5  <= (S_data_lane5 (15 DOWNTO 0));
        S_cos_mod6  <= (S_data_lane6 (15 DOWNTO 0));
        S_cos_mod7  <= (S_data_lane7 (15 DOWNTO 0));
        S_cos_mod8  <= (S_data_lane8 (15 DOWNTO 0));
        S_cos_mod9  <= (S_data_lane9 (15 DOWNTO 0));
        S_cos_mod10 <= (S_data_lane10(15 DOWNTO 0));
        S_cos_mod11 <= (S_data_lane11(15 DOWNTO 0));
        S_cos_mod12 <= (S_data_lane12(15 DOWNTO 0));
        S_cos_mod13 <= (S_data_lane13(15 DOWNTO 0));
        S_cos_mod14 <= (S_data_lane14(15 DOWNTO 0));
        S_cos_mod15 <= (S_data_lane15(15 DOWNTO 0));

        S_sin_mod0  <= (S_data_lane0 (31 DOWNTO 16));
        S_sin_mod1  <= (S_data_lane1 (31 DOWNTO 16));
        S_sin_mod2  <= (S_data_lane2 (31 DOWNTO 16));
        S_sin_mod3  <= (S_data_lane3 (31 DOWNTO 16));
        S_sin_mod4  <= (S_data_lane4 (31 DOWNTO 16));
        S_sin_mod5  <= (S_data_lane5 (31 DOWNTO 16));
        S_sin_mod6  <= (S_data_lane6 (31 DOWNTO 16));
        S_sin_mod7  <= (S_data_lane7 (31 DOWNTO 16));
        S_sin_mod8  <= (S_data_lane8 (31 DOWNTO 16));
        S_sin_mod9  <= (S_data_lane9 (31 DOWNTO 16));
        S_sin_mod10 <= (S_data_lane10(31 DOWNTO 16));
        S_sin_mod11 <= (S_data_lane11(31 DOWNTO 16));
        S_sin_mod12 <= (S_data_lane12(31 DOWNTO 16));
        S_sin_mod13 <= (S_data_lane13(31 DOWNTO 16));
        S_sin_mod14 <= (S_data_lane14(31 DOWNTO 16));
        S_sin_mod15 <= (S_data_lane15(31 DOWNTO 16));
      END IF;
    END IF;
  END PROCESS;

  ------------------------数字下变频部分------------------------------
  I0_mult_gen_0_u : mult_gen_0
  PORT MAP(
    CLK  => I_clk,
    A    => I_data_mod0,
    B    => S_cos_mod0,
    CE   => I_rst_n,
    SCLR => '0',
    P    => S_data_mod_I0_24bit
  );

  Q0_mult_gen_0_u : mult_gen_0
  PORT MAP(
    CLK  => I_clk,
    A    => I_data_mod0,
    B    => S_sin_mod0,
    CE   => I_rst_n,
    SCLR => '0',
    P    => S_data_mod_Q0_24bit
  );

  I1_mult_gen_0_u : mult_gen_0
  PORT MAP(
    CLK  => I_clk,
    A    => I_data_mod1,
    B    => S_cos_mod1,
    CE   => I_rst_n,
    SCLR => '0',
    P    => S_data_mod_I1_24bit
  );

  Q1_mult_gen_0_u : mult_gen_0
  PORT MAP(
    CLK  => I_clk,
    A    => I_data_mod1,
    B    => S_sin_mod1,
    CE   => I_rst_n,
    SCLR => '0',
    P    => S_data_mod_Q1_24bit
  );

  I2_mult_gen_0_u : mult_gen_0
  PORT MAP(
    CLK  => I_clk,
    A    => I_data_mod2,
    B    => S_cos_mod2,
    CE   => I_rst_n,
    SCLR => '0',
    P    => S_data_mod_I2_24bit
  );

  Q2_mult_gen_0_u : mult_gen_0
  PORT MAP(
    CLK  => I_clk,
    A    => I_data_mod2,
    B    => S_sin_mod2,
    CE   => I_rst_n,
    SCLR => '0',
    P    => S_data_mod_Q2_24bit
  );

  I3_mult_gen_0_u : mult_gen_0
  PORT MAP(
    CLK  => I_clk,
    A    => I_data_mod3,
    B    => S_cos_mod3,
    CE   => I_rst_n,
    SCLR => '0',
    P    => S_data_mod_I3_24bit
  );

  Q3_mult_gen_0_u : mult_gen_0
  PORT MAP(
    CLK  => I_clk,
    A    => I_data_mod3,
    B    => S_sin_mod3,
    CE   => I_rst_n,
    SCLR => '0',
    P    => S_data_mod_Q3_24bit
  );

  I4_mult_gen_0_u : mult_gen_0
  PORT MAP(
    CLK  => I_clk,
    A    => I_data_mod4,
    B    => S_cos_mod4,
    CE   => I_rst_n,
    SCLR => '0',
    P    => S_data_mod_I4_24bit
  );

  Q4_mult_gen_0_u : mult_gen_0
  PORT MAP(
    CLK  => I_clk,
    A    => I_data_mod4,
    B    => S_sin_mod4,
    CE   => I_rst_n,
    SCLR => '0',
    P    => S_data_mod_Q4_24bit
  );

  I5_mult_gen_0_u : mult_gen_0
  PORT MAP(
    CLK  => I_clk,
    A    => I_data_mod5,
    B    => S_cos_mod5,
    CE   => I_rst_n,
    SCLR => '0',
    P    => S_data_mod_I5_24bit
  );

  Q5_mult_gen_0_u : mult_gen_0
  PORT MAP(
    CLK  => I_clk,
    A    => I_data_mod5,
    B    => S_sin_mod5,
    CE   => I_rst_n,
    SCLR => '0',
    P    => S_data_mod_Q5_24bit
  );

  I6_mult_gen_0_u : mult_gen_0
  PORT MAP(
    CLK  => I_clk,
    A    => I_data_mod6,
    B    => S_cos_mod6,
    CE   => I_rst_n,
    SCLR => '0',
    P    => S_data_mod_I6_24bit
  );

  Q6_mult_gen_0_u : mult_gen_0
  PORT MAP(
    CLK  => I_clk,
    A    => I_data_mod6,
    B    => S_sin_mod6,
    CE   => I_rst_n,
    SCLR => '0',
    P    => S_data_mod_Q6_24bit
  );

  I7_mult_gen_0_u : mult_gen_0
  PORT MAP(
    CLK  => I_clk,
    A    => I_data_mod7,
    B    => S_cos_mod7,
    CE   => I_rst_n,
    SCLR => '0',
    P    => S_data_mod_I7_24bit
  );

  Q7_mult_gen_0_u : mult_gen_0
  PORT MAP(
    CLK  => I_clk,
    A    => I_data_mod7,
    B    => S_sin_mod7,
    CE   => I_rst_n,
    SCLR => '0',
    P    => S_data_mod_Q7_24bit
  );

  I8_mult_gen_0_u : mult_gen_0
  PORT MAP(
    CLK  => I_clk,
    A    => I_data_mod8,
    B    => S_cos_mod8,
    CE   => I_rst_n,
    SCLR => '0',
    P    => S_data_mod_I8_24bit
  );

  Q8_mult_gen_0_u : mult_gen_0
  PORT MAP(
    CLK  => I_clk,
    A    => I_data_mod8,
    B    => S_sin_mod8,
    CE   => I_rst_n,
    SCLR => '0',
    P    => S_data_mod_Q8_24bit
  );

  I9_mult_gen_0_u : mult_gen_0
  PORT MAP(
    CLK  => I_clk,
    A    => I_data_mod9,
    B    => S_cos_mod9,
    CE   => I_rst_n,
    SCLR => '0',
    P    => S_data_mod_I9_24bit
  );

  Q9_mult_gen_0_u : mult_gen_0
  PORT MAP(
    CLK  => I_clk,
    A    => I_data_mod9,
    B    => S_sin_mod9,
    CE   => I_rst_n,
    SCLR => '0',
    P    => S_data_mod_Q9_24bit
  );

  I10_mult_gen_0_u : mult_gen_0
  PORT MAP(
    CLK  => I_clk,
    A    => I_data_mod10,
    B    => S_cos_mod10,
    CE   => I_rst_n,
    SCLR => '0',
    P    => S_data_mod_I10_24bit
  );

  Q10_mult_gen_0_u : mult_gen_0
  PORT MAP(
    CLK  => I_clk,
    A    => I_data_mod10,
    B    => S_sin_mod10,
    CE   => I_rst_n,
    SCLR => '0',
    P    => S_data_mod_Q10_24bit
  );

  I11_mult_gen_0_u : mult_gen_0
  PORT MAP(
    CLK  => I_clk,
    A    => I_data_mod11,
    B    => S_cos_mod11,
    CE   => I_rst_n,
    SCLR => '0',
    P    => S_data_mod_I11_24bit
  );

  Q11_mult_gen_0_u : mult_gen_0
  PORT MAP(
    CLK  => I_clk,
    A    => I_data_mod11,
    B    => S_sin_mod11,
    CE   => I_rst_n,
    SCLR => '0',
    P    => S_data_mod_Q11_24bit
  );

  I12_mult_gen_0_u : mult_gen_0
  PORT MAP(
    CLK  => I_clk,
    A    => I_data_mod12,
    B    => S_cos_mod12,
    CE   => I_rst_n,
    SCLR => '0',
    P    => S_data_mod_I12_24bit
  );

  Q12_mult_gen_0_u : mult_gen_0
  PORT MAP(
    CLK  => I_clk,
    A    => I_data_mod12,
    B    => S_sin_mod12,
    CE   => I_rst_n,
    SCLR => '0',
    P    => S_data_mod_Q12_24bit
  );

  I13_mult_gen_0_u : mult_gen_0
  PORT MAP(
    CLK  => I_clk,
    A    => I_data_mod13,
    B    => S_cos_mod13,
    CE   => I_rst_n,
    SCLR => '0',
    P    => S_data_mod_I13_24bit
  );

  Q13_mult_gen_0_u : mult_gen_0
  PORT MAP(
    CLK  => I_clk,
    A    => I_data_mod13,
    B    => S_sin_mod13,
    CE   => I_rst_n,
    SCLR => '0',
    P    => S_data_mod_Q13_24bit
  );

  I14_mult_gen_0_u : mult_gen_0
  PORT MAP(
    CLK  => I_clk,
    A    => I_data_mod14,
    B    => S_cos_mod14,
    CE   => I_rst_n,
    SCLR => '0',
    P    => S_data_mod_I14_24bit
  );

  Q14_mult_gen_0_u : mult_gen_0
  PORT MAP(
    CLK  => I_clk,
    A    => I_data_mod14,
    B    => S_sin_mod14,
    CE   => I_rst_n,
    SCLR => '0',
    P    => S_data_mod_Q14_24bit
  );

  I15_mult_gen_0_u : mult_gen_0
  PORT MAP(
    CLK  => I_clk,
    A    => I_data_mod15,
    B    => S_cos_mod15,
    CE   => I_rst_n,
    SCLR => '0',
    P    => S_data_mod_I15_24bit
  );

  Q15_mult_gen_0_u : mult_gen_0
  PORT MAP(
    CLK  => I_clk,
    A    => I_data_mod15,
    B    => S_sin_mod15,
    CE   => I_rst_n,
    SCLR => '0',
    P    => S_data_mod_Q15_24bit
  );

  o_data_mod_I0  <= S_data_mod_I0_24bit(22 DOWNTO 15);
  o_data_mod_Q0  <= S_data_mod_Q0_24bit(22 DOWNTO 15);
  o_data_mod_I1  <= S_data_mod_I1_24bit(22 DOWNTO 15);
  o_data_mod_Q1  <= S_data_mod_Q1_24bit(22 DOWNTO 15);
  o_data_mod_I2  <= S_data_mod_I2_24bit(22 DOWNTO 15);
  o_data_mod_Q2  <= S_data_mod_Q2_24bit(22 DOWNTO 15);
  o_data_mod_I3  <= S_data_mod_I3_24bit(22 DOWNTO 15);
  o_data_mod_Q3  <= S_data_mod_Q3_24bit(22 DOWNTO 15);
  o_data_mod_I4  <= S_data_mod_I4_24bit(22 DOWNTO 15);
  o_data_mod_Q4  <= S_data_mod_Q4_24bit(22 DOWNTO 15);
  o_data_mod_I5  <= S_data_mod_I5_24bit(22 DOWNTO 15);
  o_data_mod_Q5  <= S_data_mod_Q5_24bit(22 DOWNTO 15);
  o_data_mod_I6  <= S_data_mod_I6_24bit(22 DOWNTO 15);
  o_data_mod_Q6  <= S_data_mod_Q6_24bit(22 DOWNTO 15);
  o_data_mod_I7  <= S_data_mod_I7_24bit(22 DOWNTO 15);
  o_data_mod_Q7  <= S_data_mod_Q7_24bit(22 DOWNTO 15);
  o_data_mod_I8  <= S_data_mod_I8_24bit(22 DOWNTO 15);
  o_data_mod_Q8  <= S_data_mod_Q8_24bit(22 DOWNTO 15);
  o_data_mod_I9  <= S_data_mod_I9_24bit(22 DOWNTO 15);
  o_data_mod_Q9  <= S_data_mod_Q9_24bit(22 DOWNTO 15);
  o_data_mod_I10 <= S_data_mod_I10_24bit(22 DOWNTO 15);
  o_data_mod_Q10 <= S_data_mod_Q10_24bit(22 DOWNTO 15);
  o_data_mod_I11 <= S_data_mod_I11_24bit(22 DOWNTO 15);
  o_data_mod_Q11 <= S_data_mod_Q11_24bit(22 DOWNTO 15);
  o_data_mod_I12 <= S_data_mod_I12_24bit(22 DOWNTO 15);
  o_data_mod_Q12 <= S_data_mod_Q12_24bit(22 DOWNTO 15);
  o_data_mod_I13 <= S_data_mod_I13_24bit(22 DOWNTO 15);
  o_data_mod_Q13 <= S_data_mod_Q13_24bit(22 DOWNTO 15);
  o_data_mod_I14 <= S_data_mod_I14_24bit(22 DOWNTO 15);
  o_data_mod_Q14 <= S_data_mod_Q14_24bit(22 DOWNTO 15);
  o_data_mod_I15 <= S_data_mod_I15_24bit(22 DOWNTO 15);
  o_data_mod_Q15 <= S_data_mod_Q15_24bit(22 DOWNTO 15);
END Behavioral;