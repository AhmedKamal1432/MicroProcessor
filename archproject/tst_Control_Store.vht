vsim work.control_store(control_store)
# vsim work.control_store(control_store) 
# Loading std.standard
# Loading std.textio(body)
# Loading ieee.std_logic_1164(body)
# Loading ieee.numeric_std(body)
# Loading work.control_store(control_store)

add wave -position insertpoint  \
sim:/control_store/clk \
sim:/control_store/Add \
sim:/control_store/Control_Word \
sim:/control_store/rom

force -freeze sim:/control_store/clk 1 0, 0 {50 ps} -r 100
force -freeze sim:/control_store/Add 01010010
run 
run
force -freeze sim:/control_store/Add 01010001
run 
run
force -freeze sim:/control_store/Add 10111000
run 
run