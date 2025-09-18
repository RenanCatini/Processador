`include "counter.v"
`include "unidControle.v"
`include "registrador.v"
`include "extensor_sinal.v"
`include "multiplexador.v"
`include "ULA.v"
`include "decodificador.v"
`include "decode_reg.v"

module processor (
    input clock,
    input [15:0] iin,
    input resetn,
    output wire [15:0] bus
);

    // Fios 
    wire [2:0] OpSelect;
    wire [7:0] reg_enable;
    wire A_enable, R_enable, clear, bus_enable;
    wire [3:0] selReg;
    wire [1:0] step;

    wire [15:0] r0_out, r1_out, r2_out, r3_out, r4_out, r5_out, r6_out, r7_out;
    wire [15:0] A_out, R_out, imm;

    wire [15:0] mux_out;
    wire [15:0] ula_out;

    // Instanciar contador
    counter contador (.clear(clear), .clock(clock), .out(step));

    // Instanciar unidade de controle
    unidControle UDC (
        iin, resetn, step, OpSelect, reg_enable,
        A_enable, R_enable, clear, selReg, bus_enable
    );

    // Instanciar registradores
    registrador r0 (clock, reg_enable[7], mux_out, r0_out);
    registrador r1 (clock, reg_enable[6], mux_out, r1_out);
    registrador r2 (clock, reg_enable[5], mux_out, r2_out);
    registrador r3 (clock, reg_enable[4], mux_out, r3_out);
    registrador r4 (clock, reg_enable[3], mux_out, r4_out);
    registrador r5 (clock, reg_enable[2], mux_out, r5_out);
    registrador r6 (clock, reg_enable[1], mux_out, r6_out);
    registrador r7 (clock, reg_enable[0], mux_out, r7_out);

    registrador A (clock, A_enable, mux_out, A_out);
    registrador R (clock, R_enable, ula_out, R_out);

    // Instanciar Extensor de sinal
    extensor_sinal extensor (iin, imm);

    // Instanciar Multiplexador
    multiplexador mux(
        r0_out, r1_out, r2_out, r3_out,
        r4_out, r5_out, r6_out, r7_out,
        R_out, imm, selReg, mux_out
    );

    // Instanciar a ULA
    ULA ula (A_out, mux_out, OpSelect, ula_out);

    // Saida do barramento
    assign bus = (bus_enable) ? mux_out : 16'b0;
endmodule