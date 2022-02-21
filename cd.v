`timescale 1 ns / 10 ps

module cd(input wire [3:0] multiplicador, multiplicando, input wire Carga_A, Carga_QM, Desplaza_AQ, MoM2, Resta, clk, reset, output wire q1, q0, q_menos1, output wire [7:0] result);

  wire [5:0] salida_sum, salida_A, salida_mux, salida_M2, salida_M;
  wire [3:0] salida_Q;
  wire carga_qmenos1, c_sumout;
  registro6 M({multiplicando[3],multiplicando[3],multiplicando}, 1'b0, Carga_QM, 1'b0, clk, reset, salida_M);
  registro6 M2({multiplicando[3],multiplicando,1'b0}, 1'b0, Carga_QM, 1'b0, clk, reset, salida_M2);
  registro6 A(salida_sum, salida_A[5], Carga_A, Desplaza_AQ, clk, reset, salida_A);
  registro4 Q(multiplicador, salida_A[0], Carga_QM, Desplaza_AQ, clk, reset, salida_Q); // Necesitamos pegarle un biestable llamado q-1
  sum_resta6 sumador(salida_sum, c_sumout, salida_A, salida_mux, Resta);
  ffdc bq_menos1(clk, reset, Desplaza_AQ, salida_Q[0], q_menos1);  // Flip flop mas sencillo 
  mux2_1_M2 muxM2oM(salida_mux, salida_M, salida_M2, MoM2);

  assign q1 = salida_Q[1];
  assign q0 = salida_Q[0];
  assign result = {salida_A[3:0],salida_Q}; // Asignamos de uno en uno porque en A sobran 2 bits y en Q sobra 1

endmodule

// Desplaza_M siempre a 0
// Carga_M y Carga_Q pueden ser iguales porque siempre cargan a la par, A no lo hace 
// A y Q desplazan juntos
// Bit en desplazamiento de q es el bit menos significativo de A
// El c_sumout debería ser bit_en_desp de A?

// reg wire simplemente es implementación interna, cuando lo instanciemos fuera, no pasa nada si lo ponemos en un wire  1111