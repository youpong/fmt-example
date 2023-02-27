src="../fmt"

# mkdir fmt
for h in fmt/core.h   \
          fmt/format.h \
          fmt/format-inl.h
do
    dir=${h#/*}
    install -c -m 644 -D ${src}/include/$h $dir
done


install -c -m 644 -D ${src}/src/format.cc .
