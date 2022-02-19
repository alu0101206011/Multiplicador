# Multiplicador por algoritmo de Booth
Implementar el código Verilog de la unidad de Control del sistema secuencial de más abajo usando
como guía el guión Actividad Previa. Usar N=4 bits. Pensar de antemano los estados, las transiciones y
testear la unidad de control en un testbench con un caso simulado.

## Implementación


## Funcionamiento básico de Verilog

- Para compilar:
```terminal
  $ iverilog -o multiplicador componentes.v cd.v uc.v mul.v multiplicador_tb.v
```

- Para simular:
```terminal
  $ vvp multiplicador
```

## Funcionamiento básico de GTKWave
Una vez abierto es necesario darle a reload para que se "ponga en marcha".

Luego vamos arrastrando las señales que queramos visualizar.

## Resultados
Deberían ser todos CORRECTO para dar por bueno el algoritmo.
