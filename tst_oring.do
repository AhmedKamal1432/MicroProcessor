vsim work.oring(a_oring)
# vsim work.oring(a_oring) 
# Loading std.standard
# Loading std.textio(body)
# Loading ieee.std_logic_1164(body)
# Loading work.oring(a_oring)
add wave -position insertpoint  \
sim:/oring/IR \
sim:/oring/MAR_Old \
sim:/oring/ORdst \
sim:/oring/ORindsrc \
sim:/oring/ORinddst \
sim:/oring/ORresult \
sim:/oring/OR2op \
sim:/oring/OR1opjmp \
sim:/oring/MAR
force -freeze sim:/oring/IR 100000 0
force -freeze sim:/oring/MAR_Old 000 0
run
force -freeze sim:/oring/ORdst 0 0
force -freeze sim:/oring/ORindsrc 0 0
force -freeze sim:/oring/ORinddst 0 0
force -freeze sim:/oring/ORresult 0 0
force -freeze sim:/oring/OR2op 1 0
force -freeze sim:/oring/OR1opjmp 0 0

add wave -position insertpoint  \
sim:/oring/op2MAR0 \
sim:/oring/op2MAR1 \
sim:/oring/op2MAR2 \
sim:/oring/op2MAR3 \
sim:/oring/op1MAR0 \
sim:/oring/op1MAR1 \
sim:/oring/op1MAR2 \
sim:/oring/op1MAR3 \
sim:/oring/fopMAR0 \
sim:/oring/fopMAR1 \
sim:/oring/fopMAR2 \
sim:/oring/fopMAR3 \
sim:/oring/f1op \
sim:/oring/opjmp
run

