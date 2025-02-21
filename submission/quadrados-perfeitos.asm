@ /000
          SC QUADRADOS ; Chama a sub-rotina do somatório de ímpares
          HM /000

@ /200
QUADRADOS K =0
          ; Atualiza o endereço para salvar o quadrado (END_N)
LOOP      LD END_N
          AD DOIS
          MM END_N
          ; Checa se chegou no endereço final para finalizar a função
          LD END_FINAL
          SB END_N
          JZ RET_QUAD
          ; Descobre o próximo quadrado somando o ímpar N ao quadrado anterior
          LD QUADRADO_N
          AD IMPAR_N
          MM QUADRADO_N
          JP END_N ; Guarda o novo quadrado
          ; Atualiza o ímpar N (IMPAR_N)
BACK      LD IMPAR_N
          AD DOIS
          MM IMPAR_N
          JP LOOP
RET_QUAD  RS QUADRADOS


@ /100 ; Quadrados perfeitos
           K =0

@ /300 ; Variáveis auxiliares
QUADRADO_N K  =0
DOIS       K  =2
IMPAR_N    K  =1
END_N      K  /9100
           JP BACK
END_FINAL  K  /9180 ; 0x100 + 64 posições (0x80)