`timescale 1ns / 1ps

// Modulator PWM with controlled width.
// Topmodule.
// Design made by

// (c) 2020 , Karol Oniszczuk

module Modulator_PWM( 				    // Module declaration
    input [1:0] PWM_Width,        // 2-bit input of PWM_width
    input Clock,                  // Clock
	  input Reset,                  // Reset
    output PWM_Low,               // Output of PWM low branch,
    output PWM_High               // Output of PWM high branch,
    );
	 
wire [7:0] Register_Input;        // Local wire between "Register_Data" and Comparator
wire [7:0] Counter_Input;         // Local wire between "Counter_Data" and Comparator
reg PWM;                          // PWM output of Compartor

Counter L1 (                      // Counter Instantiation
    .Counter_Clock(Clock),        // Signal assignment; on the left side are submodule, on another topmodule signals
    .Counter_Reset(Reset), 		
    .Counter_Data(Counter_Input)
    );
	 
Register R1 (                     // Register Instantiation
    .PWM_Width(PWM_Width), 
    .Register_Reset(Reset), 
    .Register_Data(Register_Input)
    );

// Comparator

always @(Register_Input, Counter_Input) // Always when signals on list occur
begin                                   // Begin of process

  if (Counter_Input < Register_Input)   // If Register value is higher than Counter value
    PWM <= 1;                           // In this case assign 1
  else					
    PWM <= 0;												    // In other case 0
end                                     // End of process

assign PWM_Low = ~PWM;                  // Assignment of "PWM_Low" negativ
assign PWM_High = PWM;                  // Assignment of "PWM_High" positiv

endmodule
