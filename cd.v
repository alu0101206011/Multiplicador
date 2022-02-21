`timescale 1 ns / 10 ps

module cd #(parameter SIZE = 4) (input wire [SIZE-1:0] multiplicando, multiplicador, input wire Carga_A, Carga_QM, Desplaza_AQ, MoM2, Resta, clk, reset, output wire q1, q0, q_menos1, output wire [SIZE*2-1:0] result);
  wire [SIZE+1:0] salida_sum, salida_A, salida_mux, salida_M2, salida_M; // SIZE+1 Para que no haya overflow con M2 y M
  wire [SIZE-1:0] salida_Q;
  wire carga_qmenos1, c_sumout;
  registroN #(SIZE+2) M({multiplicando[SIZE-1],multiplicando[SIZE-1],multiplicando}, 1'b0, Carga_QM, 1'b0, clk, reset, salida_M);
  registroN #(SIZE+2) M2({multiplicando[SIZE-1],multiplicando,1'b0}, 1'b0, Carga_QM, 1'b0, clk, reset, salida_M2);
  registroN_2desp #(SIZE+2) A(salida_sum, {salida_A[SIZE+1],salida_A[SIZE+1]}, Carga_A, Desplaza_AQ, clk, reset, salida_A);
  registroN_2desp #(SIZE) Q(multiplicador, salida_A[1:0], Carga_QM, Desplaza_AQ, clk, reset, salida_Q); // Necesitamos pegarle un biestable llamado q-1
  sum_restaN #(SIZE+2) sumador(salida_sum, c_sumout, salida_A, salida_mux, Resta);
  ffdc bq_menos1(clk, reset, Desplaza_AQ, salida_Q[1], q_menos1);  // Flip flop mas sencillo 
  mux2_1_M2 #(SIZE+2) muxM2oM(salida_mux, salida_M, salida_M2, MoM2);

  assign q1 = salida_Q[1];
  assign q0 = salida_Q[0];
  assign result = {salida_A[SIZE-1:0],salida_Q};
endmodule