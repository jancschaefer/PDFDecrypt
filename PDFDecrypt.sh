# version 0.0.1
#setting colors and variables
RED='\033[0;31m'
NC='\033[0m' # No Color
INTERNETFILE=false
regex='(https?|ftp|file)://[-A-Za-z0-9\+&@#/%?=~_|!:,.;]*[-A-Za-z0-9\+&@#/%=~_|]'

#check for qpdf
command -v qpdf >/dev/null 2>&1 || { printf >&2 "I require qpdf but it's not installed. On Mac: install via ${RED}'brew install qpdf'${NC} Aborting.\n"; exit 1; }

function red {
	printf "${RED}$1${NC}";
}
function wl {
	printf '%*s\n' "${COLUMNS:=$(tput cols)}" '' | tr ' ' =;
}

function ccc {
	clear # cleared windows are  beautiful;
	red "PDF Password remover\n";
	wl
}

## WELCOME ##

ccc;
printf "Please Specify the ${RED}FILE${NC} to use:\n"
read v_pdffile
printf "Please Specify the ${RED}PASSWORD${NC} to use:\n"
read v_pdfpassword
ccc;
echo "Using Password:  	$v_pdfpassword"
echo "For file:  		$v_pdffile"
wl #####

if [[ $v_pdffile =~ $regex ]] # check if input is a url
then
    echo "File is URL Downloading...";

    URL="${v_pdffile##*/}"
    printf "URL is: 	"; red "$v_pdffile\n"
	printf "Filename is: 	"; red "$URL\n"
	INTERNETFILE=true
	rm $URL 2> /dev/null
	wget -q "$v_pdffile" > /dev/null
	v_pdffile="$URL"
else
    echo "FILE is no url"
fi
wl #####
printf "decrypting using "
red "qpdf"
printf "\n"
PDFtarget="${v_pdffile/pdf/unlocked.pdf}"

qpdf --decrypt --password="$v_pdfpassword" "$v_pdffile" "$PDFtarget"

if [ $INTERNETFILE = true ] # do not store original if pdf was downloaded
then
	rm "$v_pdffile";
	mv "$PDFtarget" "$v_pdffile";
	printf "File saved to: 	"; red "$v_pdffile\n";
	exit;
else
	printf "File saved to: 	"; red "$PDFtarget\n";
fi

while true ; do
    read -p "Delete original file? (y/n):" yn
    case $yn in
        [Yy]* ) rm "$v_pdffile"; mv "$PDFtarget" "$v_pdffile"; break;;
        [Nn]* ) exit;;
        * ) exit;;
    esac
done
