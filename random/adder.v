module adder(a,b,cin,sum,cout);

input   [3:0] a,b;
input         cin;
output  [3:0] sum;
output        cout;

FullAdder FA1(a[0],b[0],cin,sum[0],cout1);
FullAdder FA2(.x(a[1]),.y(b[1]),.cin(cout1),.sum(sum[1]),.cout(cout2));
FullAdder FA3(.x(a[2]),.y(b[2]),.cin(cout2),.sum(sum[2]),.cout(cout3));
FullAdder FA4(.x(a[3]),.y(b[3]),.cin(cout3),.sum(sum[3]),.cout(cout));

endmodule