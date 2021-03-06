/*
Dimitrios Papageorgacopoulos
Posnett
CSC137
CSUS
9 April 2019

The following is a 4 bit CG Unit to be used as the 
second part of a four bit adder/subtractor.
*/

module CGU(c,p,g,cin);
input [3:0] p,g;
input cin;

output [3:0]c;
wire c0,c1,c2,c3;

//assign c0 = (g0 | (p0 & cin));
wire a0;
and a0AND(a0, p[0], cin);
or c0OR(c[0], a0, g[0]);

//assign c1 = (g1 | ((p1 & g0) | ((p1 & p0) & cin))) //g2 or the result of OR'ing (p1g0, p1p0cin)
wire a1, a2;
and a1AND(a1, p[1], p[0], cin);
and a2AND(a2, p[1], g[0]);
or c1OR(c[1], g[1], a1, a2);

//assign c2 = (g2 | ((p2 & g1) | ((p2 & (p1 & g0)) | ((p2 & p1) & (p0 & cin)))
wire a3,a4,a5,a3a4,g2a5;

and a3AND(a3, p[2], p[1], p[0], cin);
and a4AND(a4, p[2], p[1], g[0]);
and a5AND(a5, p[2], g[1]);
or c2OR(c[2], a3, a4, a5, g[2]);

//assign c3

wire a6,a7,a8,a9;
and a6AND(a6,p[3], p[2], p[1], p[0], cin);
and a7AND(a7, p[3], p[2], p[1], g[0]);
and a8AND(a8, p[3], p[2], g[1]);
and a9AND(a9, p[3], g[2]);
or c3OR(c[3], a6, a7, a8, a9);

endmodule

/*
module CGU_tb();
	reg [3:0]p, g;
	reg cin;
	wire [3:0]c;
	
	CGU myCGU(
	.c(c),
	.p(p),
	.g(g),	
	.cin(cin)
	);
	
	initial begin
	//$monitor("inputs:p[0]=%b,g[0]=%b,p[1]=%b,g[1]=%b,p[2]=%b,g[2]=%b,p[3]=%b,g[3]=%b", p[0],g[0],p[1],g[1],p[2],g[2],p[3],g[3]);
	$monitor("outputs:c0=%b, c1=%b, c2=%b, c3=%b", c[0],c[1],c[2],c[3]);
	end
	
	initial begin
		#10;
		p = 4'b0011 ;
		g = 4'b1010 ;
		cin =0; #10;
		p = 4'b1101;
		g = 4'b1000;
		cin =1;
		#10;
	
	end
	
endmodule
	
*/
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	