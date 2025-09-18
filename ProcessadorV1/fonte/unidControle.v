module unidControle (
    input [15:0] instrucao,
    input resetn,
    input [1:0] step,
    output reg [2:0] OpSelect,
    output reg [7:0] reg_enable,
    output reg A_enable,
    output reg R_enable,
    output reg clear,
    output reg [3:0] selReg,
    output reg bus_enable
);

// fios para o decodificador
wire [2:0] opcode;
wire [2:0] RX;
wire [2:0] RY;

// Instanciação do decodificador
decodificador decode (instrucao, opcode, RX, RY);

// Decodificar registrador
wire [7:0] RX_decoded;
decode_reg reg_decoder (RX, RX_decoded);

// Codigos para operações
parameter ADD = 3'b000;
parameter SUB = 3'b001;
parameter NAN = 3'b010;
parameter OUT = 3'b100;
parameter LDI = 3'b101;
parameter REP = 3'b111;

// Bloco principal
always @(*) begin
    // Reset das saidas
    OpSelect = 3'b000;
    reg_enable = 8'b00000000;
    A_enable = 1'b0;
    R_enable = 1'b0;
    selReg = 4'b0000;
    bus_enable = 1'b0;
    
    if(resetn == 1'b1) begin
        clear = 1; // Reset no contador
    end else begin
        clear = 0;
        
        case(step)
            2'b00: begin
                // PRIMEIRO CICLO: Decodificação da instrução
            end
            
            2'b01: begin
                // SEGUNDO CICLO: Seleção do primeiro operando
                case(opcode)
                    ADD, SUB, NAN: begin
                        selReg = {1'b0, RX}; // Seleciona RX (primeiro operando)  
                        A_enable = 1'b1;     // Habilita escrita no registrador A
                    end
                    OUT: begin
                        selReg = {1'b0, RX}; // Prepara RX para saída
                    end
                endcase
            end
            
            2'b10: begin
                // TERCEIRO CICLO: Seleção do segundo operando e execução
                case(opcode)
                    ADD, SUB, NAN: begin
                        selReg = {1'b0, RY}; // (segundo operando)
                        OpSelect = opcode;   
                        R_enable = 1'b1;     
                    end
                    REP: begin
                        selReg = {1'b0, RY}; // RY fonte
                        OpSelect = REP;      
                        R_enable = 1'b1;    
                    end
                    LDI: begin
                        selReg = 4'b1000;    // Seleciona imediato
                        OpSelect = REP;      // Usa REP para transferir imediato
                        R_enable = 1'b1;     
                    end
                    OUT: begin
                        selReg = {1'b0, RX};
                        bus_enable = 1'b1;   
                    end
                endcase
            end
            
            2'b11: begin
                // QUARTO CICLO: Writeback
                case(opcode)
                    ADD, SUB, NAN, REP, LDI: begin
                        reg_enable = RX_decoded; // Habilita escrita no registrador destino
                        selReg = 4'b1001;        // Seleciona registrador R 
                    end
                    OUT: begin
                        selReg = {1'b0, RX};   
                        bus_enable = 1'b1;       
                    end
                endcase
            end
        endcase
    end
end

endmodule