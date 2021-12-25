module debouncer(input clk, inp, output out);
    reg Qmeta, Qsynch, Q1, Q2, Q3;
    always @(posedge clk) begin 
        //sychronizer 
        Qmeta <= inp;
        Qsynch <= Qmeta;
        //Debouncer 
        Q1<= Qsynch;
        Q2 <= Q1;
        Q3 <= Q2; 
    end
    assign out = Q1 & Q2 & Q3; 
endmodule
