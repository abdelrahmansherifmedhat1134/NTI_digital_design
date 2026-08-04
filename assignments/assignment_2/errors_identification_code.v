module first_reset_sync ( //module name should not start with a number
                          //module is a lower case keyword  
input wire clk,
input wire async_rst_n,
output reg sync_rst_n
);
/* This block comment explains the module
The clock is active high 
and reset is active low  
*/
// Internal registers for the 2-stage synchronizer
reg Sync_reg;
reg Meta_reg;
(*preserve*) reg sync_reg; //attributes should be written between (*   *)
// Define a delay parameter using an invalid base format
parameter DELAY = 8'd15 ; //numbers can have underscores in the middle for readability but not in start or end 
parameter MAX_VAL = 4'b1011; //binary digits cant contain except 1's and 0's
always @(posedge clk or negedge async_rst_n) begin
if (!async_rst_n) begin
Meta_reg <= 1'b0; //verilog is case senstive
Sync_reg <= 1'b0; //undefined variable 
end else begin
Meta_reg <= 1'B1;
Sync_reg <= Meta_reg;
end
end
// Drive the output //for one lined comment you should use // or you could use /* ... */
assign sync_rst_n = sync_reg;
endmodule //endmodule is one keyword