\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{deck}[8/6/2016 Slides for Zerocracy]
\LoadClass{article}
\RequirePackage[utf8]{inputenc}
\RequirePackage{silence}
  \WarningFilter{latex}{You have requested package}
\RequirePackage{microtype}
\RequirePackage{multicol}
\RequirePackage[landscape]{geometry}
\RequirePackage{hyperref}
  \hypersetup{colorlinks=true,allcolors=zlightblue}
\RequirePackage{xcolor}
  \definecolor{zred}{HTML}{6A041D}
  \definecolor{zgreen}{HTML}{386150}
  \definecolor{zblue}{HTML}{27213C}
  \definecolor{zlightblue}{HTML}{476C9B}
  \definecolor{rupbody}{rgb}{1,1,0.8}
  \definecolor{rupborder}{rgb}{0.6039,0,0.2}
\RequirePackage{tabularx}
\RequirePackage{tikz}
  \usetikzlibrary{shapes}
  \usetikzlibrary{arrows}
  \usetikzlibrary{shadows}
  \usetikzlibrary{trees}
  \usetikzlibrary{fit}
  \usetikzlibrary{calc}
  \usetikzlibrary{positioning}
  \usetikzlibrary{decorations.pathmorphing}
\RequirePackage{graphicx}
\RequirePackage{makecell}
\pagestyle{empty}
\newcommand\topic[3]{\vbox{\raggedright{\normalsize\colorbox{#1}{\color{white}{#2}}}\newline\footnotesize#3\vspace{4pt}}}
\newcommand\slide[1]{%
  \pagebreak\topskip0pt\vspace*{\fill}%
  \begin{center}\Huge%
  #1
  \end{center}%
  \vspace*{\fill}%
}
\newcommand\headslide[1]{%
  \slide{%
    \includegraphics[scale=1]{../images/zerocracy-logo.pdf}\\
    Zerocracy, Inc.
    \\[1em]
    \large
    #1\\
    \href{https://www.zerocracy.com}{www.zerocracy.com}
  }
}
\newcommand\tailslide{%
  \slide{%
    \Large
      \href{https://twitter.com/0crat}{Twitter}
      \quad
      \href{https://facebook.com/zerocracy}{Facebook}
      \quad
      \href{https://www.zerocracy.com/blog.html}{Blog}
    \\[1em]
    \Large
      \href{https://papers.zold.io/zerocracy-deck.pdf}{Pitch}
      \quad
      \href{https://papers.zold.io/executive-summary.pdf}{Executive Summary}
      \quad
      \href{https://papers.zold.io/features-deck.pdf}{Features}
      \quad
    \\[1em]
    \Large
      555 Bryant Str, Ste 470\\
      Palo Alto, CA 94301\\
      408.692.4742\\
      \href{mailto:team@zerocracy.com}{team@zerocracy.com}
    \\[1em]
    \normalsize\texttt{\zoldversion\qquad\today}
  }
}
\newcommand\pack[3]{
  % #1 - TIKZ name of the element
  % #2 - coordinates
  % #3 - text to render
  % for example: \pack{tickets}{2,2}{Tickets}
  \node [outer sep=1mm] at (#2) (#1) {
    \begin{tikzpicture}
      \draw
        (0,0) node [block, text=rupbody] {#3}
        +(0.07,0.07) node [block, text=rupbody] {#3}
        +(0.14,0.14) node [block] {#3};
    \end{tikzpicture}
  };
}
\newcommand\actor[3]{
  % #1 - TIKZ name of the element
  % #2 - coordinates
  % #3 - text to render
  % for example: \actor{alex}{2,2}{Alex Smith}
  \node [outer sep=-1mm] at (#2) (#1) {
    \tikz \draw [thick] (0,0) -- +(0,-0.5) % body
      -- +(-0.5,-1) % left leg
      +(0,-0.5) -- +(0.5,-1) % right leg
      +(-0.5,-0.1) -- +(0.5,-0.1) % hands
      +(0,+0.25) circle (0.25) %head
      +(0,-1) node [anchor=north] {#3};
  };
}
\pagecolor{white}
\date{\today}
\include{_version}
\AtBeginDocument{%
  \tikzstyle{block} = [draw=rupborder, fill=rupbody, inner sep=0.4cm, thick]%
  \tikzstyle{ln} = [->, very thick]%
}
\endinput
