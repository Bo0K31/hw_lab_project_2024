`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.11.2024 10:12:25
// Design Name: 
// Module Name: System
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


module System(
    output wire vgaRed[15:0],
    output wire vgaGreen[15:0],
    output wire vgaBlue[15:0],
    output wire Hsync,
    output wire Vsync,
    input wire clock
    );
    
    wire reset = 0;
    
    
endmodule
