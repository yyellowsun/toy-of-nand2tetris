// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.

//if KBD !=0 black;
(LOOP)
@KBD
D=M
@BLACK
D;JNE
@WHITE
D;JEQ
@LOOP
0;JMP

(BLACK)
@SCREEN
D=A
@i
M=D

(BLACKLOOP)
//if i==KBD goto LOOP
@i
D=M
@KBD
D=D-A
@LOOP
D;JEQ

@i
A=M
M=-1
@i
M=M+1
@BLACKLOOP
0;JMP

(WHITE)
@SCREEN
D=A
@i
M=D

(WHITELOOP)
//if i==KBD goto LOOP
@i
D=M
@KBD
D=D-A
@LOOP
D;JEQ

@i
A=M
M=0
@i
M=M+1
@WHITELOOP
0;JMP