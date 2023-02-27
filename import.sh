#!/bin/bash

archive_url="https://github.com/fmtlib/fmt/releases/download/9.1.0/fmt-9.1.0.zip"
filename="${archive_url##*/}"
src="${filename%.zip}"

curl -sSLO "$archive_url"
unzip -q "$filename"

# include files
for h in fmt/core.h   \
         fmt/format.h \
         fmt/format-inl.h
do
    dir="${h#/*}"
    install -c -m 644 -D "${src}/include/$h" "$dir"
done

# source files
install -c -m 644 -D "${src}/src/format.cc" .
