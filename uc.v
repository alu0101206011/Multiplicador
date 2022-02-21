`timescale 1 ns / 10 ps

module uc(input wire reset, clk, q1, q0, q_menos1, output wire Carga_A, Carga_QM, Desplaza_AQ, MoM2, Resta, Fin);

  reg [2:0] state, nextstate; //Variables para los estados actual y siguiente
                              //Tres bits son suficientes para los siete estados
  reg counter; 
  //Codificación de los estados
  parameter S0 = 3'b000; //declaracion de constantes que representan estados
  parameter S1 = 3'b001;
  parameter S2 = 3'b010;
  parameter S3 = 3'b011;
  parameter S4 = 3'b100;
  parameter S5 = 3'b101;

  // Registro de estado, cambia en cada flanco ciclo de reloj por el nuevo estado o
  // se inicia en caso de flanco de subida de reset al estado inicial

  always @ (posedge clk, posedge reset)
    if (reset)
      state <= S0;
    else
      state <= nextstate;
      

  //Función de Transición
  always @(*) // (*) significa cualquier cambio en alguna variable del bloque
    case (state)
      S0: nextstate = S1;
      S1: nextstate = S2;
      S2: nextstate = S3;
      S3: nextstate = S4;
      S4: nextstate = S5;
      S5: nextstate = S5;
      default: nextstate = S0;
    endcase

  // Función de Salida
  assign Carga_A = (!((q1 & q0 & q_menos1) | (!q1 & !q0 & !q_menos1)) & ((state == S1)|(state == S3)))? 1'b1:1'b0;
  assign Carga_QM = (state == S0)? 1:0; 
  assign Desplaza_AQ = ((state == S2)|(state == S4))? 1'b1:1'b0;
  assign Resta = (q1 & ((state == S1)|(state == S3)))? 1'b1:1'b0;
  assign MoM2 = ((!q1 & q0 & q_menos1) | (q1 & !q0 & !q_menos1) & ((state == S1) | (state == S3)))? 1'b1:1'b0;
  assign Fin = (state == S5)? 1'b1:1'b0;

endmodule
