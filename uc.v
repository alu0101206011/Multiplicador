`timescale 1 ns / 10 ps

module uc #(parameter SIZE = 4) (input wire reset, clk, q1, q0, q_menos1, output wire Carga_A, Carga_QM, Desplaza_AQ, MoM2, Resta, Fin);
  reg [$clog2(SIZE+2):0] state;

  always @ (posedge clk, posedge reset)
    if (reset)
      state <= 0;
    else
      state <= state + 1;

  // Función de Salida
  assign Carga_A = (!((q1 & q0 & q_menos1) | (!q1 & !q0 & !q_menos1)) & ((state % 2 == 1)&(state !== SIZE+1)))? 1'b1:1'b0;
  assign Carga_QM = (state == 0)? 1:0; 
  assign Desplaza_AQ = ((state % 2 == 0)&(state !== 0))? 1'b1:1'b0;
  assign Resta = (q1 & ((state % 2 == 1)&(state !== SIZE+1)))? 1'b1:1'b0;
  assign MoM2 = ((!q1 & q0 & q_menos1) | (q1 & !q0 & !q_menos1) & ((state % 2 == 1)&(state !== SIZE+1)))? 1'b1:1'b0;
  assign Fin = (state == SIZE+1)? 1'b1:1'b0;

endmodule

// Estado inicial + (si tenemos 4 bits, le sumamos 4 estados más) + Fin