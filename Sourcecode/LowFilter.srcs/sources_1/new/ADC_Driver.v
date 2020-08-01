`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/07/29 14:33:39
// Design Name: 
// Module Name: ADC_Driver
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


module ADC_Driver(
    input clk_ADC,
    input clk_system,
    input [7:0]ADC_Data,
    input Rst,
    input [15:0]Read_Addr,
    output ADC_En,
    output [7:0]ADC_Data_Out       
    );
    //Number of samples
    parameter Sampling_Num=38400;
    //ADC, address counter
    reg [15:0]Addr_Cnt=0;
    //Actual read address
    reg[15:0]Addr_Read_Real=0;
    //ADC enable signal connection
    assign ADC_En=~Rst;
    //ADC address count
    always@(posedge clk_ADC or negedge Rst)
        begin
            //Low level reset
            if(!Rst)
                Addr_Cnt<=0;
            else if(Addr_Cnt==Sampling_Num-1)
                Addr_Cnt<=0;
            else
                Addr_Cnt<=Addr_Cnt+1;           
        end
Wave_Ram storage_WavaData (
  .clka(clk_ADC),    // input wire clka
  .wea(Rst),      // input wire [0 : 0] wea
  .addra(Addr_Cnt),  // input wire [15 : 0] addra
  .dina(ADC_Data),    // input wire [7 : 0] dina
  .clkb(clk_system),    // input wire clkb
  .enb(1),      // input wire enb
  .addrb(Read_Addr),  // input wire [15 : 0] addrb
  .doutb(ADC_Data_Out)  // output wire [7 : 0] doutb
);        
endmodule
