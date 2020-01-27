#
OBJ=libsomelib.so  main main_ffi
all : $(OBJ) 


# 动态库不能加 -c
libsomelib.so: somelib.c
	gcc -g -fPIC -shared -Wall $< -o $@


main: main.c
	gcc -g  -Wall -ldl $< -o $@

main_ffi: main_ffi.c
	gcc -g  -Wall -lffi -ldl $< -o $@

clean:
	-@rm *~ *.o *.so *.a $(OBJ) -rf         
	@echo "Clean OK."
