# PDFDecrypt
__Download / Decrypt PDFs using the command line.__

This script automatically removes passwords using [qpdf](https://github.com/qpdf/qpdf) from local or remote .pdf files and stores the files to a folder. If you use a remote file it will delete existing files prior to downloading and the new file and the passworded version will not be stored.

## Install
To install PDFDecrypt, simply clone this repository and add PDFDecrypt to your _PATH_.

```shell
git clone https://github.com/jancschaefer/PDFDecrypt.git
```

## Usage
Simply run _PDFDecrypt_	in your shell. Afterwards you will be prompted to enter a path or URL.
