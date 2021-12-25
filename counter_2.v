module Counter #(parameter n = 10, k = 4) (rst, in, count); // modulo n (where n is a positive integer > 1), "in" is usually clock, "count" is of k bits
    input rst, in;
    output reg[k - 1:0] count;
    always @(posedge rst, posedge in) begin
        if (rst) 
            count <= 0;
        else begin
            if (count == n - 1) 
                count <= 0;
            else 
                count <= count + 1;
        end
    end
endmodule