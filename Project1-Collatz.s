		.syntax     unified
		.cpu        cortex-m4
		.text

		.global		collatz
		.thumb_func
		.align
collatz:
// Your assembly code goes here
MOV R12, #0        // counter variable for later set to 0 

main:
CMP R0, #1           //compare R0 to 1
IT EQ                // If R0 is 1  
bEQ ends              // branch to the ends  

MOV R2, R0         //Put R0 into R2 to test the bit so that R0 doesn't get shifted
RORS R2, #1        //Rotate and store the Least Significant Bit as a carry
bcc even           //if the carry is 0 the number is even so branch to even function
b odd              //else branch to the odd function


even:              //In the even function lets compare 

MOV R2, #2           //Divide the number by 2
UDIV R0, R2           
ADD R12, #1         //increment the counter 
b main
 
odd:
MOV R3, #3          //if the carry bit is !0  (the orignial number is odd) do this 
MUL R0, R3          //Multiply R0 by 3
ADD R0, #1          //Add 1 to R0
ADD R12, #1         // increment the counter 
b main
 
ends: //do this once we have found m variable 

MOV R3, #4
MUL R12, R3  //multiply R12 by 4
MOV R3, #3
UDIV R12, R3 //Divide R12 by 3
MOV R3, #300
SUB R0, R3, R12  //carrying out the formula 



		bx lr
		.end
