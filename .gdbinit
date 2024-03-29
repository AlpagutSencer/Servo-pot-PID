file heat.elf 
target remote | openocd -f /usr/share/openocd/scripts/interface/stlink-v2.cfg -f /usr/share/openocd/scripts/target/stm32f1x.cfg -c "gdb_port pipe; log_output openocd.log"

#target remote localhost:4444

define restart
monitor reset halt
end

define reload
monitor reset halt
monitor stm32f1x mass_erase 0
monitor program heat.elf verify
monitor reset halt
end
