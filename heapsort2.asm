main:   jal initialiser
	jal fixHeap

initialiser : 
	lui $s0, 0x1004
	ori $s0, $s0, 0x0000
	
	li   $v0, 5
        syscall
        add  $s1, $v0, $0
        
        add $s2, $0, $0
        
        for:    beq $s2, $s1, done
        	
        	sll $t0, $s2, 2         # i * 4
        	add $t0, $t0, $s0	# adresse de l'element du tableau
        	
        	lw $t1, 0($t0)		# $t1 = array[i]
        	
        	li   $v0, 5
        	syscall
        	add  $t1, $v0, $0
        	
        	sw $t1, 0($t0)		# array[i] = $t1
        	
        	addi $s2, $s2, 1
        	
        	j for
        done:
        
fixHeap:
	