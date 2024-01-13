`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.01.2024 23:14:34
// Design Name: 
// Module Name: des
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


module des(
    input clk,
    input load,
    input ena,
    input [1:0] amount,
    input [63:0] data,
    output reg [63:0] q 
    );
    integer i;reg temp;
    always @ (posedge clk) begin
    if(load)
    q<=data;
    else if(ena) begin
    if(amount==0) begin
    for(i=63;i>0;i=i-1) begin
    q[i]=q[i-1]; end
    q[0]<=0;
    end
    else if(amount==1) begin
    for(i=63;i>7;i=i-1) begin
    q[i]=q[i-8]; end
    for(i=7;i>=0;i=i-1) begin
    q[i]=0;
    end
    end
    else if(amount==2) begin
    for(i=0;i<63;i=i+1) begin
    q[i]=q[i+1];
    end
    end
    else if(amount==3) begin
    for(i=0;i<56;i=i+1) begin
    q[i]=q[i+8];
    end
    for(i=56;i<63;i=i+1) begin
    q[i]=q[63]; end
    end
    end
    end
endmodule
