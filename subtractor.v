`include "adder.v"
`include "inverter.v"

module subtractor(s,ovf,a,b); //the adder needed a cin, but our d variable which toggles the inverter
										//will function as the cin
input [3:0] a,b;
output [3:0]s;
output ovf;
reg d = 1;	//because we are always doing an inversion of b in a subtractor
			//I am hard coding d to be 1, which will force an inversion.
			
wire [3:0] invb;
inverter myInverter(invb, b, d);
adder myAdder(s,ovf, a, invb, d);
endmodule


module subtractor_tb();
reg [3:0] a,b;
wire [3:0]s;
wire ovf;

subtractor mySubtractor(
	.a(a),
	.b(b),
	.s(s),
	.ovf(overflowFlag)
	);
	
	always @* begin
	$monitor("input %4b - %4b	output:%4b	overflow?: ", a,b,s, overflowFlag);
		#10;
		a = 4'b1111;  // -1 - -2 = 1
		b = 4'b1110; //output should be 0001 overflow 0
		#10;
		
		a = 4'b1000 ; // -8 - 1 = -9
		b = 4'b0001 ;// output should be 0111 overflow 1
		#10;
		
		a = 4'b1000 ; // -8 - -6 = -2
		b = 4'b1110 ; //output should be 0110 overflow 0
		#10;		
					
		a = 4'b0011 ;
		b = 4'b0001 ;
		#10; //output should be 0010 overflow 0
		a = 4'b0010;
		b = 4'b0101;//output should be 0101 overflow = 0
		#10;
	end
endmodule
