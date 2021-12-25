module risingEdgeDet(input clk, rst, level, output z);
    reg [1:0] state, nextstate;
    parameter [1:0] zero = 2'b00, edg = 2'b01, one = 2'b10;
    always@(level or state) begin
        case(state)
        zero: 
            if(level)
                nextstate = edg;
            else 
                nextstate = zero;
       edg: 
            if(level) 
                nextstate = one;
            else
                nextstate = zero;
       one: 
            if(level)
                nextstate = one;
            else
                nextstate = zero;
        endcase
    end
    always @(posedge clk) begin
        if(rst)
            state <= zero;
        else
            state <= nextstate;
    end
    assign z = (state == edg);
endmodule