`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/07/30 11:02:38
// Design Name: 
// Module Name: testbeach
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


module testbeach( );
reg CLK;
reg [7:0] FIR_IN;
reg RSTn;
reg [7:0] mem[1:4096];                                          
wire [15:0] FIR_OUT=0;
reg [11:0] i;
wire clk_wave;

//wire clk_w;
 //例化FIR滤波器
LowFilter LF1 (
    .clk(CLK),
    .wave_in(FIR_IN),
    .Rst(RSTn),
    .clk_ADC(),
    .clk_DAC(),
    .ADC_En(),
    .DAC_Sync(),
    .DAC_Din()
);
//WaveGenerator wave1(
//    .clk(CLK),
//    .Rst(RSTn),
//    .Addr(Addr)
//);
//Wave_in Wave (
//  .clka(CLK),    // input wire clka
//  .ena(1),      // input wire ena
//  .addra(Addr),  // input wire [11 : 0] addra
//  .douta(FIR_IN)  // output wire [7 : 0] douta
//);
parameter Freq=10000;                    //Goal 10k    
reg [30:0]FWORD = 50000000/(Freq); 
Clk_Division_1 clk_creat_wave (
  .clk_100MHz(CLK),  // input wire clk_100MHz
  .clk_mode(FWORD),      // input wire [30 : 0] clk_mode
  .clk_out(clk_wave)        // output wire clk_out
);
initial                                               
       begin 
                     $readmemh("D:/Users/onuong/LowFilter/Sin_Wave_Rom.txt",mem);//将待滤波信号读入mem
                     RSTn= 0;
                     CLK= 0;
                     #10;RSTn= 1;

       end  
       
initial
       forever
          #10 CLK = ~CLK;//时钟生成，注意与采样率一致
 
always@(posedge CLK or negedge RSTn) 
      if(!RSTn)                                
          FIR_IN <= 8'b0 ;
       else
          FIR_IN <= mem[i];     //读入数据
always@(posedge clk_wave or negedge RSTn) 
      if(!RSTn)
         i <= 12'd0;
       else
         i <= i + 1'd1;
endmodule
