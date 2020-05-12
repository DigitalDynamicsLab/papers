# bibliography

This repository hosts .bib files with bibliographic databases for LaTeX papers written by our Lab's members. 

These .bib files can be 

* just copied into the directory where you are writing your .tex article, or better:

* shared by multiple LaTeX sources if using the biblatek & biber instead than the old bibtex. In this case remember to
  * use *biber* instead of *bibtex* in your IDE build toolchain (ex in Texniccenter go to Build/Define build profiles... menu)
  * use the URL that points to the *raw* version of the .bib file on this GIT in the \addbibresource command, 
    that is the name of the bib file preceded by https://raw.githubusercontent.com/DigitalDynamicsLab/bibliography/master/ ,
    as in the following example:

```
\documentclass{article}

\usepackage[backend=biber]{biblatex}
\addbibresource[location=remote]{"https://raw.githubusercontent.com/DigitalDynamicsLab/bibliography/master/refsFEM.bib"}

\begin{document}

This is cited in: \cite{cosserat1909}. Good.

\printbibliography

\end{document}
```

Note for users of OVERLEAF web-based LaTeX editor: the  `\addbibresource[location=remote]{..URL..}` does not work in Overleaf, it gives a HTTP 500 error. So they must use the first method - with a more modern twist to keep things sync-ed. Just use the "Upload" menu, then "from external URL", choose the URL for example `https://raw.githubusercontent.com/DigitalDynamicsLab/bibliography/master/BibFEM.bib`, and "Refresh" the .bib link once in a while if you need. Since the .bib file is local, just use something like 

```
\usepackage[backend=biber]{biblatex}
\addbibresource{refsMBS.bib}
\addbibresource{refsFEM.bib}
...
```
