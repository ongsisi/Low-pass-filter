`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/07/30 13:48:33
// Design Name: 
// Module Name: WaveGenerator
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


module WaveGenerator(
    input clk,
    input Rst,
    output reg[7:0]Addr
    );
    wire clk_Freq;    //采样频率10000对应的时钟信号
    parameter Freq=10000;                    //Goal 10k    
    reg [30:0]FWORD = 100000000/(Freq*256); 
    
Clk_Division_0 CLK_F (
  .clk_100MHz(clk),  // input wire clk_100MHz
  .clk_mode(FWORD),      // input wire [30 : 0] clk_mode
  .clk_out(clk_Freq)        // output wire clk_out
);
   always @ (posedge clk_Freq or negedge Rst)
        begin
            if (!Rst)
                Addr <= 0;  
            else
                Addr <= Addr + 1;   
        end 
    //Assign the upper eight bits of the accumulator's address to the output address (the address of the ROM)
endmodule
