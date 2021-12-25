module SegmentDisplay(input[3:0] digit, input decPointFlag, output reg[7:0] out);
    always @(*) begin
        case(digit) 
            0: out = 8'b00000011;
            1: out = 8'b10011111;
            2: out = 8'b00100101;
            3: out = 8'b00001101;
            4: out = 8'b10011001;
            5: out = 8'b01001001;
            6: out = 8'b01000001;
            7: out = 8'b00011111;
            8: out = 8'b00000001;
            9: out = 8'b00001001;
            10: out = 8'b11111101;
	    default: out = 8'b11111111;
        endcase
        out = out - decPointFlag;
     end
endmodule
