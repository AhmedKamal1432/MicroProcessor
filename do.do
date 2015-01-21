vsim -gui work.cpu(arch)
# vsim -gui work.cpu(arch) 
# Loading std.standard
# Loading std.textio(body)
# Loading ieee.std_logic_1164(body)
# Loading work.cpu(arch)
# Loading work.control_unit(arch)
# Loading work.my_nreg(arch_my_nreg)
# Loading work.my_reg(a_my_reg)
# Loading ieee.numeric_std(body)
# Loading work.control_store(control_store)
# Loading work.decoding_circuit(arch_decoding_circuit)
# Loading work.my_3x8decoder(a_my_3x8decoder)
# Loading work.oring(a_oring)
# Loading work.pla_circuit(a_pla_circuit)
# Loading work.my_4x16decoder(a_my_4x16decoder)
# Loading work.my_2x4decoder(a_my_2x4decoder)
# Loading work.tri_state_buffer(arch)
# Loading work.alsu(arch4)
# Loading work.b(arch1)
# Loading work.c(arch2)
# Loading work.d(arch3)
# Loading work.a(arch10)
# Loading work.my_nadder(a_my_nadder)
# Loading work.my_adder(a_my_adder)
# Loading work.mux4(data_flow)
# Loading work.ram(syncrama)
add wave -position end  sim:/cpu/CLK
add wave -position end  sim:/cpu/Rst
add wave -position end  sim:/cpu/IR
add wave -position end  sim:/cpu/CU/uAR
add wave -position end  sim:/cpu/R00out
add wave -position end  sim:/cpu/R11out
add wave -position end  sim:/cpu/R22out
add wave -position end  sim:/cpu/R33out
add wave -position end  sim:/cpu/CW
force -freeze sim:/cpu/CLK 1 0, 0 {50 ps} -r 100
force -freeze sim:/cpu/Rst 1 0
run
force -freeze sim:/cpu/Rst 0 0
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run

run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run
run