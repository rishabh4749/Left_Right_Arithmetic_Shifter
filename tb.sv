`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.01.2024 23:34:39
// Design Name: 
// Module Name: tb
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


module tb(

    );
    reg clk,load,ena; reg [1:0] amount; reg [63:0] data;
    wire [63:0] q;
    des dut(.clk(clk),.load(load),.ena(ena),.amount(amount),.data(data),.q(q));
    always #5 clk=~clk;
    initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
    $monitor("time=%t load=%b ena=%b amount=%b data=%b q=%b",$time,load,ena,amount,data,q);
    clk<=0;
    #4;
    load<=1;
    data<=738838386;
    amount<=0;
    ena<=0;
    #9;
    load<=0;
    amount<=3;
    ena<=1;
    #10 $finish;
    end
endmodule
