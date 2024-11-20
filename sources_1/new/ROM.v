`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.11.2024 11:58:10
// Design Name: 
// Module Name: ROM
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


module ROM(
    data,
    address
    );
    parameter DATA_WIDTH=32;
    parameter ADDR_WIDTH=12;
    
    output [DATA_WIDTH-1:0]data;
    input [ADDR_WIDTH-1:0]address;
    
    reg	[DATA_WIDTH-1:0]mem[0:1<<ADDR_WIDTH -1];
    
    assign data=mem[address];
    
    initial begin
    $readmemb("memory.mem",mem);
    end
endmodule
