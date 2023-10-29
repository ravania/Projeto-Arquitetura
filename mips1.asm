init:
lb  x1,0xFF(x0)
addi  x3,x0,1
addi  x2,x0,0
and  x7,x1,x3
beq  x7,x3,impar
beq  x7,x2,par
impar:
addi  x6,x0,0
sb  x6, 0xFF(x0)
beq  x0, x0, init
par:
addi  x6,x0,1
sb  x6, 0xFF(x0)
beq  x0, x0, init 
