/*   
   Lab: Verilog Lexical Conventions 
   Description: Demonstrates identifiers, numbers, strings, and attributes. 
*/ 
 
// TODO: Add a module-level attribute here (e.g., (* optimize = "off" *)) 
(* keep_hierarchy = "yes" *)
module lexical_demo; 
// TODO: 
    // 1. Strings 
    // A string requires 8 bits per character. "Hello World" is 11 characters. 
    // Declare a register named ‘my_string’ 
    reg [88:0] my_string ;
 
    // 2. Case Sensitivity & Identifiers 
    // Declare two 8-bit registers named 'Data_Val' and 'data_val' 
    reg [7:0] Data_Val;
    reg [7:0] data_val;

    // 3. Logic Values & Literal Integers 
    // Declare a 12-bit register named 'mixed_logic' 
    reg [11:0] mixed_logic;
    // 4. Literal Real Numbers 
    // Declare a 'real' variable named 'analog_voltage' 
    real analog_voltage ;
    // 5. Attributes on variables 
    // use (* keep = "true" *) to a net called ‘protected_wire’ 
    (*keep="true"*) wire protected_wire ;
    initial begin 
        // --- Assignments --- 
// TODO: 
        // String assignment 
        // TODO: assign "Hello World" to my_string 
        my_string = "hello world" ;
        // TODO: Assign 8'hAA to 'Data_Val' and 8'h55 to 'data_val'  
        Data_Val = 8'haa ;
        data_val = 8'h55 ;
        // TODO: Assign a 12-bit binary number to 'mixed_logic' (1, 0, x, z) 
        // Example: 12'b1010_xxxx_zzzz; 
        mixed_logic = 12'b1000_xxxx_zzzz ;
        // TODO: Assign a real number to 'analog_voltage' (e.g., 3.3e-3) 
        analog_voltage = 3.356e2 ;
        // --- Display Results --- 
        // $display statements automatically print to the console. 
        // TODO: Add $display statements to print variables. 
        // Hint: Use %h for hex, %b for binary, and %f for real numbers. 
        $display("--- Lexical Conventions Output ---");
        $display("Data_Val = %h \ndata_val = %h \nanalog_voltage = %f \nmixed_logic = %b",
        Data_Val,data_val,analog_voltage,mixed_logic) ;
        $display("String Value: %s", my_string); 
        $finish; 
    end 
endmodule