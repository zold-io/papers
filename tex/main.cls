\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{main}[8/6/2016 Papers for Zerocracy]
\LoadClass[12pt,oneside]{article}
\RequirePackage[utf8]{inputenc}
\RequirePackage[T2A]{fontenc}
\RequirePackage{silence}
  \WarningFilter{latex}{You have requested package}
\RequirePackage{bookmark}
\RequirePackage{microtype}
\RequirePackage{amsmath}
\RequirePackage{mdframed}
\RequirePackage{pgfplots}
\usepackage[style=authoryear,sorting=nyt,backend=biber,
  hyperref=true,abbreviate=true,
  maxcitenames=1,maxbibnames=1]{biblatex}
  \renewbibmacro{in:}{}
  \addbibresource{../main.bib}
\DeclareCiteCommand{\citea}
  {\boolfalse{citetracker}\boolfalse{pagetracker}\usebibmacro{prenote}}
  {\href{\thefield{url}}{\printnames{labelname}}}
  {\multicitedelim}
  {\usebibmacro{postnote}}
\RequirePackage[cachedir=../target/minted,outputdir=../target]{minted}
  \setminted{fontsize=\small}
  \setminted{breaklines}
  \usemintedstyle{bw}
  \BeforeBeginEnvironment{minted}{\vspace{6pt}\begin{mdframed}[topline=false,rightline=false,bottomline=false,linecolor=black,linewidth=2pt]}
  \AfterEndEnvironment{minted}{\end{mdframed}}
\RequirePackage{graphicx}
\RequirePackage{xcolor}
  \definecolor{dgreen}{RGB}{62,100,62}
  \definecolor{lgreen}{RGB}{249,255,249}
  \definecolor{dred}{RGB}{139,0,0}
\newcommand\dd[1]{\colorbox{gray!30}{\texttt{#1}}}
\RequirePackage{hyperref}
  \hypersetup{colorlinks=true,allcolors=blue!40!black}
\setlength{\topskip}{6pt}
\setlength{\parindent}{0pt} % indent first line
\setlength{\parskip}{6pt} % before par
\let\oldsection\section\renewcommand\section{\newpage\oldsection}
\date{\today}
\include{_version}
\AtBeginDocument{\raggedbottom}
\endinput
