module calculator(button, operation, return, clk, rst, finalToDisplay, enable);
	input[3:0] button, operation;
	input clk, rst, return;
	output reg[7:0] finalToDisplay;
	output reg[3:0] enable;
	wire[3:0] digitsIn[3:0];
	wire[3:0] debouncerOut, risingEdgeOut;
	wire[7:0] segmentsIn[3:0]; // conversion from 0 to 9 normal digits to 7-Segment display digits (of input)	
	genvar i;
	generate 
	   for (i = 0; i < 4; i = i + 1) begin: gen1
	       debouncer deb(clk, button[i], debouncerOut[i]);
               risingEdgeDet det(clk, rst, debouncerOut[i], risingEdgeOut[i]);
               Counter  #(10, 4) cnt(rst, risingEdgeOut[i], digitsIn[i]); // every positive edge of risingEdgeOut[i] (button press) , digitsIn[i] increments
               SegmentDisplay seg(digitsIn[i], (i == 2), segmentsIn[i]); // take digitsIn and convert to 7 Segment Display in segmentsIn
	   end
	endgenerate
	
	wire[7:0] selectSegmentInput;  // One 7-Segment display digit to be selected from digitsIn
	wire[3:0] enableOfInput; // enable to light up that digit
	display displayInput(clk, rst, segmentsIn[0], segmentsIn[1], segmentsIn[2], segmentsIn[3], selectSegmentInput, enableOfInput);
	// Operations, 0001 == addition, 0010 == subtraction, 0100 == multiplication, 1000 == division
	wire[6:0] num1, num2; reg[13:0] result;
	assign num1 = digitsIn[2] + 10 * digitsIn[3]; 
	assign num2 = digitsIn[0] + 10 * digitsIn[1];
	reg[3:0] digitsOut[3:0];
	reg isNegative;
	always @(operation) begin
	   isNegative = 0;
	   case (operation)
	       1: result = num1 + num2; //Adittion 
	       2: begin
	           result = (num1 < num2 ? num2 - num1 : num1 - num2); // Subtraction
	           isNegative = (num1 < num2);
	       end
	       4: result = num1 * num2;
	       8: result = (num2 == 0 ? 0 : (2 * num1 + num2)/(2 * num2)); // rounding division
	       default: result = 0;
	   endcase
       	   digitsOut[0] = result % 10;                                                                                                             
           digitsOut[1] = (result % 100)/10;                                                                                                       
           digitsOut[2] = (isNegative ? 10 : (result % 1000)/100); // if the number is negative, the 2nd digit from the right is the negative sign  (10 in 7 Segment display)
           digitsOut[3] = (isNegative ? 11 : result / 1000);  // if the number is negative, 1st digit from the right is off (11 in 7 Segment Display)             	   
	end
	
	wire[7:0] segmentsOut[3:0]; // conversion from 0 to 9 normal digits to 7-Segment display digits (of output)
	generate 
	   for (i = 0; i < 4; i = i + 1) begin: gen2
               SegmentDisplay seg(digitsOut[i], 0, segmentsOut[i]); 
           end 
    	endgenerate
    
    	wire[7:0] selectSegmentOutput; // One 7-Segment display digit to be selected from digitsOut
    	wire[3:0] enableOfOutput; // enable to light up that digit    
    	display displayOutput(clk, rst, segmentsOut[0], segmentsOut[1], segmentsOut[2], segmentsOut[3], selectSegmentOutput, enableOfOutput);
    
    	wire clk_1000Hz;
    	clockDivider divide(clk, rst, clk_1000Hz);
    	always @(return, operation, rst, clk_1000Hz) begin
        	if (rst == 1 || return == 1) begin
            		finalToDisplay = selectSegmentInput;
            		enable = enableOfInput;
        	end
        	else if (operation == 1 || operation == 2 || operation == 4 || operation == 8) begin
            		finalToDisplay = selectSegmentOutput;
            		enable = enableOfOutput;     
        	end
        	else begin
            		finalToDisplay = selectSegmentInput;
            		enable = enableOfInput;
        	end
    	end
endmodule