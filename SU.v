/*
Dimitrios Papageorgacopoulos
Posnett
CSC137
CSUS
9 April 2019

The following is a 4 bit Sum Unit to be used as the 
last part of a four bit adder/subtractor.
*/

module SU(s,p,c2,c1,c0,cin);
input [3:0]p;
input c2,c1,c0,cin;
output [3:0]s;

xor s3XOR(s[3], p[3], c2);
xor s2XOR(s[2], p[2], c1);
xor s1XOR(s[1], p[1], c0);
xor s0XOR(s[0], p[0], cin);

endmodule
/*
module SU_tb();
	reg [3:0]p;
	reg c2,c1,c0,cin;
	wire [3:0]s;
	
	SU mySU(
	.s(s),
	.p(p),
	.c2(c2),
	.c1(c1),
	.c0(c0),
	.cin(cin)
	);
	
	initial begin
	//$monitor("inputs:p[0]=%b,g[0]=%b,p[1]=%b,g[1]=%b,p[2]=%b,g[2]=%b,p[3]=%b,g[3]=%b", p[0],g[0],p[1],g[1],p[2],g[2],p[3],g[3]);
	$monitor("outputs:%b %b %b %b", s[3],s[2],s[1],s[0]);
	end
	
	initial begin
		#10;
		p = 4'b0000 ;
		c2 = 1;
		c1 = 0;
		c0 = 1;
		cin =0; 
		//
		#10;
		c2 = 0;
		c1 = 0;
		c0 = 0;
		cin =1;
		p = 4'b0000;
		#10;
		c2 = 1;
		c1 = 0;
		c0 = 1;
		cin =0; 
		p = 4'b0011;
	end

endmodule
*/