main:   jal initialiser
	jal swap
	jal getLeftChildIndex
	jal getRightChildIndex

# initialiser un tableau de 10 element [0,1,2,3,4,5,6,7,8,9] (pour test)
initialiser :   lui $s0, 0x1004
		ori $s0, $s0, 0x0000
	
		addi $s1, $0, 10
        
        	add $s2, $0, $0
        
        for:    beq $s2, $s1, done
        	
        	sll $t0, $s2, 2         # i * 4
        	add $t0, $t0, $s0	# adresse de l'element du tableau
        	
        	addi $s2, $s2, 1
        	
        	sw $s2, 0($t0)		# array[i] = $t1
        	
        	j for
        done:
	
# $t0 = i ; $t1 = j
swap:   
	li   $v0, 5		# lire le premier des deux item a swap
        syscall
        add  $t0, $v0, $0
	sll $t0, $t0, 2		# i * 4
	add $t0, $t0, $s0	# adresse du premier element a swap
	
	li   $v0, 5		# lire le second item a swap
        syscall
        add  $t1, $v0, $0
	sll $t1, $t1, 2		# j * 4
	add $t1, $t1, $s0	# adresse de du deuxieme element a swap
	
	# swap les elements
	lw $t2, 0($t0)
	lw $t3, 0($t1)
	
	sw $t2, 0($t1)
	sw $t3, 0($t0)
     
# $s1 = left child index
getLeftChildIndex:      
			li   $v0, 5		# lire l'index pour lequel il faut trouver le left child
        		syscall
        		add  $t1, $v0, $0
			add $t1, $t1, $t1
			addi $t1, $t1, 1	# index du left child
	
			sll $t1, $t1, 2		# i * 4
			add $t1, $t1, $s0	# adresse du left child
			
			li $v0, 1		# imprimer l'adresse du left child
             		add $a0, $t1, $0
			syscall
			
# $s2 = right left child
getRightChildIndex:     
			li   $v0, 5		# lire l'index pour lequel il faut trouver le right child
        		syscall
        		add  $t2, $v0, $0
			add $t2, $t2, $t2
			addi $t2, $t2, 2	# index du right child
	
			sll $t2, $t2, 2		# i * 4
			add $t2, $t2, $s0	# adresse du right child
			
			li $v0, 1 		# imprimer l'adresse du right child
             		add $a0, $t2, $0
			syscall
