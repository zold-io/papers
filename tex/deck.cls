% SPDX-FileCopyrightText: Copyright (c) 2024-2025 Yegor Bugayenko
% SPDX-License-Identifier: MIT

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{deck}[8/6/2016 Slides for Zerocracy]
\LoadClass{article}
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage{lmodern}
\RequirePackage{silence}
  \WarningFilter{latex}{You have requested package}
\RequirePackage{microtype}
\RequirePackage{anyfontsize}
\RequirePackage{multicol}
\RequirePackage{setspace}
\RequirePackage[landscape]{geometry}
\RequirePackage{hyperref}
  \hypersetup{colorlinks=true,allcolors=zlightblue}
\RequirePackage{xcolor}
  \definecolor{zred}{HTML}{6A041D}
  \definecolor{zgreen}{HTML}{386150}
  \definecolor{zblue}{HTML}{27213C}
  \definecolor{zorange}{HTML}{B86F52} % FF8552
  \definecolor{zyellow}{HTML}{F9E784}
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
\RequirePackage[absolute]{textpos}\TPGrid{16}{16}
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
      \href{https://instagram.com/zerocracy}{Instagram}
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
    \normalsize\texttt{
      \zoldversion
      \qquad
      July 6, 2019
    }
  }
}
\newcommand\actor[3]{
  % #1 - TIKZ name of the element
  % #2 - Coordinates
  % #3 - Text to render
  % for example: \actor{alex}{2,2}{Alex Smith}
  \node [outer sep=-1mm] at (#2) (#1) {
    \tikz \draw [thick] (0,0) -- +(0,-0.5) % body
      -- +(-0.5,-1) % left leg
      +(0,-0.5) -- +(0.5,-1) % right leg
      +(-0.5,-0.1) -- +(0.5,-0.1) % hands
      +(0,+0.25) circle (0.25) %head
      +(0,-1) node [anchor=north] {\large\texttt{#3}};
  };
}
\newcommand\rect[4][]{
  % #1 (optional) - Additional style for the node
  % #2 - Tikz name
  % #3 - Location
  % #4 - Body
  % for example: \rect{farm}{2,2}{Farm}
  \node [outer sep=1pt] at (#3) (#2) {
    \tikz {
      \node[block, inner sep=12pt, #1] (r) {\large\texttt{#4}};
    }
  };
}
\newcommand\component[4][]{
  % #1 (optional) - Additional style for the node
  % #2 - Tikz name
  % #3 - Location
  % #4 - Body
  % for example: \component{farm}{2,2}{Farm}
  \node [outer sep=1mm] at (#3) (#2) {
    \tikz {
      \node[block, inner sep=24pt, #1] (r) {\large\texttt{#4}};
      \node[anchor=north east, outer sep=0] at (r.north east) {
        \tikz {
          \draw[thick, draw=rupborder] (0,0) rectangle +(0.5,0.5);
          \draw[thick, draw=rupborder, fill=white] (-0.15,0.1) rectangle +(0.3,0.1);
          \draw[thick, draw=rupborder, fill=white] (-0.15,0.3) rectangle +(0.3,0.1);
        }
      }
    }
  };
}
\pagecolor{white}
\date{\today}
\RequirePackage{csquotes}
\AtBeginDocument{%
  \input{_version}%
  \tikzstyle{block} = [draw=rupborder, fill=rupbody, inner sep=0.4cm, thick]%
  \tikzstyle{ln} = [->, very thick, arrows={-triangle 90}]%
  \setlength{\parindent}{0pt} % indent first line
}
\endinput
