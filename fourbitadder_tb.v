`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/26/2023 01:37:25 PM
// Design Name: 
// Module Name: fourbitadder_tb
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
//////////////////////////////////////////////////////////////////////////////////


module fourbitadder_tb();
    
//    reg [3:0] At, Bt;
//    //reg Ct; //input
//	wire Coutt; //output
//	wire [3:0] st;
    reg [3:0] At, Bt;
    reg s;
    wire [6:0] Displayt;

	// you can use the same name, but in this case we made them different 	// to highlight the 2 (.UUT(TB))
	//fourbitadder uut(.A(At), .B(Bt), .sum(st), .Cout(Coutt)); //portmap
	final f0(.A(At), .B(Bt), .s(s), .Display(Displayt));

	initial 
	begin
		At=4'b0000; Bt=4'b0000; s = 0;
		#10;
		At=4'b0001; Bt=4'b0001;s = 1;
		#10;
		At=4'b0010; Bt=4'b0010;s = 0;
		#10;
		At=4'b0011; Bt=4'b0011;s = 1;
		#10;
		At=4'b0100; Bt=4'b0100;s = 0;
		#10;
		At=4'b0101; Bt=4'b0101;s = 1;
		#10;
		At=4'b0110; Bt=4'b0110;s = 0;
		#10;
		At=4'b0111; Bt=4'b0111;s = 1;
		#10;
		At=4'b1000; Bt=4'b1000;s = 0;
		#10;
		At=4'b1010; Bt=4'b1100;s = 1;
		#10;
		At=4'b1011; Bt=4'b1001;s = 0;
		#10;
		At=4'b1111; Bt=4'b1111;s = 1;
		#10;
		
		
		
		$finish;
	end
		
endmodule
