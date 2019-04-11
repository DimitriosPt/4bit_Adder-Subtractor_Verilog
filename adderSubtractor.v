`include "adder.v"
`include "inverter.v"


module adderSubtractor(s,ovf,a,b,d); 
	input [3:0] a,b;
	input d;
	output [3:0]s;
	output ovf;
	wire ovf;
	
	wire [3:0] invb;
	inverter myInverter(invb, b, d);
	adder myAdder(s,ovf, a, invb, d);
endmodule

module adderSubtractor_tb();
	reg [3:0] a,b;
	reg d;
	wire [3:0]s;
	wire overflowFlag;

adderSubtractor myAdderSubtractor(
	.a(a),
	.b(b),
	.d(d),
	.s(s),
	.ovf(overflowFlag)
	);
	always @* begin
	$display(" a   +/-  b   d   output overflow");
	$monitor("%4b    %4b  %b   %4b	  %b  ", a,b,d,s,overflowFlag);
		//-------------------------subtraction--------------------//
		#10
		a=4'b1000; // -8 - -2 = -6
		b=4'b1110;
		d = 1;//output should be 0111 overflow 0	
		
		#10;
		a = 4'b1111;  //-1 - -2 = 1
		b = 4'b1110; 
		d= 1;//output should be 0001 overflow 0
		
		#10;
		a = 4'b0111; //7 - -6 = 13
		b = 4'b1010; 
		d= 1;//output should be 0011 overflow 1
		
		#10;
		a = 4'b0011 ; // 3 - 1 = 2
		b = 4'b0001 ;
		d =1;
		#10; //output should be 0010 overflow 0
		
		a = 4'b1000; //-6 - 1 = -9 
		b = 4'b0001;//output should be 0101 overflow 1
		d=1;
		#10;
		//-------------------------addition----------------------------
		a=4'b1001;
		b=4'b0110;
		d =0;
		#10; //output should be 1111 overflow 0
		
		a=4'b0111;
		b=4'b0001;
		d=0;
		#10;	//output should be 1000 overflow 1
		
		a=4'b0111;
		b=4'b0001;
		d=0;
		#10; //output should be 1000 
		
		a = 4'b0011 ;
		b = 4'b1010 ;
		d =0; 
		#10; //output should be 1101 
		
		a = 4'b1101;
		b = 4'b1000;
		d =0;
		#10;//output should be 0101 
		
		a=4'b1111; //output should be 1101 
		b=4'b1110;
		d=0;
		#10
		
		a=4'b0000;
		b=4'b0000;
		d=0;	//output should be 0000 
		#10;
	end
endmodule