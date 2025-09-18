`include "processor.v"

module testbench;
    reg clock = 0;
    reg [15:0] iin;
    reg resetn = 1;

    wire [15:0] bus;
    
    always #1 clock = !clock;
    initial $dumpfile("build/testeProcessador.vcd");
    initial $dumpvars(0, testbench);

    processor p(clock, iin, resetn, bus);
    
    initial begin
        #1 resetn = 1'b0;
        //Código principal vem aqui:

        #8 iin = 16'b101_000_0000011100;
        #8 iin = 16'b101_001_0000001010;
        #8 iin = 16'b001_000_001_0000000;
        #8 iin = 16'b100_000_0000000000;
        
        // Vai ate aqui
        #8 $finish;       
    end

endmodule


// Outros testes \\
/*
    # 8 iin = 16'b1010100000001111;  // ldi r2, #15
    # 8 iin = 16'b1010110000000111;  // ldi r3, #7  
    # 8 iin = 16'b0100100110000000;  // nan r2, r3
    # 8 iin = 16'b1111010100000000;  // rep r5, r2
    # 8 iin = 16'b1001010000000000;  // out r5

    #4 resetn = 1'b0;  // Dá tempo para o clear acontecer
    # 8 iin = 16'b1010010000010100;  // ldi r1, #20
    # 8 iin = 16'b1011000000001000;  // ldi r4, #8
    # 8 iin = 16'b0000011000000000;  // add r1, r4  
    # 8 iin = 16'b1011100000000101;  // ldi r6, #5
    # 8 iin = 16'b0010011100000000;  // sub r1, r6
    # 8 iin = 16'b1111110010000000;  // rep r7, r1
    # 8 iin = 16'b1001110000000000;  // out r7
*/