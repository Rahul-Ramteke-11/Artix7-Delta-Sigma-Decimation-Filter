`timescale 1ns / 1ps

module basys3_top(
    input clk_100MHz,       // The physical Basys 3 crystal oscillator
    input reset_btn,        // Physical button for reset
    input analog_in_pin,    // Physical pin reading the 1-bit Delta-Sigma stream
    output [15:0] led_out   // The 16 physical LEDs on the board
);

    // -------------------------------------------------------------
    // 1. The Clock Divider (100 MHz -> 512 kHz)
    // 100,000,000 / 512,000 = 195.31. We will divide by 195.
    // -------------------------------------------------------------
    reg [7:0] clk_counter = 0;
    reg clk_512k = 0;

    always @(posedge clk_100MHz) begin
        if (clk_counter >= 97) begin  // 195 / 2 = 97 (Half period)
            clk_512k <= ~clk_512k;
            clk_counter <= 0;
        end else begin
            clk_counter <= clk_counter + 1;
        end
    end

    // -------------------------------------------------------------
    // 2. The Input Translator (1-bit Physical -> 64-bit Decimal Math)
    // -------------------------------------------------------------
    wire [63:0] filter_input;
    // If pin is high, feed +1.0 (Hex: 3FF0000000000000). If low, feed -1.0 (Hex: BFF0000000000000)
    assign filter_input = (analog_in_pin == 1'b1) ? 64'h3FF0000000000000 : 64'hBFF0000000000000;

    // -------------------------------------------------------------
    // 3. Instantiating Your Simulink Filter
    // -------------------------------------------------------------
    wire ce_out;
    wire signed [35:0] filter_output;

    Digital_Decimation_Filter u_Digital_Decimation_Filter (
        .clk(clk_512k),             // Fed by our custom slow clock
        .reset(reset_btn),          // Tied to physical button
        .clk_enable(1'b1),          // Always enabled
        .In1(filter_input),         // Translated 64-bit input
        .ce_out(ce_out),            // Hardware flag
        .Out1(filter_output)        // The 36-bit pristine signal
    );

    // -------------------------------------------------------------
    // 4. The Output Translator (36-bit Math -> 16 physical LEDs)
    // We drop the noisy lower decimal bits and display the top 16 active bits.
    // -------------------------------------------------------------
    reg [15:0] led_register;
    
    always @(posedge clk_512k) begin
        if (ce_out) begin
            // Update the LEDs only when the decimation flag fires
            led_register <= filter_output[27:12]; // Adjusted range based on integer growth
        end
    end
    
    assign led_out = led_register;

endmodule // basys3_top
