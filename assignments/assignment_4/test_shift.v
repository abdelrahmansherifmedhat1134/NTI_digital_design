module test_shift; 
wire signed [3:0] a = 4'sb1010;  
wire signed [7:0] result; 
assign result = $signed({2{a}}) >>> 2;  
//or we can do it like that 
// assign result =
{{2{a[3]}},{2{a}}};
initial begin 
$display ("Result: %b", result); // Display the result in binary format 
end 
endmodule 

