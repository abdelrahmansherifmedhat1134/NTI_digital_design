/*
o inputs:  
▪ clk (1-bit). 
▪ read_addr (3-bit). 
▪ write_addr (3-bit). 
▪ write_data (16-bit).  
▪ we (write enable, 1-bit). 
o output:  
▪ read_data (16-bit reg). 
o A memory (array) named register_file that contains 8 elements, where each 
element is a 16-bit vector. 
*/
module reg_file (
    input         clk,
    input  [2:0]  read_addr,
    input  [2:0]  write_addr,
    input  [15:0] write_data,
    input         we,
    output [15:0] read_data,
    output [7:0]  read_data_top_byte
);
reg [15:0] register_file[0:8] ; 

always @(posedge clk) begin
    if(we) begin
        register_file[write_addr] = write_data; 
    end
end

assign read_data = register_file[read_data] ;
assign read_data_top_byte = register_file[read_data][15 -: 8];


endmodule