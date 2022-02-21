`timescale 1 ns / 10 ps

module multiplicador(input wire [3:0] multiplicando, input wire [3:0] multiplicador, input wire clk, reset, output wire [7:0] result, output wire Fin);
  wire Carga_A, Carga_QM, Desplaza_AQ, Reset_A, Resta, q0, q_menos1, MoM2;
 
  cd camino(multiplicador, multiplicando, Carga_A, Carga_QM, Desplaza_AQ, MoM2, Resta, clk, reset, q1, q0, q_menos1, result);   
  uc unidad_control(reset, clk, q1, q0, q_menos1, Carga_A, Carga_QM, Desplaza_AQ, MoM2, Resta, Fin);

endmodule

//module cd(input wire [3:0] multiplicador, multiplicando, input wire Carga_A, Carga_QM, Desplaza_AQ, MoM2, Resta, clk, reset, output wire q1, q0, q_menos1, output wire [7:0] result);
//module uc(input wire reset, clk, q1, q0, q_menos1, output wire Carga_A, Carga_QM, Desplaza_AQ, MoM2, Resta, Fin);