`timescale 1ns / 1ps

module CharController(
    input wire [7:0] idi,
    input wire we,
    input wire clk,
    output reg [7:0] ido,
    output reg [5:0] c,
    output reg [3:0] r,
    output reg s,
    output reg reset
    );
    
    reg [9:0] p;
    
    initial begin
        reset = 0;
        s = 0;
        p = 0;
        ido = 0;
        c = 0;
        r = 0;
    end
    
    always@(posedge clk) begin
        if(we) begin
            if(idi == 8'b11111111) begin
                reset = 1;
                r = 0;
                c = 0;
                p = 0;
            end
            else begin
                p = p + 1;
                r = p / 20;
                c = p % 20;
                reset = 0;
                if(p == 140) begin
                    p = 0;
                    s = 1;
                end
                else begin
                    s = 0;
                end
            end
        end
        else begin
            s = 0;
            reset = 0;
        end

        if(idi >= 48 && idi <= 57) begin
            ido <= idi - 48;
        end
        else if(idi >= 65 && idi <= 90) begin
            ido <= idi - 55;
        end
        else if(idi >= 97 && idi <= 122) begin
            ido <= idi - 61;
        end
        else if(idi >= 128 && idi <= 195) begin
            ido <= idi - 66;
        end
        else if(idi == 8'b11111111) begin
            ido <= 8'b11111111;
        end
        else begin
            ido <= 128;
        end
    end
endmodule