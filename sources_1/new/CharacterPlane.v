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
    dout,
    rout,
    cout,
    din,
    rin,
    cin,
    we,
    reset,
    s,
    clk
    );
    
    localparam ROW_NUMBER = 7; // number of lines
    localparam COL_NUMBER = 20; // number of character in each line
    localparam CHAR_ID_LENGTH = 8; // lenght of the character id
    
    localparam ROW_BIT_LEN = 4; // bit len of row(set this to upper(log_2(ROW_NUMBER)))
    localparam COL_BIT_LEN = 6; // bit len of col(set this to upper(log_2(COL_NUMBER))
    
    localparam MEM_SIZE = ROW_NUMBER * COL_NUMBER;
    localparam DATA_SIZE = CHAR_ID_LENGTH;
    
    output reg [DATA_SIZE - 1:0] dout;
    input wire [ROW_BIT_LEN - 1:0] rout;
    input wire [COL_BIT_LEN - 1:0] cout;
    input wire [DATA_SIZE - 1:0] din;
    input wire [ROW_BIT_LEN - 1:0] rin;
    input wire [COL_BIT_LEN - 1:0] cin;
    input wire we;
    input wire reset;
    input wire s;
    input wire clk;
    
    reg [DATA_SIZE - 1:0] mem [0:MEM_SIZE - 1];
    
    initial begin
        dout = 129;
    end
    
    genvar i,j;
    generate 
        for(i=0;i<ROW_NUMBER;i=i+1) begin
            for (j=0;j<COL_NUMBER;j=j+1) begin
                initial begin
                    mem[{{COL_BIT_LEN{1'b0}},i} * COL_NUMBER + j] = 129;
                end
            end
        end 
    endgenerate
    
    always@(rout or cout) begin
        dout <= mem[{{COL_BIT_LEN{1'b0}},rout} * COL_NUMBER + cout];
    end
    
    always@(negedge clk) begin
       if(we == 1 && reset == 0 && s == 0) begin
            if(din == 8'b11111111) begin
                mem[{{COL_BIT_LEN{1'b0}},rin} * COL_NUMBER + cin] = 129;
            end
            else begin
                mem[{{COL_BIT_LEN{1'b0}},rin} * COL_NUMBER + cin] = din;
            end
       end
       else if(we == 1 && reset == 0 && s == 1) begin
            mem[{{COL_BIT_LEN{1'b0}},ROW_NUMBER - 1} * COL_NUMBER] = din;
       end
    end
    
endmodule