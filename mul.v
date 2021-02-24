`timescale 1 ns / 10 ps
//module cd(input wire [2:0] multiplicador, input wire [2:0] multiplicando, input wire Carga_A, Carga_QM, Desplaza_AQ, Reset_A, Resta, clk, reset, output wire q0, q_menos1, output wire [5:0] result);
//module uc(input wire q0, reset, clk, q_menos1, output wire Carga_A, Carga_QM, Desplaza_AQ, Reset_A, Resta, Fin);

module multiplicador(input wire [2:0] multiplicando, input wire [2:0] multiplicador, input wire clk, reset, output wire [5:0] result, output wire Fin);
  wire Carga_A, Carga_QM, Desplaza_AQ, Reset_A, Resta, q0, q_menos1;
 
  cd camino(multiplicador, multiplicando, Carga_A, Carga_QM, Desplaza_AQ, Reset_A, Resta, clk, reset, q0, q_menos1, result);   
  uc unidad_control(q0, reset, clk, q_menos1, Carga_A, Carga_QM, Desplaza_AQ, Reset_A, Resta, Fin);

endmodule
