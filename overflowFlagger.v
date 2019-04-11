module overflowFlagger(overflowFlag,c3,c2);
input c3, c2;
output overflowFlag;
wire overflowFlag;

xor overflowXOR(overflowFlag, c3,c2);
endmodule

