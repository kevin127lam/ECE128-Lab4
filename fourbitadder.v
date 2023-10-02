`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/26/2023 01:36:11 PM
// Design Name: 
// Module Name: fourbitadder
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
///////////////////////
module mux(
    input [3:0] I1, //Cout for the adder
    input [3:0] I2,//sum of the adder
    input s,
    output reg [3:0] out
    );
   
   always @ (*)
   begin
    case(s)
        0: out = I1;
        1: out = I2;
    endcase
   end

//    wire NS0, NS1, NS2;
//    wire Y0, Y1, Y2, Y3, Y4, Y5, Y6, Y7;
    
//    not N1(NS0, S[0]);
//    not N2(NS1, S[1]);
//    not N3(NS2, S[2]);
    
//    and A1(Y0, I[0], NS2, NS1, NS0);
//    and A2(Y1, I[1], NS2, NS1, S[0]);
//    and A3(Y2, I[2], NS2, S[1], NS0);
//    and A4(Y3, I[3], NS2, S[1], S[0]);
//    and A5(Y4, I[4], S[2], NS1, NS0);
//    and A6(Y5, I[5], S[2], NS1, S[0]);
//    and A7(Y6, I[6], S[2], S[1], NS0);
//    and A8(Y7, I[7], S[2], S[1], S[0]);
    
//    or O1(Y, Y0, Y1, Y2, Y3, Y4, Y5, Y6, Y7);
    
endmodule
//////////////////////////////////////////////////////////////////////////////////

module fourbitadder(A, B, sum, Cout);

input [3:0] A, B;

output [3:0] sum, Cout;

wire [3:0] C;

onebitadder add0(.A(A[0]), .B(B[0]), .Cin(0), .s(sum[0]), .Cout(C[0]));
onebitadder add1(.A(A[1]), .B(B[1]), .Cin(C[0]), .s(sum[1]), .Cout(C[1]));
onebitadder add2(.A(A[2]), .B(B[2]), .Cin(C[1]), .s(sum[2]), .Cout(C[2]));
onebitadder add3(.A(A[3]), .B(B[3]), .Cin(C[2]), .s(sum[3]), .Cout(C[3]));

assign Cout = {3'b0,C[3]};

endmodule
///////////////////////////////////////////////////////////////////////
module onebitadder(A, B, Cin, s, Cout);

	input A, B, Cin;
	output reg Cout, s;

	always@(A, B, Cin)//input list
	begin
	case ({A, B,Cin})		//cases of the truth table
        3'b000: s=0;
        3'b001: s=1;
    	3'b010: s=1; 
	    3'b011: s=0;
    	3'b100: s=1; 
        3'b101: s=0; 
        3'b110: s=0;
    	3'b111: s=1;
	endcase
	
	case ({A, B,Cin})		//cases of the truth table
        3'b000: Cout=0; 
        3'b001: Cout=0;
    	3'b010: Cout=0;
	    3'b011: Cout=1;
    	3'b100: Cout=0;
        3'b101: Cout=1;
        3'b110: Cout=1;
    	3'b111: Cout=1;
	endcase
	
	end
	
	endmodule
/////////////////////////////////////////////////////////////
module SevenSegment(Sum, Display);
input[3:0] Sum;
output reg [6:0] Display;

always@( Sum )
begin
case(Sum)
    4'b0000: Display = 7'b0000001; //(if active low then 000001)
    4'b0001: Display = 7'b1001111;
    4'b0010: Display = 7'b0010010;
    4'b0011: Display = 7'b0000110;
    4'b0100: Display = 7'b1001100;
    4'b0101: Display = 7'b0100100;
    4'b0110: Display = 7'b0100000;
    4'b0111: Display = 7'b0001111;
    4'b1000: Display = 7'b0000000; 
    4'b1001: Display = 7'b0001100;
 
endcase
end
endmodule
////////////////////////////
module final(A, B, sel, Display);
    input [3:0] A, B;
    input sel;
    wire Cout;
    output [6:0] Display;
    wire [3:0] Sum, out;
    
	fourbitadder add0(.A(A), .B(B), .sum(Sum), .Cout(Cout));
	mux m0(.I1(Cout), .I2(Sum), .s(sel), .out(out));
	SevenSegment seg0(.Sum(out), .Display(Display));
endmodule
