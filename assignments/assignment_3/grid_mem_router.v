/*
o inputs:  
▪ clk: 1-bit. 
▪ Rst: 1-bit (Asynchronous active high) 
▪ oe: 1-bit output enable. 
▪ endian_swap: 1-bit control.  
▪ row_addr: 2-bit. 
▪ col_addr: 1-bit. 
o outputs:  
▪ processing_word: 32-bit. 
o Internal Storage: 
▪ Declare a 2-D memory named fabric_mem that contains 4 rows and            
2 columns. Each addressable location in this memory must hold 8 bits.
*/

module grid_mem_router #(parameter word_width=32)
(
    input       clk,
    input       Rst,
    input       oe,
    input       endian_swap,
    input [1:0] row_addr,
    input       col_addr,
    
    output reg [word_width-1:0] processing_word,

    inout [7:0] bus_data 
);

wire [7:0] fabric_mem[0:3][0:1];

assign fabric_mem[0][1] = 8'hAA ; 
assign fabric_mem[1][1] = 8'hBB ; 
assign fabric_mem[2][1] = 8'hCC ; 
assign fabric_mem[3][1] = 8'hDD ; 

assign fabric_mem[1][0] = 8'hFF ;
assign fabric_mem[2][0] = 8'hEE ;

assign bus_data = oe ? fabric_mem[row_addr][col_addr] : 8'bz ;

integer i ;

always @(posedge clk or posedge Rst) begin
    if(Rst)begin
        processing_word <= {word_width{1'b0}} ;  
    end
    else begin
        for(i=0;i<(word_width/8);i=i+1) begin
        if(!endian_swap) begin
            processing_word[i*8 +: 8] <= fabric_mem[i][1] ;
        end
        else begin
            processing_word[(word_width-1)-i*8 -: 8] <= fabric_mem[i][1] ;
        end
        end  
    end
end

    

endmodule //grid_mem_router