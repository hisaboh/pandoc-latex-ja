# pandoc-latex-ja
Pandoc environment with texlive full and Hiragino fonts.

## Install

```
docker pull hisaboh/pandoc-latex-ja
```

## Usage
### Start docker
```
docker run -it --mount type=bind,src=(pwd),dst=/workdir --mount type=bind,src=/System/Library/Fonts,dst=/usr/share/fonts/SystemLibraryFonts hisaboh/pandoc-latex-ja
```

### Compile markdown to pdf
```
$ pandoc -s hello.md -o hello.pdf -N\
    --pdf-engine=lualatex \
    -V documentclass:ltjarticle \
    -V luatexjapresetoptions=ipa
```

```
$ pandoc -s hello.md -o hello-hiragino.pdf -N\
    --pdf-engine=lualatex \
    -V indent=true\
    -V documentclass:ltjarticle \
    -V geometry:margin=1in \
    -F pandoc-crossref \
    -M "crossrefYaml=/usr/local/pandoc/config/crossref.yaml" \
    --listings -H /usr/local/pandoc/config/listings-setup.tex \
    -V luatexjapresetoptions=hiragino-pron
```

### mount
#### /workdir
This is your working directory.

#### /usr/share/fonts/SystemLibraryFonts
You can use Hiragino font If you are running docker on macOS.
To use Hiragino font, mount /System/Library/Fonts to /usr/share/fonts/SystemLibraryFonts, and set luatexja-preset.

```
\usepackage[hiragino-pron]{luatexja-preset}
```

#### /usr/local/texlive/2020/texmf-var/luatex-cache
Persistent font cache volume can makes compile faster.