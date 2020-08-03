`timescale 1ns / 1ps

// Register of Modulator PWM with controlled pulse-width.
// Submodul
// Design made by

// (c) 2020 , Karol Oniszczuk

module Register(                // Module declaration
    input [1:0] PWM_Width,      // 2-bits control input
    input Register_Reset,       // Reset
    output [7:0] Register_Data  // 8-bits output of data
    );
	 
integer Data_Out;               // Variable "Data_Out" as Integer

always @(PWM_Width, Register_Reset) // Following process is made with sensivity list
begin                           // Begin of process

  if (Register_Reset)           // If Reset = 1
    Data_Out = 51;              // Set the lowest value of Width (20%) 256/5
  else                          // In antoher case select from list below
  
    case (PWM_Width)            // Start of case instruction
      2'b00	: Data_Out = 51;  // 20% of PWM-width
      2'b01   	: Data_Out = 102; // 40% of PWM-width
      2'b10	: Data_Out = 153; // 60% of PWM-width
      2'b11	: Data_Out = 204; // 80% of PWM-width
    endcase                     // End of case
    
end                             // End of process

assign Register_Data = Data_Out; // Data assignment with change of data type Integer to byte

endmodule
