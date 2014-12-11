vsim -gui work.decoding_circuit
# vsim -gui work.decoding_circuit 
# Loading std.standard
# Loading std.textio(body)
# Loading ieee.std_logic_1164(body)
# Loading work.decoding_circuit(arch_decoding_circuit)
# Loading work.my_3x8decoder(a_my_3x8decoder)
# Loading work.oring(a_oring)
# Loading work.pla_circuit(a_pla_circuit)
add wave  \
sim:/decoding_circuit/Next_Add \
sim:/decoding_circuit/IR \
sim:/decoding_circuit/Or_Bits \
sim:/decoding_circuit/Pla \
sim:/decoding_circuit/MAR \
sim:/decoding_circuit/ORdst \
sim:/decoding_circuit/ORindsrc \
sim:/decoding_circuit/ORinddst \
sim:/decoding_circuit/ORresult \
sim:/decoding_circuit/OR2op \
sim:/decoding_circuit/E \
sim:/decoding_circuit/temp \
sim:/decoding_circuit/MAR1 \
sim:/decoding_circuit/MAR2 

force -freeze sim:/decoding_circuit/Next_Add 00000001 0
force -freeze sim:/decoding_circuit/IR 0000010100000001 0
force -freeze sim:/decoding_circuit/Or_Bits 000 0
force -freeze sim:/decoding_circuit/Pla 0 0
run
force -freeze sim:/decoding_circuit/Next_Add 00000010 0
run
force -freeze sim:/decoding_circuit/Next_Add 00000011 0
run
force -freeze sim:/decoding_circuit/Next_Add 00000000 0
force -freeze sim:/decoding_circuit/Pla 1 0
run
force -freeze sim:/decoding_circuit/Next_Add 01010010 0
force -freeze sim:/decoding_circuit/Pla 0 0
run
force -freeze sim:/decoding_circuit/Next_Add 01110110 0
force -freeze sim:/decoding_circuit/Or_Bits 010 0
run
force -freeze sim:/decoding_circuit/Next_Add 01110111 0
force -freeze sim:/decoding_circuit/Or_Bits 000 0
run
force -freeze sim:/decoding_circuit/Or_Bits 001 0
force -freeze sim:/decoding_circuit/Next_Add 10000001 0
run
force -freeze sim:/decoding_circuit/Next_Add 10111000 0
force -freeze sim:/decoding_circuit/Or_Bits 000 0
run
force -freeze sim:/decoding_circuit/Next_Add 10111010 0
force -freeze sim:/decoding_circuit/Or_Bits 100 0
run

force -freeze sim:/decoding_circuit/Next_Add 00010000 0
run

force -freeze sim:/decoding_circuit/Next_Add 00010000 0
force -freeze sim:/decoding_circuit/Or_Bits 101 0
run

force -freeze sim:/decoding_circuit/Next_Add 00010000 0
force -freeze sim:/decoding_circuit/Or_Bits 101 0
force -freeze sim:/decoding_circuit/IR 0000000100000001 0
run

force -freeze sim:/decoding_circuit/Next_Add 00010000 0
force -freeze sim:/decoding_circuit/Or_Bits 101 0
force -freeze sim:/decoding_circuit/IR 0000100100000001 0

run
