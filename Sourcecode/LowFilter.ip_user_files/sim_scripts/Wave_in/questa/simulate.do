onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib Wave_in_opt

do {wave.do}

view wave
view structure
view signals

do {Wave_in.udo}

run -all

quit -force
