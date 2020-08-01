-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
-- Date        : Tue Jul 28 15:06:32 2020
-- Host        : DESKTOP-22NNMJE running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               d:/Users/onuong/LowFilter/LowFilter.srcs/sources_1/ip/Driver_ADC_0/Driver_ADC_0_stub.vhdl
-- Design      : Driver_ADC_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7s15ftgb196-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Driver_ADC_0 is
  Port ( 
    clk_100MHz : in STD_LOGIC;
    clk_system : in STD_LOGIC;
    Rst : in STD_LOGIC;
    ADC_Data : in STD_LOGIC_VECTOR ( 7 downto 0 );
    Read_Addr : in STD_LOGIC_VECTOR ( 17 downto 0 );
    Trigger_Gate : in STD_LOGIC_VECTOR ( 7 downto 0 );
    Period : out STD_LOGIC_VECTOR ( 17 downto 0 );
    clk_ADC : out STD_LOGIC;
    ADC_En : out STD_LOGIC;
    ADC_Data_Out : out STD_LOGIC_VECTOR ( 7 downto 0 )
  );

end Driver_ADC_0;

architecture stub of Driver_ADC_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk_100MHz,clk_system,Rst,ADC_Data[7:0],Read_Addr[17:0],Trigger_Gate[7:0],Period[17:0],clk_ADC,ADC_En,ADC_Data_Out[7:0]";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "Driver_ADC,Vivado 2018.3";
begin
end;
