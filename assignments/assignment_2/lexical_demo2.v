`timescale 1ns/1ns
module lexical_demo();

//this is a one lined comment 
/*
.....
.....
this is a multi line block comment
.....
.....
*/

(*keep*) wire [16:0] net1; //to keep this net and prevent its removal during optimization
(*keep*) wire [16:0] net2;
(*multstyle="dsp"*) wire [31:0] result; //use specific multiplication hardware block
assign result = net1*net2 ; 

reg [3:0] Counter ;
reg [3:0] counter ;

initial begin
    $display("Counter  |  counter");
    $monitor("   %d   |    %d    ",Counter,counter);

    Counter = 1'b0 ;
    counter = 1'b1 ;
    #10 ;
    Counter = 4'hf ;
    counter = -3'sd3 ;
    #10 ;
end
endmodule