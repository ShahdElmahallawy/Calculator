module display(clk, rst, digit1, digit2, digit3, digit4, to7Segment, enable); // this module deals with making every digit of the 7 Segment Display distinct
    /* takes 4 digits, and a clock, assigns on output ("to7Segment") to one digit of the 4 digits every clock cycle of the input clock
     Since one digit will be on, and the rest are off every clock cycle of the input clock 
     enable of FPGA enable one digit to be on (0) only each cycle and the others will be off (1) (enable of FPGA changes accordingly */
    input clk, rst;
    input[7:0] digit1, digit2, digit3, digit4;
    wire[7:0] digits[3:0]; 
    assign digits[0] = digit1; assign digits[1] = digit2; assign digits[2] = digit3; assign digits[3] = digit4; // for more code elegance
    output[7:0] to7Segment;
    output[3:0] enable;
    wire[1:0] counter;
    wire clk_1000Hz;
    clockDivider divide(clk, rst, clk_1000Hz); // convert the FPGA clock to a clock of 1000 Hz
    Counter #(4, 2) cnt(rst, clk_100Hz, counter); // Increment counter modulo 4 according to the 1000 Hz clock
    assign to7Segment = digits[counter]; // selecting one digit of the input digits according to counter
    assign enable = 4'b1111 - (1 << counter); // enable one of the 7-Segment display digits according to counter (active-low enable)
endmodule
