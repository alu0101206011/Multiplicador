`timescale 1 ns / 10 ps

module multiplicador #(parameter SIZE = 4) (input wire [SIZE-1:0] multiplicando, multiplicador, input wire clk, reset, output wire [SIZE*2-1:0] result, output wire Fin);
  wire Carga_A, Carga_QM, Desplaza_AQ, Reset_A, Resta, q0, q_menos1, MoM2;
 
  cd #(SIZE) camino (multiplicando, multiplicador, Carga_A, Carga_QM, Desplaza_AQ, MoM2, Resta, clk, reset, q1, q0, q_menos1, result);   
  uc #(SIZE) unidad_control(reset, clk, q1, q0, q_menos1, Carga_A, Carga_QM, Desplaza_AQ, MoM2, Resta, Fin);
endmodule
