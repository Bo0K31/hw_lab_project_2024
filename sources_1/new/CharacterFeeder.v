`timescale 1ns / 1ps

module CharacterFeeder(
    ido,
    idi,
    r,
    c,
    s,
    reset,
    we,
    clk
    );
    
    localparam ROW_NUMBER = 7; // number of lines
    localparam COL_NUMBER = 20; // number of character in each line
    
    localparam TOTAL_CHAR_NUM = ROW_NUMBER * COL_NUMBER;
    
    localparam ROW_BIT_LEN = 4; // bit len of row(set this to upper(log_2(ROW_NUMBER)))
    localparam COL_BIT_LEN = 6; // bit len of col(set this to upper(log_2(COL_NUMBER))
    localparam CHAR_ID_LEN = 8;
    
    localparam p_LEN = ROW_BIT_LEN + COL_BIT_LEN;
    
    output reg [CHAR_ID_LEN - 1:0] ido;
    input wire [CHAR_ID_LEN - 1:0] idi;
    output reg [ROW_BIT_LEN - 1:0] r;
    output reg [COL_BIT_LEN - 1:0] c;
    output reg s;
    output reg reset;
    input wire we;
    input wire clk;
    
    reg [p_LEN - 1:0] p;
    
    initial begin
        p = 0;
        ido = 0;
        s = 0;
        r = 0;
        c = 0;
        reset = 0;
    end 
    
    always@(posedge clk) begin
        if(idi >= 48 && idi <= 57) begin
            ido <= idi - 48 + 0;
        end
        else if(idi >= 65 && idi <= 90) begin
            ido <= idi - 65 + 10;
        end
        else if(idi >= 97 && idi <= 122) begin
            ido <= idi - 97 + 36;
        end
        else if(idi >= 128 && idi <= 195) begin
            ido <= idi - 128 + 62;
        end
        else if(idi == 8'b11111111) begin
            ido <= 8'b11111111;
        end
        else begin
            ido <= 128;
        end
    
        if(we) begin
            if(idi == 8'b11111111) begin
                p = 0;
                r = 0;
                c = 0;
                reset = 1;
            end
            else begin
                p = p + 1;
                reset = 0;
                r = p / COL_NUMBER;
                c = p % COL_NUMBER;
                if(p == TOTAL_CHAR_NUM) begin
                    p = TOTAL_CHAR_NUM - COL_NUMBER;
                    s = 1;
                end
                else begin
                    s = 0;
                end
            end
        end
        else begin
            reset = 0;
            s = 0;
        end
    end
endmodule