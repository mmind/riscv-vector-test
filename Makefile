all: test.elf

CFLAGS = -march=rv64gv -DPREALLOCATE=1 -static -mcmodel=medany -O2 \
	 -lm -lgcc

test.elf: main.c test.S data.h
	riscv64-linux-gnu-gcc $(CFLAGS) $^ -o $@
#	riscv64-linux-gnu-objdump -D $@ > $@.dmp

clean:
	$(RM) -rf test.elf.dmp test.elf
