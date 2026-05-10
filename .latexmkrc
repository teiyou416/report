# Japanese (upLaTeX) + dvipdfmx
$pdf_mode = 3;
$latex = 'uplatex -synctex=1 -interaction=nonstopmode -file-line-error %O %S';
$dvipdf = 'dvipdfmx %O -o %D %S';

# Put all build artifacts in out/
$out_dir = 'out';
$aux_dir = 'out';

# Optional: quiet down latexmk output a bit
$silent = 0;

# Clean common auxiliary extensions (keeps PDF by default)
$clean_ext .= ' synctex.gz nav snm vrb bbl run.xml';
