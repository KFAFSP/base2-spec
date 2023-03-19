# `base2-spec`

This repository contains the specification of the Base2 IR abstraction.

## Building

The `base2-spec` project is built using **latexmk** and **lualatex**.
The recommended build command line is:

```sh
# Build.
latexmk base2-spec.tex \
    -lualatex \
    -synctex=1 \
    -shell-escape \
    -interaction=nonstopmode \
    -file-line-error \
    -pdf
```

## License

This project is licensed under the ISC license.
