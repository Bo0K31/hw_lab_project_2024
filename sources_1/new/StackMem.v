`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.11.2024 15:03:00
// Design Name: 
// Module Name: StackMem
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


module StackMem(
    out_data,
    out_address,
    in_data,
    in_address,
    we,
    clock
    );
    
    parameter DATA_WIDTH = 12;
    parameter ADDR_WIDTH = 8;
    
    output reg [DATA_WIDTH-1:0]out_data;
    output reg [DATA_WIDTH-1:0]in_data;
    input wire clock;
    input wire [ADDR_WIDTH-1:0]in_address;
    input wire [ADDR_WIDTH-1:0]out_address;
    input wire we;
    reg	[DATA_WIDTH-1:0] mem [0:(1<<ADDR_WIDTH)-1];
    
    always@(posedge clock) begin
        if(we) begin
            mem[in_address] <= in_data;
        end
        out_data <= mem[out_address];
    end
    
endmodule
