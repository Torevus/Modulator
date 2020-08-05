# Modulator
This project has been created because of idea: creating tutorial for newbies in Verilog. The full tutorial is written in polish. This design is aimed aspecially for Xilinx hardware and has been tested on FPGA Spartan 3A. The major advantages of the design are: simplicity of code, diversity of instruction. The main disadvatage is the number of different components. This kind of PWM_modulator can be used as an example: lighting the two LEDs or in a simple transistor voltage conventer.
List below contains main components:
* Modulator_PWM.v
* Counter.v
* Register.v

Modulator Features:
- 8 bits resolution
- f/2^8 - switching frequency; where f is the frequency of clock.
- 4 different Duty-Cycles: 20, 40, 60, 80 %.
- Asynchronous Reset

In Test-Bench, you need to set two bits of control signal and instantiate a clock domain.

(c) 2020, Karol Oniszczuk
