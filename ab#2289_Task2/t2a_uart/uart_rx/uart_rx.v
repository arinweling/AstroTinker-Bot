// AstroTinker Bot : Task 2A : UART Receiver
/*
Instructions
-------------------
Students are not allowed to make any changes in the Module declaration.

This file is used to receive UART Rx data packet from receiver line and then update the rx_msg and rx_complete data lines.

Recommended Quartus Version : 20.1
The submitted project file must be 20.1 compatible as the evaluation will be done on Quartus Prime Lite 20.1.

Warning: The error due to compatibility will not be entertained.
-------------------
*/

/*
Module UART Receiver

Input:  clk_50M - 50 MHz clock
        rx      - UART Receiver

Output: rx_msg      - read incoming message
        rx_complete - message received flag
*/

// module declaration
module uart_rx (
  input clk_50M, rx,
  output reg [7:0] rx_msg,
  output reg rx_complete
);

//////////////////DO NOT MAKE ANY CHANGES ABOVE THIS LINE//////////////////

////////////////////////// Add your code here


initial begin

rx_msg = 0; rx_complete = 0;

end
reg [7:0] rx_temp;
integer counter_8680ns = 1;
integer numbits = 8; //435
reg [1:0] state = 00;

parameter start=2'b00, receive=2'b01, stop=2'b10,complete=2'b11;

initial begin

rx_msg = 0; rx_complete = 0;rx_temp="00000000";

end
always @(posedge clk_50M) begin
counter_8680ns=counter_8680ns + 1;
case (state)
            start: begin
				
					rx_complete<=0;
					
				
				 if (counter_8680ns==435) begin
				 counter_8680ns<=1;
				 state<=receive;
				 
				

				 end
				 else begin
			
					
                end
            end
            receive: begin
				if (numbits>0) begin
				rx_temp[numbits-1]<=rx;
				
					if(counter_8680ns==435) begin
						numbits<=numbits-1;
						counter_8680ns<=1;
					
		
					end
					
               end
            else begin
					state<=stop;
					numbits<=8;
					
					
					
				end
				end
				
            stop: begin
				if (counter_8680ns==435) begin
					state<=complete;
					
					
					
					

					counter_8680ns<=1;


				 end
				 
				 end
				 complete:begin
					rx_complete<=1;
					rx_msg<=rx_temp;
					counter_8680ns<=2;
					state<=start;
				end

            default: state <= start;
				
				
    endcase
	 end


//////////////////DO NOT MAKE ANY CHANGES BELOW THIS LINE//////////////////

endmodule