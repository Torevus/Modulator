`timescale 1ns / 1ps

// Counter of Modulator_PWM with controlled pulse-width.
// Submodule
// Design made by

// (c) 2020 , Karol Oniszczuk

module Counter( 						    // Module declaration, name and I/O
    input Counter_Clock,			  // Clock 
	  input Counter_Reset,			  // Reset
    output [7:0] Counter_Data 	// Output of data 8-bit width
    );

reg [7:0] Count; 					      // Eight bit register

always @(posedge Counter_Clock) // Do always with rising edge of clock				 
begin										        // Begin of process
  if(Counter_Reset)					    // If Reset equals 1
    Count <= 8'd0;						  // Change "Count" to 0
  else									        // In other case
    Count <= Count + 8'd1;		  // Incrementation. The value goes from 0 to 255 (+1)
end							 		          	// End of process

assign Counter_Data = Count;    // Data assignment

endmodule
