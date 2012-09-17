# Gostscript can be installed from homebrew:
#       brew install ghostscript

# Removes the encryption from most PDF files that have an owner password set,
# as long as they do not have a "file open" password.
pdfdecrypt() {
  file=$1
  name='decrypted'$(basename ${file})
  gs -q -dNOPAUSE -dBATCH -sDEVICE=pdfwrite -sOutputFile=${name} -c .setpdfwrite -f ${file}
}
