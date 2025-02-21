        @  /000
        GD /000   ; Lê X
        SB L_K    ; Conversão ASCII X-0x3030
        MM X      ; Salva X
        GD /000   ; Ignora espaços
        GD /000   ; Lê Y
        SB L_K    ; Conversão ASCII Y-0x3030
        MM Y      ; Salva Y
        AD X      ; AC = X+Y
        MM RES    ; Salva a soma
        ; Calcula dígito menos significativo (LSB)
        DV L_10
        ML L_10
        MM TMP    ; RES sem com LSB zero
        LD RES
        SB TMP    ; Subtrai TMP, ficamos apenas com o LSB
        MM LSB
        ; Checa se LSB >= A
        SB B
        JN N_VAI_1 ; Se LSB < A, não vai 1
        SC VAI_1   ; Se LSB >= A, vai 1
N_VAI_1 LD RES
        AD L_K
        PD /100
        HM /000

; Sub-rotina "vai-um"
        @ /100
VAI_1   K =0
        LD  RES
        SB  A
        AD  L_100
        MM  RES
        RS  VAI_1

; Dados
        @ /200
; X e Y
X       K /0
Y       K /0
RES     K /0
LSB     K /0
MSB     K /0
; Constantes de conversão ASCII
L_100   K /100
L_10    K /10
L_K     K /3030
TMP     K /0
A       K /A
B       K /B
