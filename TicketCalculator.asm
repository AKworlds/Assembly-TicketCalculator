.data
prompt1: .asciiz "Age: "
prompt2: .asciiz "Tickets: "
priceLbl: .asciiz "Total: $"
dot: .asciiz "."
zero: .asciiz "0"
nl: .asciiz "\n"

.text
.globl main

main:
  # Input age
  li $v0, 4         # print "Age:"
  la $a0, prompt1
  syscall
  li $v0, 5         # read int
  syscall
  move $t0, $v0     # t0 = age

  # Input tickets
  li $v0, 4
  la $a0, prompt2
  syscall
  li $v0, 5
  syscall
  move $t1, $v0     # t1 = num tickets

  li $t2, 1000      # base = 1000 cents

  # Minor logic: if age < 18
  li $t3, 18
  blt $t0, $t3, minor

  # Senior logic: if age > 65
  li $t3, 65
  bgt $t0, $t3, senior

  # Regular: price = base × tickets
  mul $t4, $t2, $t1
  j print

minor:
  # price = (base - 100) * tickets + base (adult required)
  li $t5, 900
  mul $t4, $t5, $t1
  add $t4, $t4, $t2
  j print

senior:
  # price = base * tickets * 85 / 100
  mul $t4, $t2, $t1
  mul $t4, $t4, 85
  div $t4, $t4, 100
  j print

print:
  # print "Total: $"
  li $v0, 4
  la $a0, priceLbl
  syscall

  # Split dollars and cents
  li $t5, 100
  divu $t4, $t5
  mflo $a0    # dollars
  li $v0, 1
  syscall

  # print "."
  li $v0, 4
  la $a0, dot
  syscall

  mfhi $a0    # cents
  li $t6, 10
  blt $a0, $t6, padZero

cents:
  li $v0, 1
  syscall
  j done

padZero:
  li $v0, 4
  la $a0, zero
  syscall
  li $v0, 1
  mfhi $a0
  syscall

done:
  li $v0, 4
  la $a0, nl
  syscall

  li $v0, 10
  syscall
