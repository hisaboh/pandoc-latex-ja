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

**mount**
- **/workdir**
    This is your working directory.
- **/usr/local/texlive/2020/texmf-var/luatex-cache**
Persistent font cache volume can makes compile faster.
- **/usr/share/fonts/SystemLibraryFonts**
You can use Hiragino font If you are running docker on macOS.
To use Hiragino font, mount /System/Library/Fonts to /usr/share/fonts/SystemLibraryFonts, and set luatexja-preset.

### Compile

#### Compile with ipa fonts
```
$ pandoc -s sample.md -o sample-ipa.pdf -N\
    --pdf-engine=lualatex \
    -F pandoc-crossref \
    --listings -H /usr/local/pandoc/config/listings-setup.tex \
    -V luatexjapresetoptions=ipa
```

#### Compile with Hiragino fonts
```
$ pandoc -s sample.md -o sample-hiragino.pdf -N\
    --pdf-engine=lualatex \
    -F pandoc-crossref \
    --listings -H /usr/local/pandoc/config/listings-setup.tex \
    -V luatexjapresetoptions=hiragino-pron
```
