.data
n_string:	.asciiz	"\n Entrez la taille n du tableau: \n"
i_string:	.asciiz "\n Entrez la valeur des cases: \n"

.text
# b)
main: jal initialiser

#a)


initialiser : 
	lui $s0, 0x1004
	ori $s0, $s0, 0x0000
	
	li   $v0, 4				
	la $a0, n_string
	syscall
	
	li   $v0, 5
        syscall
        add  $s1, $v0, $0		# $s1 = longueur du tableau
        
        add $s2, $0, $0			# $s2 = index
        
        li   $v0, 4				
	la $a0, i_string
	syscall
        for:    beq $s2, $s1, done	# index = length
        	
        	sll $t0, $s2, 2         # i * 4
        	add $t0, $t0, $s0	# t0 adresse de l'element du tableau apres heap
        	
        	li   $v0, 5		# lire l'element a l'index i
        	syscall
        	add  $t1, $v0, $0	# store la valeur de la case dans t1
        	
        	sw $t1, 0($t0)		# array[i] = $t1
        	
        	addi $s2, $s2, 1	# i++
        	
        	j for
        done:
        	
