`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.11.2024 20:02:30
// Design Name: 
// Module Name: Feeder
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


module Feeder(
    pop,
    stack_empty,
    load,
    load_finish,
    draw_finish,
    clock
    );
    
    output reg pop;
    input wire stack_empty;
    output reg load;
    input wire load_finish;
    input wire draw_finish;
    input wire clock;
    
    reg [1:0] stage;
    
    always@(posedge clock) begin
        pop = 0;
        if(stage == 0 && stack_empty == 0) begin
            pop = 1;
            load = 1;
            stage = stage + 1;
        end
        else if(stage == 1 && load_finish) begin
            load = 0;
            stage = stage + 1;
        end
        else if(stage == 2 && draw_finish) begin
            stage = 0;
        end
    end
    
endmodule
