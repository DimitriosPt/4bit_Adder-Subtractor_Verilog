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
input a0,b0,a1,b1,a2,b2,a3,b3;
output p0,g0,p1,g1,p2,g2,p3,g3;

wire p0,g0,p1,g1,p2,g2,p3,g3;

xor p0XOR(p0, a0, b0);//p0 is a0 XOR b0
and g0AND(g0, a0, b0);

xor  p1XOR(p1, a1, b1);
and g1AND(g1,a1,b1);

xor p2XOR(p2,a2,b2);
and g2AND(g2,a2,b2);

xor p3XOR(p3,a3,b3);
and g3(g3,a3,b3);

endmodule


module PGU_tb();
	reg a0,b0,a1,b1,a2,b2,a3,b3;
	wire p0,g0,p1,g1,p2,g2,p3,g3;
	
	PGU myPGU(p0,g0,p1,g1,p2,g2,p3,g3,a0,b0,a1,b1,a2,b2,a3,b3);
	
	initial begin
	$monitor("p0=%b,g0=%b,p1=%b,g1=%b,p2=%b,g2=%b,p3=%b,g3=%b", p0,g0,p1,g1,p2,g2,p3,g3);
	end
	
	initial begin
	//output should be 10010001
	a0 = 1;
	a1 = 0;
	a2 =0;
	a3 = 1;
	
	b0 =0;
	b1 =0;
	b2 =1;
	b3 =1;
	end
	endmodule
