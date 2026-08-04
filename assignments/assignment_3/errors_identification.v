module memory_ctrl ( 
    input [7:0] data_in,  
    output reg [15:0] addr_bus,//use one syntax for vector range ordering  
    inout data_bus, 
    input wire clk 
    ); 
wire [31:0] full_word; 
reg [7:0] grid_mem [0:3][0:1]; 
wire [4:0] start_idx; //since variable is used on the RHS in procedural block it doesnt need to be reg
always @(*) begin 
// Operation A 
grid_mem[0][1] = 8'hFF;  
// Operation B 
grid_mem[0][2][7:0] = 8'h00; //you cannot assign data  to a slice of array elements  
//it should be to a specific element 
// Operation C 
addr_bus[3:0] = full_word[start_idx +: 4];  //index order must be as assign order
//used constant part select using a variable while you should be using variable part select  
end 
endmodule 