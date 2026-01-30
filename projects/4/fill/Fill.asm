// Запускает бесконечный цикл, который отслеживает ввод с клавиатуры.
// Когда нажата любая клавиша, программа закрашивает экран в чёрный цвет,
// то есть записывает «чёрный» в каждый пиксель.
// Когда ни одна клавиша не нажата,
// экран должен быть очищен.

// создаем переменную клавиатуры (@kbdptr)
@24576
D=A
@kbdptr
M=D
// создаем переменную экрана (@screenptr)
@16384
D=A
@screenptr
M=D
// переменная храни значение конца экрана (@endscreen)
@24576
D=A
@endscreen 
M=D
(START)
@24576
D=M
@BLACKSCREEN
D;JNE // проверяем на клавиатуру на ввод (если не 0 то закаршиваем экран черным)
@WHITESCREEN
D;JEQ // проверяем на клавиатуру на ввод (если 0 то закаршиваем экран белым)
(BLACKSCREEN)
@screenptr
A=M
M=-1
@screenptr
M=M+1
@endscreen
D=M
@screenptr
D=D-M
@BLACKSCREEN
D;JNE
@16384
D=A
@screenptr
M=D
@START
0;JMP
(WHITESCREEN)
@screenptr
A=M
M=0
@screenptr
M=M+1
@endscreen
D=M
@screenptr
D=D-M
@WHITESCREEN
D;JNE
@16384
D=A
@screenptr
M=D
@START
0;JMP
