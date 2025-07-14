module alu(
    input [7:0] A, B,
    input [2:0] OP,
    output reg [7:0] RESULT
);

    always @(A, B, OP) begin
        case (OP)
            3'b000: RESULT = A + B;       
            3'b001: RESULT = A - B; // SUB
            3'b010: RESULT = A & B;       
            3'b011: RESULT = A | B; // OR
            3'b100: RESULT = ~A;                      
            default: RESULT = 8'b0;
        endcase
    end

endmodule


module alu_tb;

    reg [7:0] A, B;
    reg [2:0] OP;
    wire [7:0] RESULT;

    alu uut (.A(A), .B(B), .OP(OP), .RESULT(RESULT));

    initial begin
        $dumpfile("alu.vcd");
        $dumpvars(0, alu_tb);

        // Test addition
        A = 8'd10; B = 8'd20; OP = 3'b000;
                                                             

                           
        A = 8'd30; B = 8'd10; OP = 3'b001;
        #10 $display("Subtraction: %d - %d = %d", A, B, RESULT);

        // Test AND
        A = 8'b1100; B = 8'b1010; OP = 3'b010;
                                                        

                  
        A = 8'b1100; B = 8'b1010; OP = 3'b011;
        #10 $display("OR: %b | %b = %b", A, B, RESULT);

        // Test NOT
        A = 8'b1100; OP = 3'b100;
        #10 $display("NOT: ~%b = %b", A, RESULT);

        #10 $finish;
    end

endmodule