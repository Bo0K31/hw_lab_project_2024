`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.12.2024 13:06:33
// Design Name: 
// Module Name: CharacterIdEncoder
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


module CharacterIdEncoder(
    character_id,
    data_in,
    we,
    clock
    );
    
    localparam CHAR_ID_LENGTH_OUT_IN = 8;
    localparam CHAR_ID_LENGTH_OUT = 8;
    
    output reg [CHAR_ID_LENGTH_OUT - 1:0] character_id;
    input wire [CHAR_ID_LENGTH_OUT_IN - 1:0] data_in;
    input wire we;
    input wire clock;
    
    initial begin
        character_id = 8'b11111111;
    end
    
    always@(posedge clock) begin
        if(we) begin
            if(data_in >= 48 && data_in <= 57) begin
                character_id <= data_in - 48 + 0;
            end
            else if(data_in >= 65 && data_in <= 90) begin
                character_id <= data_in - 65 + 10;
            end
            else if(data_in >= 97 && data_in <= 122) begin
                character_id <= data_in - 97 + 36;
            end
            else if(data_in >= 128 && data_in <= 195) begin
                character_id <= data_in - 128 + 62;
            end
            else begin
                character_id <= 129;
            end
        end
    end
    
endmodule
