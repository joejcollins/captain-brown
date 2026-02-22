% shortbook.cls
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{shortbook}[2025/10/17 A5, two-sided, section-only book class]

% Base class
\LoadClass[a5paper,12pt,twoside,openany]{memoir}

% Essentials
\RequirePackage{graphicx}
\RequirePackage{caption}
\RequirePackage{booktabs}
\usepackage[
  left=3cm,
  right=2cm,
  top=2.5cm,
  bottom=2.5cm
]{geometry}

% --- Section-only document (no chapters) ---
% Number and TOC depth at sections
\setsecnumdepth{section}
\settocdepth{section}

% Ensure sections are numbered 1,2,3... (no chapter prefix)
\makeatletter
\counterwithout{section}{chapter}
\renewcommand\thesection{\arabic{section}}
\makeatother

% Headings style
\setsecheadstyle{\large\bfseries}
\setsubsecheadstyle{\normalsize\bfseries}

% Redefine the default caption style for figures
\captionsetup[figure]{
  labelformat=empty,   % removes “Figure X:”
  justification=centering, % centers caption text
  font=small           % caption font
}

% Convenience macro for your desired figure layout
\newcommand{\bookfigure}[2][]{%
  \begin{figure}[ht]
    \centering
    \includegraphics[width=0.8\linewidth]{#1}
    \caption{#2}
  \end{figure}
}

\pagestyle{plain} % page number only
\raggedright 
\raggedbottom

% --- Title + Subtitle support ---
\makeatletter
\newcommand{\subtitle}[1]{\gdef\@subtitle{#1}}
\newcommand{\printsubtitle}{\@ifundefined{@subtitle}{}{%
  \vspace{0.6em}{\Large\itshape \@subtitle\par}}}
\makeatother

\newcommand{\ShortBookTitlePage}{
  \thispagestyle{empty}
  \begin{center}
    {\HUGE\bfseries \thetitle\par}
    \printsubtitle
    \vspace{1.2cm}
    {\large \theauthor\par}
    \vfill
    {\normalsize \thedate\par}
  \end{center}
  \cleardoublepage
  \pagenumbering{arabic}  % normal numbers
  \setcounter{page}{1}    % start from 1
}

\setlength{\parindent}{1.2em}
\setlength{\parskip}{0pt}