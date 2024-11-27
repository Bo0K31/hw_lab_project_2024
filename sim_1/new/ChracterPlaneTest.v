`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.11.2024 09:13:01
// Design Name: 
// Module Name: ChracterPlaneTest
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


module ChracterPlaneTest(

    );
    wire [3:0] row;
    wire [4:0] column;
    wire [7:0] character_id;
    reg [3:0] _row;
    reg [4:0] _column;
    reg [7:0] _character_id;
    
    reg [3:0] a;
    reg [4:0] b;
    reg [7:0] c;
    
    CharacterPlane characterPlane(character_id,row,column,_character_id,_row,_column,0,0);
    
    assign row = a;
    assign column = b;
    always@(row, column, character_id) begin
        c <= character_id;
    end
    
    initial begin
        #0; a = 0; b = 0;
        #10; a = 1; b = 0;
        #10; a = 2; b = 0;
        #10; a = 3; b = 0;
        #10; a = 0; b = 1;
        #10; a = 0; b = 2;
        #10; a = 0; b = 3;
        #10; a = 0; b = 0;
        #10; $finish;
    end
endmodule
