# Diretórios
DIR = build
SRC_DIR = fonte

# Arquivos
SRC = testbench.v
OUTPUT = $(DIR)/output
VCD = $(DIR)/testeProcessador.vcd

all: run

$(DIR):
	@mkdir -p $(DIR)

$(OUTPUT): $(SRC) | $(DIR)
	@echo "Compilando..."
	@iverilog -I$(SRC_DIR) -o $(OUTPUT) $(SRC)

run: $(OUTPUT)
	@vvp $(OUTPUT)

wave: run
	@echo "Abrindo GTKWave..."
	@gtkwave $(VCD)

clean:
	@echo "Limpando..."
	@rm -rf $(DIR)

.PHONY: all run wave clean

