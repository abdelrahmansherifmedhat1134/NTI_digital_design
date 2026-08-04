/*
input       clk,
    input       Rst,
    input       oe,
    input       endian_swap,
    input [1:0] row_addr,
    input       col_addr,
    
    output [word_width-1:0] processing_word,

    inout [7:0] bus_data 
*/
`timescale 1ns/1ps
module tb#(parameter word_width_tb=32)();
reg clk_tb, Rst_tb, oe_tb, endian_swap_tb,col_addr_tb ;
reg [1:0] row_addr_tb ;
wire [7:0] bus_data_tb ;
wire [7:0] fabric_mem_tb[0:3][0:1] ;
wire [word_width_tb-1:0] processing_word_tb ;


grid_mem_router #(.word_width(word_width_tb)) dut(clk_tb, Rst_tb, oe_tb, endian_swap_tb, row_addr_tb, col_addr_tb, processing_word_tb, bus_data_tb) ;

initial begin
    clk_tb=0 ;
    forever #10 clk_tb=~clk_tb ;
end

initial begin
    $monitor("Time=%0t | Rst=%b oe=%b row=%b col=%b swap=%b | bus_data=%h proc_word=%h", 
                 $time, Rst_tb, oe_tb, row_addr_tb, col_addr_tb, endian_swap_tb, bus_data_tb, processing_word_tb);
    
    oe_tb = 0 ;
    endian_swap_tb = 0 ;
    col_addr_tb = 1 ;
    row_addr_tb = 2'd0 ; 
    Rst_tb = 1 ;
    
    #25 ;

    Rst_tb = 0 ;
    
    @(posedge clk_tb)begin
        oe_tb = 1;
        row_addr_tb = 2'd1 ;
        
        #40 ;

        endian_swap_tb = 1 ;
        row_addr_tb = 2'd2 ;
    
        #40 ;
    end
    $finish ;
end
endmodule