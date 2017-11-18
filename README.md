# PDFDecrypt
> Version 0.0.1

__Easily download / decrypt PDFs using the command line.__

This script automatically removes passwords using [qpdf](https://github.com/qpdf/qpdf) from local or remote .pdf files and stores the files to a folder. If you use a remote file it will delete existing files prior to downloading and the new file and the passworded version will not be stored.

## Install
To install PDFDecrypt, simply clone this repository and add PDFDecrypt to your _PATH_.

```shell
git clone https://github.com/jancschaefer/PDFDecrypt.git
```

## Usage
1. Simply run ```PDFDecrypt```	in your shell.
2. You will be prompted to enter a path or URL.
3. You will be prompted to enter a password for the PDF
4. Your PDF will be decrypted, using [qpdf](https://github.com/qpdf/qpdf).
5. If you were using a local file, you will be asked whether the original file shall be removed


## Known issues
- Online files with filenames that included spaces > < or potentially other special characters will not be downloaded correctly and thus will not work when handed to qpdf.

## License
I decided to publish this via the _UNLICENSE_. Do whatever you want with this. In case you make millions of dollars with it, kindly tell me about my mistake ```¯\_(ツ)_/¯```
