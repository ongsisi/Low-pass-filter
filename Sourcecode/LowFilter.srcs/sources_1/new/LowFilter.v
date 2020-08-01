`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/07/28 15:43:54
// Design Name: 
// Module Name: LowFilter
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module LowFilter(
    input clk,
    input [7:0]wave_in,
    input Rst,
    output clk_ADC,
    output clk_DAC,
    output ADC_En,
    output DAC_Sync,
    output DAC_Din
    );
    
    wire [15:0]fir_out;
    wire [7:0]ADC_Data_Out;      //Storage signal output
    wire [15:0]Read_Addr;        //Read signal address
    wire clk_system;
    
    clk_wiz_1 clk_sum
   (
    // Clock out ports
    .clk_15(clk_ADC),     // output clk_15
    .clk_148_1(clk_DAC),     // output clk_148_1
    .clk_148_2(clk_system),     // output clk_148_2
   // Clock in ports
    .clk_in1(clk));      // input clk_in1
    
Fir fir_LF1000Hz(
    .CLK(clk),
    .FIR_IN(ADC_Data_Out),
    .RSTn(Rst),
    .FIR_OUT(fir_out),
    .Addr_Out(Read_Addr)
);
DAC_Driver DAC_Driver(
    .clk_DAC(clk_DAC),
    .DAC_Data(fir_out),
    .DAC_Din(DAC_Din),
    .DAC_Sync(DAC_Sync)
);
ADC_Driver ADC_Driver(
    .clk_ADC(clk_ADC),
    .clk_system(clk_system),
    .ADC_Data(wave_in),
    .Rst(Rst),
    .Read_Addr(Read_Addr),
    .ADC_En(ADC_En),
    .ADC_Data_Out(ADC_Data_Out)       
    );
endmodule
