vsim work.control_unit(arch) 
# Loading std.standard
# Loading std.textio(body)
# Loading ieee.std_logic_1164(body)
# Loading work.control_unit(arch)
# Loading ieee.numeric_std(body)
# Loading work.control_store(control_store)
# Loading work.decoding_circuit(arch_decoding_circuit)
# Loading work.my_3x8decoder(a_my_3x8decoder)
# Loading work.oring(a_oring)
# Loading work.pla_circuit(a_pla_circuit)
# Loading work.my_4x16decoder(a_my_4x16decoder)
# Loading work.my_2x4decoder(a_my_2x4decoder)
vsim work.control_unit(arch)
# vsim work.control_unit(arch) 
# Loading std.standard
# Loading std.textio(body)
# Loading ieee.std_logic_1164(body)
# Loading work.control_unit(arch)
# Loading ieee.numeric_std(body)
# Loading work.control_store(control_store)
# Loading work.decoding_circuit(arch_decoding_circuit)
# Loading work.my_3x8decoder(a_my_3x8decoder)
# Loading work.oring(a_oring)
# Loading work.pla_circuit(a_pla_circuit)
# Loading work.my_4x16decoder(a_my_4x16decoder)
# Loading work.my_2x4decoder(a_my_2x4decoder)
add wave -position end  sim:/control_unit/IR
add wave -position end  sim:/control_unit/CLK
add wave -position end  sim:/control_unit/Rst
add wave -position end  sim:/control_unit/R0in
add wave -position end  sim:/control_unit/R1in
add wave -position end  sim:/control_unit/R2in
add wave -position end  sim:/control_unit/R3in
add wave -position end  sim:/control_unit/R0out
add wave -position end  sim:/control_unit/R1out
add wave -position end  sim:/control_unit/R2out
add wave -position end  sim:/control_unit/R3out
add wave -position end  sim:/control_unit/PCout
add wave -position end  sim:/control_unit/MDRout
add wave -position end  sim:/control_unit/Zout
add wave -position end  sim:/control_unit/RSRCout
add wave -position end  sim:/control_unit/RDSTout
add wave -position end  sim:/control_unit/SOURCEout
add wave -position end  sim:/control_unit/DESTINout
add wave -position end  sim:/control_unit/TEMPout
add wave -position end  sim:/control_unit/PCin
add wave -position end  sim:/control_unit/IRin
add wave -position end  sim:/control_unit/Zin
add wave -position end  sim:/control_unit/RSRCin
add wave -position end  sim:/control_unit/RDSTin
add wave -position end  sim:/control_unit/MARin
add wave -position end  sim:/control_unit/MDRin
add wave -position end  sim:/control_unit/TEMPin
add wave -position end  sim:/control_unit/Yin
add wave -position end  sim:/control_unit/SOURCEin
add wave -position end  sim:/control_unit/DESTINin
add wave -position end  sim:/control_unit/RD
add wave -position end  sim:/control_unit/WR
add wave -position end  sim:/control_unit/CLEARY
add wave -position end  sim:/control_unit/CARRYin
add wave -position end  sim:/control_unit/FLAGS_E
add wave -position end  sim:/control_unit/ALSU_SIGNALS
add wave -position end  sim:/control_unit/CW
add wave -position end  sim:/control_unit/uAR
add wave -position end  sim:/control_unit/F1En
add wave -position end  sim:/control_unit/F2En
add wave -position end  sim:/control_unit/F1Dout
add wave -position end  sim:/control_unit/F2Dout
add wave -position end  sim:/control_unit/EnRso
add wave -position end  sim:/control_unit/EnRdo
add wave -position end  sim:/control_unit/EnRsi
add wave -position end  sim:/control_unit/EnRdi
add wave -position end  sim:/control_unit/DdstiOut
add wave -position end  sim:/control_unit/DdstoOut
add wave -position end  sim:/control_unit/DsrciOut
add wave -position end  sim:/control_unit/DsrcoOut
force -freeze sim:/control_unit/Rst 1 0
force -freeze sim:/control_unit/CLK 0 0, 1 {50 ps} -r 100
run
 run

force -freeze sim:/control_unit/Rst 0 0
force -freeze sim:/control_unit/IR 16'h0503 0
run

#    Time: 200 ps  Iteration: 0  Instance: /control_unit/CS_Label
run
run
run
