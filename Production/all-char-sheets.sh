#!/bin/bash

gamedir=$1
game=$2
character=$3
charname=$4

mv listblue-PRINT.tex listblue-BACKUP.tex
mv listchar-PRINT.tex listchar-BACKUP.tex
mv listgreen-PRINT.tex listgreen-BACKUP.tex
mv abil-PRINT.tex abil-BACKUP.tex
rm listblue-PRINT.pdf listchar-PRINT.pdf listgreen-PRINT.pdf abil-PRINT.pdf

echo "Working on $character"

cat >listchar-PRINT.tex <<EOL

%% character sheets printed
\documentclass[listchar]{$game} %% make sure name of class is correct
\begin{document}

\c$character{}

\end{document}
EOL


cat >listblue-PRINT.tex <<EOL
\documentclass[listblue]{$game} %% make sure name of class is correct

\usepackage{array}
\usepackage{xcolor}
\usepackage{hyperref}
\usepackage{multicol}
\usepackage{ltablex}
\usepackage{tabularx}

\usepackage{enumitem}
\setlist{nosep}
\parindent=0pt


\begin{document}

\c$character{}

\end{document}
EOL


cat >listgreen-PRINT.tex <<EOL

\documentclass[listgreen]{$game} %% make sure name of class is correct

\usepackage{array}
\usepackage{xcolor}
\usepackage{hyperref}
\usepackage{multicol}
\usepackage{ltablex}
\usepackage{tabularx}

\usepackage{graphicx}

\usepackage{enumitem}
\setlist{nosep}
\parindent=0pt

\usepackage{makecell}

\begin{document}
\c$character{}

\end{document}
EOL


cat >abil-PRINT.tex <<EOL

\documentclass[abils]{$game} %% make sure name of class is correct
\begin{document}
\c$character{}

\end{document}
EOL


/mnt/c/Users/wasse/AppData/local/Programs/MiKTeX/miktex/bin/x64/pdflatex.exe -include-directory="C:/Users/wasse/Documents/GitHub/$gamedir/LaTeX/" listblue-PRINT.tex 
/mnt/c/Users/wasse/AppData/local/Programs/MiKTeX/miktex/bin/x64/pdflatex.exe -include-directory="C:/Users/wasse/Documents/GitHub/$gamedir/LaTeX/" listchar-PRINT.tex
/mnt/c/Users/wasse/AppData/local/Programs/MiKTeX/miktex/bin/x64/pdflatex.exe -include-directory="C:/Users/wasse/Documents/GitHub/$gamedir/LaTeX/" listgreen-PRINT.tex
/mnt/c/Users/wasse/AppData/local/Programs/MiKTeX/miktex/bin/x64/pdflatex.exe -include-directory="C:/Users/wasse/Documents/GitHub/$gamedir/LaTeX/" abil-PRINT.tex


mv listblue-PRINT.pdf $charname-blue.pdf
mv listgreen-PRINT.pdf $charname-green.pdf
mv abil-PRINT.pdf $charname-abil.pdf
mv listchar-PRINT.pdf $charname.pdf
echo "Done with $character"

mv listblue-BACKUP.tex listblue-PRINT.tex
mv listgreen-BACKUP.tex listgreen-PRINT.tex
mv listchar-BACKUP.tex listchar-PRINT.tex
mv abil-BACKUP.tex abil-PRINT.tex
