`include "CGU.v"
`include "PGU.v"
`include "SU.v"
`include "overflowFlagger.v"

module adder(s,ovf,a,b,cin);
input [3:0] a,b;
input cin;

output[3:0] s;
output ovf;

wire[3:0] p,g,c;

PGU myPGU(p,g,a,b);
CGU myCGU(c,p,g,cin);
overflowFlagger myOverflowFlagger(ovf, c[3], c[2]);
SU mySU(s, p, c[2], c[1], c[0], cin);
endmodule
/*
module adder_tb();
	reg [3:0]a, b;
	reg cin;
	wire ovFlag;
	wire [3:0]s;
	
	adder myAdder(
	.s(s),
	.ovf(ovFlag),
	.a(a),
	.b(b),
	.cin(cin)
	);
	
	initial begin
	$display("   a  +  b   =   output"); 
	$monitor(" %4b + %4b = %4b", a, b, s);
	end
	
	initial begin
		#10;
		
		a=4'b0111;
		b=4'b0001;
		cin=0;
		#10; //output should be 1000 
		
		
		a = 4'b0011 ;
		b = 4'b1010 ;
		cin =0; 
		#10; //output should be 1101 
		
		a = 4'b1101;
		b = 4'b1000;
		cin =0;
		#10;//output should be 0101 
		
		a=4'b1111; //output should be 1101 
		b=4'b1110;
		cin=0;
		#10
		
		a=4'b0000;
		b=4'b0000;
		cin=0;	//output should be 0000 
		#10;
	
	end
endmodule
*/