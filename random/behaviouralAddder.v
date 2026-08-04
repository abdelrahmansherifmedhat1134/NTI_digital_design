module adder_behav(x,y,sum,cout);
input   [3:0] x,y;
output  [3:0] sum;
output        cout;

wire [4:0]temp;
assign temp = x+y;
assign cout = temp[4];
assign sum = temp[3:0];


endmodule