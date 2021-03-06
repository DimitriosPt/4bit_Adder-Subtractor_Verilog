/*
Dimitrios Papageorgacopoulos
Posnett
CSC137
CSUS
9 April 2019

The following is a 4 bit PG Unit to be used as the 
first part of a four bit adder/subtractor.
*/

module PGU(p,g,a,b);
input [3:0]a, b;
output [3:0]p, g;

xor p0XOR(p[0], a[0], b[0]);//p0 is a0 XOR b0
and g0AND(g[0], a[0], b[0]);

xor  p1XOR(p[1], a[1], b[1]);
and g1AND(g[1],a[1],b[1]);

xor p2XOR(p[2],a[2],b[2]);
and g2AND(g[2],a[2],b[2]);

xor p3XOR(p[3],a[3],b[3]);
and g3(g[3],a[3],b[3]);

endmodule

/*
module PGU_tb();
	reg [3:0] a,b;
	wire [3:0]p,g;
	
	PGU myPGU(p,g,a,b);
	
	initial begin
	$monitor("p[0]=%b,g[0]=%b,p[1]=%b,g[1]=%b,p[2]=%b,g[2]=%b,p[3]=%b,g[3]=%b", 
			p[0],g[0],p[1],g[1],p[2],g[2],p[3],g[3]);
	end
	
	initial begin
	#10
	//output should be 10010001
	a= 4'b1001;
	
	b=4'b1100;
	end
	endmodule
*/