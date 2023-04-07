PWD_DIR=$(pwd)

autoreconf -iv

cd $PWD_DIR && mkdir -p x86 
cd $PWD_DIR/x86 && ../configure --build=aarch64-unknown-linux-gnu --host=x86_64-pc-linux-gnu && make

cd $PWD_DIR && mkdir -p windows
cd $PWD_DIR/windows && ../configure --build=aarch64-unknown-linux-gnu --host=x86_64-w64-mingw32  && make
