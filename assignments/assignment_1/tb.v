`timescale  1ns/1ns


module tb;


reg a_tb, b_tb, cin_tb ;
wire gate_sum,gate_cout;
wire structural_sum,structural_cout;
wire behavioral_sum,behavioral_cout; 


 gate_level_adder u1_tb
(
    .a(a_tb),
    .b(b_tb),
    .cin(cin_tb),
    .sum(gate_sum),
    .cout(gate_cout)
);

structural_adder u2_tb
(
    .a(a_tb),
    .b(b_tb),
    .cin(cin_tb),
    .sum(structural_sum),
    .cout(structural_cout)
);

behavioral_adder u3_tb
(
    .a(a_tb),
    .b(b_tb),
    .cin(cin_tb),
    .sum(behavioral_sum),
    .cout(behavioral_cout)
);

integer i ;
initial begin
    
    $display("TRUTH TABLE");
    $display("             | behavioral | structural |    gate    ");
    $display(" cin | a | b | cout | sum | cout | sum | cout | sum ");
    $monitor(" %d   | %d | %d | %d    | %d   | %d    | %d   | %d    | %d   ",
    cin_tb, a_tb, b_tb, behavioral_cout, behavioral_sum, structural_cout,
    structural_sum, gate_cout, gate_sum);

    
    for (i=0; i<8; i=i+1) begin

        {cin_tb,a_tb,b_tb} = i[2:0];
        #10; 
    end

    $display("-------------------------------------------------");
    $display("simulation complete");
    $finish;

end

endmodule