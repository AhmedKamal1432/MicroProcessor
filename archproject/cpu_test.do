vsim work.cpu(arch)
# vsim work.cpu(arch) 
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
add wave -position insertpoint  \
sim:/cpu/CLK \
sim:/cpu/Rst \
sim:/cpu/IR \
sim:/cpu/buss \
sim:/cpu/ADD \
sim:/cpu/mdrINPUT \
sim:/cpu/ramIN \
sim:/cpu/ALSU_SIGNALS \
sim:/cpu/True_Flags \
sim:/cpu/AfromY \
sim:/cpu/Yin \
sim:/cpu/R33out 
add wave  \
sim:/cpu/CU/uAR
add wave \
sim:/cpu/CW \
sim:/cpu/R0in \
sim:/cpu/R1in \
sim:/cpu/R2in \
sim:/cpu/R3in \
sim:/cpu/R0out \
sim:/cpu/R1out \
sim:/cpu/R2out \
sim:/cpu/R3out \
sim:/cpu/PCout \
sim:/cpu/MDRout \
sim:/cpu/Zout \
sim:/cpu/RSRCout \
sim:/cpu/RDSTout \
sim:/cpu/SOURCEout \
sim:/cpu/DESTINout \
sim:/cpu/TEMPout \
sim:/cpu/PCin \
sim:/cpu/IRin \
sim:/cpu/Zin \
sim:/cpu/RSRCin \
sim:/cpu/RDSTin \
sim:/cpu/MARin \
sim:/cpu/MDRin \
sim:/cpu/TEMPin \
sim:/cpu/SOURCEin \
sim:/cpu/DESTINin \
sim:/cpu/RD \
sim:/cpu/WR \
sim:/cpu/CLEARY \
sim:/cpu/CARRYin \
sim:/cpu/FLAGS_E \
sim:/cpu/ramOUT \
sim:/cpu/Z \
sim:/cpu/R00out \
sim:/cpu/R11out \
sim:/cpu/R22out \
sim:/cpu/Srcout \
sim:/cpu/Destout \
sim:/cpu/Tout \
sim:/cpu/Z_value_out \
sim:/cpu/Flags \
sim:/cpu/mdrENABLE \
sim:/cpu/MFC \
sim:/cpu/CLRY


force -freeze sim:/cpu/CLK 1 0, 0 {50 ps} -r 100
force -freeze sim:/cpu/Rst 1 0
run
force -freeze sim:/cpu/Rst 0 0
run
