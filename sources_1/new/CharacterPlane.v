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
    reset,
    push_up,
    clock
    );
    
    localparam ROW_NUMBER = 15; // number of lines
    localparam COL_NUMBER = 40; // number of character in each line
    localparam CHAR_ID_LENGTH = 8; // lenght of the character id
    
    localparam ROW_BIT_LEN = 4; // bit len of row(set this to upper(log_2(ROW_NUMBER)))
    localparam COL_BIT_LEN = 6; // bit len of col(set this to upper(log_2(COL_NUMBER))
    
    localparam MEM_SIZE = ROW_NUMBER * COL_NUMBER;
    localparam DATA_SIZE = CHAR_ID_LENGTH;
    
    output reg [DATA_SIZE - 1:0] data_out;
    input wire [ROW_BIT_LEN - 1:0] row_out;
    input wire [COL_BIT_LEN - 1:0] column_out;
    input wire [DATA_SIZE - 1:0] data_in;
    input wire [ROW_BIT_LEN - 1:0] row_in;
    input wire [COL_BIT_LEN - 1:0] column_in;
    input wire we;
    input wire reset;
    input wire push_up;
    input wire clock;
    
    reg [DATA_SIZE - 1:0] mem [0:MEM_SIZE - 1];
    
    initial begin
        data_out = 129;
    end
    
    genvar r,c;
    generate 
        for(r=0;r<ROW_NUMBER;r=r+1) begin
            for (c=0;c<COL_NUMBER;c=c+1) begin
                initial begin
                    mem[{{COL_BIT_LEN{1'b0}},r} * COL_NUMBER + c] = 129;
                end
            end
        end 
    endgenerate
    
//    generate 
//        for(r=0;r<ROW_NUMBER;r=r+1) begin
//            for (c=0;c<COL_NUMBER;c=c+1) begin
//                always@(negedge clock) begin
//                    if(reset == 1 && we == 1) begin
//                        mem[{{COL_BIT_LEN{1'b0}},r} * COL_NUMBER + c] = 11;
//                    end;
//                end
//            end
//        end
//    endgenerate
    
//    generate 
//        for(r=1;r<ROW_NUMBER;r=r+1) begin
//            for (c=0;c<COL_NUMBER;c=c+1) begin
//                always@(negedge clock) begin
//                    if(we == 1 && push_up == 1 && reset == 0) begin
//                        mem[{{COL_BIT_LEN{1'b0}},r - 1} * COL_NUMBER + c] <= mem[{{COL_BIT_LEN{1'b0}},r} * COL_NUMBER + c];
//                    end
//                end
//            end
//        end
//    endgenerate
//    generate 
//        for (c=1;c<COL_NUMBER;c=c+1) begin
//            always@(negedge clock) begin
//                if(we == 1 && push_up == 1 && reset == 0) begin
//                    mem[{{COL_BIT_LEN{1'b0}},ROW_NUMBER - 1} * COL_NUMBER + c] <= 0;
//                end
//            end
//        end
//    endgenerate
    
    always@(row_out or column_out) begin
        data_out <= mem[{{COL_BIT_LEN{1'b0}},row_out} * COL_NUMBER + column_out];
    end
    
    always@(negedge clock) begin
       if(we == 1 && reset == 0 && push_up == 0) begin
            if(data_in == 8'b11111111) begin
                mem[{{COL_BIT_LEN{1'b0}},row_in} * COL_NUMBER + column_in] = 129;
            end
            else begin
                mem[{{COL_BIT_LEN{1'b0}},row_in} * COL_NUMBER + column_in] = data_in;
            end
       end
       else if(we == 1 && reset == 0 && push_up == 1) begin
            mem[{{COL_BIT_LEN{1'b0}},ROW_NUMBER - 1} * COL_NUMBER] = data_in;
       end
    end
    
endmodule