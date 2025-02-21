@ /000
         SC FATORIAL  ; Chama a sub-rotina fatorial
         HM /000      ; Halt

@ /200
FATORIAL K  =0        ; Início da sub-rotina fatorial
LOOP     LD RES       ; AC = mem[102] e início do laço
         ML N         ; AC *= N
         MM RES       ; mem[102] = AC
         LD N         ; AC = N
         SB ONE       ; AC--
         MM N         ; N = AC
         JZ RET_FAT   ; Se N == 0, termina a sub-rotina
         JN ZERO      ; Se N < 0, vamos tratar 0!
         JP LOOP      ; Se N != 0, voltamos para o início do laço
ZERO     LD ONE       ; Caso 0!: AC = mem[104] = 1
         MM RES       ; Caso 0!: mem[102] = AC = 1
RET_FAT  RS FATORIAL  ; Encerra sub-rotina

@ /100
N        K  =5
RES      K  =1
ONE      K  =1
