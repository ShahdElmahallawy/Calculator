`timescale 1ns / 1ps
module calculator_testbench;
    reg[3:0] button, operation;
	reg clk, rst, return;
	wire[7:0] finalToDisplay;
	wire[3:0] enable;
	calculator c1(button, operation, return, clk, rst, finalToDisplay, enable);
	integer i;
	initial begin
	   clk = 0;
	   return = 0;
	   button = 0;
	   rst = 1; #4;
	   rst = 0;
	   //1. Setting the number to be 99.99
	   for (i = 0; i < 9; i = i + 1) begin
	           button[0] = 0; button[1] = 0; button[2] = 0; button[3] = 0; #12;
	           button[0] = 1; button[1] = 1; button[2] = 1; button[3] = 1; #12; // pressing buttons simultaneously 
	   end
	   operation = 0; #12; // initial value

	   operation = 4; #12; // 2. multiplication
	   operation = 1; #12; // 3. addition
	   operation = 2; #12; // 4. subtraction
	   operation = 8; #12; // 5. division
	   operation = 0; // set the operation back to 0 (close the switch of division)
	   
	   return = 1; #12; // 6. Display the original numbers
	   // 7. Adjust second number to be 98
	   for (i = 0; i < 9; i = i + 1) begin // pressing the button for the 0th digit 9 times
	        button[0] = 0; #12; 
	        button[0] = 1; #12; 
	   end
	   
	   // setting the return back to 0 to allow displaying of output
	   return = 0;
	   operation = 2; #10; // 8. Subtraction
	   operation = 8; #10; // 9. Division
	   return = 1; #10; // 10. Display original numbers
	   for (i = 0; i < 3; i = i + 1) begin // 11. Adjusting the first number to 32
	       button[3] = 0; button[2] = 0; #12;
	       button[3] = 1; button[2] = 1; #12; 
	   end
	   button[3] = 0; #10; button[3] = 1; #12; 
	   
	   return = 0; 
	   operation = 2; #10; // 12. Subtraction
       operation = 8; #10; // 13. Division
       operation = 4; #10; // 14. Multiplication
       return = 1; #10; // 15. Display the original numbers
       for (i = 0; i < 2; i = i + 1) begin // 16. Adjust the second number to 10
           button[1] = 0; button[0] = 0; #12;
           button[1] = 1; button[0] = 1; #12;
       end
       return = 0;
       operation = 8; #12; // 17. Division
              
	end
	always #1 clk = ~clk;
endmodule
