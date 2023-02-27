#!/bin/bash

archive_url="https://github.com/fmtlib/fmt/releases/download/9.1.0/fmt-9.1.0.zip"
filename="${archive_url##*/}"
src="${filename%.zip}"

if [[ ! -f $src ]]; then
    echo "downloading from $archive_url"
    curl -sSLO "$archive_url"
    echo "extracting from $filename"
    unzip -q "$filename"
fi

echo "copying ..."
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

echo "done!"
