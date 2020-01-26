#para crear la version (statica) de 32 bits:

mkdir build32s
cd build32s
../configure --disable-shared --enable-static ABI=32
make -j4

#para crear la version (dinamica) de 32 bits:

mkdir build32d
cd build32d
../configure --disable-static --enable-shared ABI=32
make -j4

#versiones de 64 bits, cambiar ABI=64
