.data 
Title: .asciiz "PROGRAM TO SOLVE QUADRATIC EQUATION IN THE FORM aX2+bX+c"
ValueA: .asciiz "\nEnter value for a: "
ValueB: .asciiz "\nEnter value for b: "
ValueC: .asciiz "\nEnter value for c: "
answerA: .asciiz "\nThe value for a =\n "
answerB: .asciiz "\nThe value for b =\n "
complexMessage: .asciiz "\nComplex root?"
zeroFloat: .float 0.0
ValueTwo: .float 2
ValueFour: .float 4

.text 
li $v0,4
la $a0,Title  #TO DISPLAY QUADRATIC TITLE
syscall

main:
lwc1 $f2, zeroFloat
lwc1 $f4, ValueTwo
lwc1 $f6, ValueFour

#ASK FOR FIRST CO-EFFICIENT A
li $v0,4
la $a0, ValueA
syscall

li $v0, 6
syscall
mov.s $f8,$f0

#ASK FOR SECOND CO-EFFICIENT B
li $v0,4
la $a0,ValueB
syscall

li $v0,6
syscall
mov.s $f10,$f0

#ASK FOR THRID CO-EFFICIENT C
li $v0,4
la $a0,ValueC
syscall

li $v0,6
syscall
mov.s $f14,$f0

mul.s $f18,$f10,$f10  #COMPUTE VALUE FOR B2
neg.s $f16,$f10  #COMPUTE VALUE FOR -B 
mul.s $f20,$f8,$f14  #COMPUTE VALUE FOR AC
mul.s $f14,$f6,$f20  #COMPUTE VALUE FOR 4AC
sub.s $f22,$f18,$f14  #COMPUTE VALUE FOR B2-4AC
mfc1 $t1,$f22
bltz $t1 displayComplexRoot
sqrt.s $f24,$f22  #COMPUTE VALUE FOR SQUARE ROOT OF(B2-4AC)
add.s $f18,$f16,$f24  #-b+sqrt(B2-4AC)
sub.s $f26,$f16,$f24  #-b-sqrt(b2-4ac)
mul.s $f20,$f4,$f8  #COMPUTE VALUE FOR 2A 
div.s $f28,$f18,$f20  #(-b+sqrt(b2-4ac))/2a
div.s $f30,$f26,$f20  #(-b-sqrt(b2-4ac))/2a

li $v0,4
la $a0,answerA
syscall

li $v0,2
add.d $f12,$f2,$f28
syscall

li $v0,4
la $a0,answerB
syscall

li $v0,2
add.d $f12,$f2,$f30
syscall

li $v0,10
syscall

displayComplexRoot:  #COMPLEX ROOT FUNCTION
li $v0,4
la $a0,complexMessage
syscall

