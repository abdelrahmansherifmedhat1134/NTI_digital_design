/*
module 8bit_alu (
    input wire [7:0] a,
    input wire [7:0] b,
    input wire  cin,
    input wire [5:0] control,
    
    output wire [15:0] out
);
*/
`timescale 1ns/1ps
module tb ;

reg [7:0] a_tb, b_tb ;
reg cin_tb ;
reg [5:0] control_tb ;
reg [144:0] control_op_tb ;
wire [15:0] out_tb ;
/*
8bit_alu alu_inst (
    .a(a_tb),
    .b(b_tb),
    .cin(cin_tb),
    .control(control_tb),
    .out(out_tb)
);
*/
integer i ; 
alu_8bit DUT(a_tb, b_tb, cin_tb, control_tb, out_tb);
always @(*) begin
    case(control_tb) 
        6'b00000:control_op_tb = "A + B" ;
        6'b00001:control_op_tb = "A + B + Cin" ;
        6'b00010:control_op_tb = "A + ~B + 1" ;
        6'b00011:control_op_tb = "A + ~B" ;
        6'b00100:control_op_tb = "INC A" ;
        6'b00101:control_op_tb = "DEC A" ;
        6'b00110:control_op_tb = "A * B + 1" ;
        6'b00111:control_op_tb = "A & B" ;
        6'b01000:control_op_tb = "A | B" ;
        6'b01001:control_op_tb = "A ^ B" ;
        6'b01010:control_op_tb = "~A" ;
        6'b01011:control_op_tb = "A ~& B" ;
        6'b01100:control_op_tb = "A << B" ;
        6'b01101:control_op_tb = "A >> B" ;
        6'b01110:control_op_tb = "A <<< B" ;
        6'b01111:control_op_tb = "A >>> B" ;
        6'b10000:control_op_tb = "A ROR B" ;
        6'b10001:control_op_tb = "A ROL B" ;
        6'b10010:control_op_tb = "Greater(A, B)" ;
        6'b10011:control_op_tb = "MUX(A, B)" ;
        6'b10100:control_op_tb = "NOT A, NOT B" ;
        6'b10101:control_op_tb = "COMPARE(A, B)" ;
        6'b10110:control_op_tb = "ODD(A), EVEN(B)" ;
        default:control_op_tb = "UNKNOWN" ;
    endcase
end


initial begin
   $display("=======================================================================");
        $display(" 8-bit ALU Verification Testbench");
        $display("=======================================================================");
        $display(" Time  | Control |  A  |  B  | Cin |  Out  | Operation");
        $display("-----------------------------------------------------------------------");
        
        // Fixed-width format specifiers (%3d) keep numbers neatly stacked
        $monitor(" %4t  |   %2d    | %3d | %3d |  %1b  | %5d | %0s", 
                 $time, control_tb, a_tb, b_tb, cin_tb, out_tb, control_op_tb);

    $display("test case standard values");
    a_tb = 8'd5 ;
    b_tb = 8'd3 ;
    cin_tb = 1'b1 ;
    for(i = 0; i < 23; i = i + 1) begin
        control_tb = 6'b000000 + i ;
        #20 ;
    end

    $display("all zeros (testing stuck at 1 faults)");
    a_tb = 8'h00 ;
    b_tb = 8'h00 ;
    cin_tb = 1'b0 ;
    for(i = 0; i < 23; i = i + 1) begin
        control_tb = i ;
        #20 ;
    end

    $display("max values (testing overflow) ");
    a_tb = 8'hff ;
    b_tb = 8'hff ;
    cin_tb = 1'b0 ;
    for(i = 0; i < 23; i = i + 1) begin
        control_tb = i ;
        #20 ;
    end

    $display("alternating bits (testing bitwise logic operations)");
    a_tb = 8'haa ;
    b_tb = 8'h55 ;
    cin_tb = 1'b0 ;
    for(i = 0; i < 23; i = i + 1) begin
        control_tb = i ;
        #20 ;
    end

    $display("carry in active (testing adders/subtractors)");
    a_tb = 8'hff ;
    b_tb = 8'h01 ;
    cin_tb = 1'b1 ;
    for(i = 0; i < 23; i = i + 1) begin
        control_tb = i ;
        #20 ;
    end

    $display("finishing simulation");
    $finish ;
end
endmodule //tb