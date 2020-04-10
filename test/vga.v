`timescale 1 ns / 100 ps

module tb;

	reg
		clk,
		reset;

	wire
		hblank, vblank,
		hsync, vsync;

	wire [11:0]
		x, y;

	vga vga0 (
		.clk(clk),
		.reset(reset),

		.hblank(hblank),
		.vblank(vblank),
		.hsync(hsync),
		.vsync(vsync),

		.x(x),
		.y(y)
	);

	always begin
		clk = 1;
		#12.5;

		clk = 0;
		#12.5;
	end

	initial begin
		$dumpfile(`VCD);
		$dumpvars(0, tb);

		\reset = 0;

		#100
		\reset = 1;

		#1.7e7
		$finish;
	end

endmodule