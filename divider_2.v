module clockDivider #(parameter n = 50000) (input clk, rst, output reg clk_out);
    wire[31:0] count; // supposed to be reg
    Counter #(n, 32) cnt(rst, clk, count); 
    // increment counter with each cycle of the clock of FPGA (Which is 100 MHz), that is, count increments every 1/100,000,000 s = 10 ns
    always @ (posedge clk, posedge rst) begin  
        if (rst)
            clk_out <= 0;
        else if (count == n - 1) // every 2n incrementions of counter is a clock cycle of the output clock
            clk_out <= ~clk_out;  
        else
            clk_out <= clk_out;
    end
    //  2 * n * 10 ns is one clock cycle, 1/(20 ns * n) == 1000 Hz (Output frequency)
endmodule