# Processador

Este repositório reúne duas versões de um processador multiciclo de 16 bits implementado em **Verilog**, desenvolvido para a disciplina de Elementos da Interface Hardware Software. A meta é demonstrar a evolução do projeto desde uma versão inicial mais simples até uma versão com recursos adicionais e maior complexidade.

---

## 📁 Estrutura

- **ProcessadorV1/**  
  Versão básica do processador, com implementação dos componentes fundamentais: caminho de dados, unidade de controle, registradores, ALU etc. Inclui testbench, simulação e scripts de construção (Makefile), com geração de sinais de simulação (.vcd) para visualização. ([github.com](https://github.com/RenanCatini/ProcessadorV1))

- **ProcessadorV2/**  
  Versão expandida, que adiciona instruções novas como BNE (desvio condicional), OUT, HLT, LDI (imediato), operações R‑tipo (ADD, SUB, NAND), além de melhorias no formato de instruções, modularização, e clareza na descrição dos opcodes. Também dispõe de testbench, script de compilação, simulação e visualização. ([github.com](https://github.com/RenanCatini/ProcessadorV2))

---

## 🎯 Propósitos e funcionalidades

- Permitir entender os conceitos centrais de arquitetura de computador: **unidade de controle**, **caminho de dados**, **formato de instruções**, **registradores**, **operações aritméticas/complementares**, **salto condicional**, etc.
- Prover um ambiente de simulação com Makefile para facilitar compilar, executar e visualizar resultados em GTKWave. ([github.com](https://github.com/RenanCatini/ProcessadorV1))
- Comparar as duas versões para observar melhorias, refatorações e inclusão de instruções mais complexas.  

---

## ⚙️ Uso

- Para usar qualquer uma das versões: entre no diretório `ProcessadorV1` ou `ProcessadorV2`.  
- Execute os comandos de compilação (via Makefile) para gerar os arquivos de simulação. Dependendo da versão, talvez precise ajustar o memory de instruções ou inserir sequências de instrução no módulo de memória (como em V2). ([github.com](https://github.com/RenanCatini/ProcessadorV2))  
- Use GTKWave ou outro visualizador de sinais para acompanhar saídas, formas de onda, comportamento da ALU, registradores, etc.  
