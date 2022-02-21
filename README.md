# Algoritmo de multiplicación de Booth de N bits con recodificación a N bits.
Se ha implementado este algoritmo en Verilog donde la unidad de control es un sistema secuencial calculado, 
donde se puede hacer la multiplicación de cualquier numero de N bits par.

## Implementación
Es un módulo grande llamado mult en el que dentro se encuentran 2 módulos:
- Unidad de control
- Camino de datos


## Funcionamiento básico de Verilog

- Para compilar:
```terminal
  $ iverilog -o multiplicador componentes.v cd.v uc.v mul.v multiplicador_tb.v
```

- Para simulación rápida
```terminal
  $ vvp multiplicador
```

- Para simular con el GTKWave:
```terminal
  $ gtkwave multiplicador_tb.vcd
```


## Funcionamiento básico de GTKWave
Una vez abierto es necesario darle a reload para que se "ponga en marcha".

Luego vamos arrastrando las señales que queramos visualizar.

## Resultados
Deberían ser todos CORRECTO para dar por bueno el algoritmo.
