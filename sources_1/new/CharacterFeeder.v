`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.12.2024 13:39:53
// Design Name: 
// Module Name: CharacterFeeder
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


module CharacterFeeder(
    character_id_out,
    character_id_in,
    row_out,
    col_out,
    push_up,
    reset_call,
    we,
    clock
    );
    
    localparam ROW_NUMBER = 15; // number of lines
    localparam COL_NUMBER = 40; // number of character in each line
    
    localparam TOTAL_CHAR_NUM = ROW_NUMBER * COL_NUMBER;
    
    localparam ROW_BIT_LEN = 4; // bit len of row(set this to upper(log_2(ROW_NUMBER)))
    localparam COL_BIT_LEN = 6; // bit len of col(set this to upper(log_2(COL_NUMBER))
    localparam CHAR_ID_LEN = 8;
    
    localparam COUNTER_LEN = ROW_BIT_LEN + COL_BIT_LEN;
    
    output reg [CHAR_ID_LEN - 1:0] character_id_out;
    input wire [CHAR_ID_LEN - 1:0] character_id_in;
    output reg [ROW_BIT_LEN - 1:0] row_out;
    output reg [COL_BIT_LEN - 1:0] col_out;
    output reg push_up;
    output reg reset_call;
    input wire we;
    input wire clock;
    
    reg [COUNTER_LEN - 1:0] counter;
    
    initial begin
        counter = 0;
        character_id_out = 0;
        push_up = 0;
        row_out = 0;
        col_out = 0;
        reset_call = 0;
    end 
    
    always@(posedge clock) begin
        if(character_id_in >= 48 && character_id_in <= 57) begin
            character_id_out <= character_id_in - 48 + 0;
        end
        else if(character_id_in >= 65 && character_id_in <= 90) begin
            character_id_out <= character_id_in - 65 + 10;
        end
        else if(character_id_in >= 97 && character_id_in <= 122) begin
            character_id_out <= character_id_in - 97 + 36;
        end
        else if(character_id_in >= 128 && character_id_in <= 195) begin
            character_id_out <= character_id_in - 128 + 62;
        end
        else if(character_id_in == 8'b11111111) begin
            character_id_out <= 8'b11111111;
        end
        else begin
            character_id_out <= 128;
        end
    
        if(we) begin
            if(character_id_in == 8'b11111111) begin
                counter = 0;
                row_out = 0;
                col_out = 0;
                reset_call = 1;
            end
            else begin
                counter = counter + 1;
                reset_call = 0;
                row_out = counter / COL_NUMBER;
                col_out = counter % COL_NUMBER;
                if(counter == TOTAL_CHAR_NUM) begin
                    counter = TOTAL_CHAR_NUM - COL_NUMBER;
                    push_up = 1;
                end
                else begin
                    push_up = 0;
                end
            end
        end
        else begin
            reset_call = 0;
            push_up = 0;
        end
    end
endmodule