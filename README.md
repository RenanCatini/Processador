# Processador Didático MIPS - V1 e V2

Este repositório contém as duas versões do projeto de um processador didático com arquitetura MIPS, desenvolvido como parte de estudos em Arquitetura e Organização de Computadores. Aqui você encontrará a evolução de um processador monociclo (V1) para uma versão com pipeline (V2).

## Sobre o Projeto

O objetivo principal deste projeto foi aplicar os conceitos teóricos de arquitetura de computadores na prática, utilizando a linguagem de descrição de hardware VHDL. O processador implementa um subconjunto do conjunto de instruções MIPS, uma arquitetura RISC clássica e amplamente utilizada para fins acadêmicos.

---

## Versões

O projeto foi dividido em duas grandes etapas, cada uma contida em seu respectivo diretório.

### ProcessorV1: Arquitetura Monociclo

A primeira versão (`ProcessadorV1`) implementa um processador MIPS funcional com uma arquitetura **monociclo**. Nessa abordagem, cada instrução é executada em um único ciclo de clock.

- **Características Principais:**
    - **Arquitetura:** Monociclo.
    - **Linguagem:** VHDL.
    - **Funcionalidades:** Implementa instruções aritméticas (add, sub), lógicas (and, or), de acesso à memória (lw, sw) e de desvio (beq).
    - **Componentes:** Unidade de Controle, Unidade Lógica Aritmética (ULA), Banco de Registradores, Memória de Instrução e Memória de Dados.

É uma excelente base para entender o funcionamento fundamental de um processador, o fluxo de dados e o papel de cada componente.

:link: **Repositório Original:** [https://github.com/RenanCatini/ProcessadorV1](https://github.com/RenanCatini/ProcessadorV1)

### ProcessorV2: Arquitetura com Pipeline

A segunda versão (`ProcessadorV2`) representa a evolução do projeto original, introduzindo uma arquitetura com **pipeline de 5 estágios**. O objetivo foi aumentar a vazão (throughput) do processador, permitindo que múltiplas instruções sejam executadas simultaneamente em diferentes estágios.

- **Melhorias e Novas Características:**
    - **Arquitetura:** Pipeline de 5 estágios (Busca, Decodificação, Execução, Acesso à Memória, Escrita).
    - **Tratamento de Conflitos:** Implementação de mecanismos para lidar com conflitos de dados (data hazards) e conflitos de controle (control hazards), essenciais para o funcionamento correto do pipeline.
    - **Desempenho:** Aumento significativo no número de instruções executadas por unidade de tempo em comparação com a versão monociclo.

Esta versão é mais complexa e demonstra técnicas avançadas de arquitetura de computadores para otimização de desempenho.

:link: **Repositório Original:** [https://github.com/RenanCatini/ProcessadorV2](https://github.com/RenanCatini/ProcessadorV2)

---

## Como Usar

Cada diretório (`ProcessadorV1` e `ProcessadorV2`) contém seus próprios arquivos de código-fonte em VHDL. Para simular ou sintetizar os projetos, utilize uma ferramenta de desenvolvimento de hardware compatível com VHDL, como:

- ModelSim
- Xilinx Vivado
- GHDL (alternativa open-source)

Consulte o conteúdo de cada diretório para obter os arquivos específicos e as entidades de nível superior (`top-level entities`) de cada projeto.

## Autor

* **Renan Catini** - [GitHub](https://github.com/RenanCatini)
