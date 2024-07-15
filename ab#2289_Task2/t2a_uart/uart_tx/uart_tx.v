// AstroTinker Bot : Task 2A : UART Transmitter
/*
Instructions
-------------------
Students are not allowed to make any changes in the Module declaration.

This file is used to generate UART Tx data packet to transmit the messages based on the input data.

Recommended Quartus Version : 20.1
The submitted project file must be 20.1 compatible as the evaluation will be done on Quartus Prime Lite 20.1.

Warning: The error due to compatibility will not be entertained.
-------------------
*/

/*
Module UART Transmitter

Input:  clk_50M - 50 MHz clock
        data    - 8-bit data line to transmit
Output: tx      - UART Transmission Line
*/

// module declaration
module uart_tx(
    input  clk_50M,
    input  [7:0] data,
    output reg tx
);

//////////////////DO NOT MAKE ANY CHANGES ABOVE THIS LINE//////////////////

initial begin
	 tx = 0;

end
	integer counter_8680ns = 1;
	integer numbits = 1; //435
	reg [1:0] state = 00;


parameter start=2'b00, transmit=2'b01, stop=2'b10;
initial begin
	 tx = 0;
end

always @(posedge clk_50M) begin
counter_8680ns=counter_8680ns + 1;
case (state)
            start: begin
				
				 if (counter_8680ns==435) begin
				 counter_8680ns<=1;
				 state<=transmit;
				 tx<=data[numbits-1];
				

				 end
				 else begin
			
					tx<=0;
                end
            end
            transmit: begin
				if (numbits<9) begin
				tx<=data[numbits-1];
				
					if(counter_8680ns==435) begin
						numbits<=numbits+1;
						counter_8680ns<=1;
					
		
					end
					
               end
            else begin
					state<=stop;
					numbits<=1;
					tx<=1;
					
				end
				end
				
            stop: begin
				if (counter_8680ns==435) begin
					state<=start;
					
				 
					counter_8680ns<=1;
					

				 end
				 tx<=1;
				 end

            default: state <= start;
				
				
    endcase
	 end


////////// Add your code here ///////////////////

//////////////////DO NOT MAKE ANY CHANGES BELOW THIS LINE//////////////////

endmodule