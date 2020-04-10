`include "uart/tx.v"
`include "uart/rx.v"

module uart #(
	parameter
		BaudRate = 115200,

		Start = 1,
		Data = 8,
		Parity = 0,
		Stop = 1
);

endmodule