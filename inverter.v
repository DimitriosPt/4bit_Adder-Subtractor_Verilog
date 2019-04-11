/*
Dimitrios Papageorgacopoulos
Posnett
CSC137
CSUS
9 April 2019

The following is a 4 bit inverter Unit to be used as the 
a part of a four bit adder/subtractor.
When signal d is high the bits will be inverted;
*/

module inverter(invb,b,d);
input [3:0] b;
input d;  //d is a signal which will tell us if we are doing
output [3:0] invb;	//an inversion on b

wire [3:0] invb;

xor XORb3(invb[3], b[3], d); //if d is 1, b will be inverted, else b will be unchanged
xor XORb2(invb[2], b[2], d);
xor XORb2(invb[1], b[1], d);
xor XORb2(invb[0], b[0], d);

endmodule

/*
module inverter_tb();
	reg [3:0]b;
	reg d;
	wire [3:0]invb;
	inverter myInverter(
		.invb(invb),
		.b(b),
		.d(d)
	);
	
	initial begin
	$monitor("inputs:b3=%b,b2=%b,b1=%b,b0=%b,d=%b outputs:invb3=%b, invb2=%b, invb1=%b, invb0=%b", b[3],b[2],b[1],b[0],d,invb[3],invb[2],invb[1],invb[0]);
	end
	
	initial begin
	d = 1;
	assign b[0] =1;
	assign b[1]= 0;
	assign b[2]=1;
	assign b[3]=1;
	#10;
	d = 0;
	end

endmodule
*/