`timescale 1ns / 1ps

module basys3_tb();
    // Physical Wires (Registers for inputs we control, wires for outputs we read)
    reg clk_100MHz;
    reg reset_btn;
    reg analog_in_pin;
    wire [15:0] led_out;

    // Plug our ghost wires into the physical top-level wrapper
    basys3_top uut (
        .clk_100MHz(clk_100MHz),
        .reset_btn(reset_btn),
        .analog_in_pin(analog_in_pin),
        .led_out(led_out)
    );

    // Fake the 100 MHz Quartz Crystal (Toggles every 5 nanoseconds)
    always #5 clk_100MHz = ~clk_100MHz;

    initial begin
        // 1. Turn on the power and hold the Reset button
        clk_100MHz = 0;
        reset_btn = 1; 
        analog_in_pin = 1; // Start by feeding a solid +1 (High)
        
        // 2. Wait 100 ns, then let go of the Reset button
        #100;
        reset_btn = 0;

        // 3. Let the filter process the solid +1 for 5,000,000 ns (5 ms)
        #5000000; 

        // 4. Fake a human flipping the switch to -1 (Low)
        analog_in_pin = 0;
        
        // 5. Let the filter process the -1 for another 5,000,000 ns (5 ms)
        #5000000;

        // 6. Stop the simulation
        $stop;
    end
endmodule // basys3_tb
