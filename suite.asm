li   $v0, 5
syscall
add  $s0, $v0, $0
add $s1, $0, $0
addi $s2, $0, 7
add $t0, $0, $0

addi $s1, $0, 1				# appel de base if(n = 0) return 1;
suite:	li $v0, 1 
        add $a0, $s1, $0
	syscall
	
	beq $t0, $s0, done		#recursion inverse, on commence avec le cas n = 0 et on fini quand n = compteur ($t0)
	
	continu:add $t0, $t0, 1		# suite(n-1) + 2*n
		add $t1, $t0, $t0
		add $s1, $t1, $s1

	while:  slt $t1, $s1, $s2	# modulo
		bne $t1, $0, suite	# si valeur < 7, pas besoin d'appliquer le modulo
		add $s1, $s1, -7
		j while

	done: 
