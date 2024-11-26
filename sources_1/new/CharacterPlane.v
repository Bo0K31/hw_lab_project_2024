`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.11.2024 20:33:07
// Design Name: 
// Module Name: CharacterPlane
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


module CharacterPlane(
    data_out,
    row_out,
    column_out,
    data_in,
    row_in,
    column_in,
    we,
    clock
    );
    
    localparam ROW_NUMBER = 16; // number of lines
    localparam COL_NUMBER = 32; // number of character in each line
    localparam CHAR_ID_LENGTH = 8; // lenght of the character id
    
    localparam ROW_BIT_LEN = 4; // bit len of row(set this to upper(log_2(ROW_NUMBER)))
    localparam COL_BIT_LEN = 5; // bit len of col(set this to upper(log_2(COL_NUMBER))
    
    localparam MEM_SIZE = ROW_NUMBER * COL_NUMBER;
    localparam DATA_SIZE = CHAR_ID_LENGTH;
    
    output reg [DATA_SIZE - 1:0] data_out;
    input wire [ROW_BIT_LEN - 1:0] row_out;
    input wire [COL_BIT_LEN - 1:0] column_out;
    input wire [DATA_SIZE - 1:0] data_in;
    input wire [ROW_BIT_LEN - 1:0] row_in;
    input wire [COL_BIT_LEN - 1:0] column_in;
    input wire we;
    input wire clock;
    
    reg [DATA_SIZE - 1:0] mem [MEM_SIZE - 1:0];
    
    always@(row_out or column_out) begin
        data_out <= mem[{{COL_BIT_LEN{1'b0}},row_out} * COL_NUMBER + column_out];
    end
    
    always@(posedge clock) begin
        if(we == 1) begin
            mem[{{COL_BIT_LEN{1'b0}},row_in} * COL_NUMBER + column_in] <= data_in;
        end
    end    
    
endmodule
