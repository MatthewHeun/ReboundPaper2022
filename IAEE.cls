%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% International Association for Energy Economics
% LaTeX Class
% Version 1.0 (12/3/15)
%
% This template has been created by:
% Vel (vel@latextemplates.com; vel@vel.co.nz)
% http://www.LaTeXTypesetting.com
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}

\ProvidesClass{IAEE}[2015/02/28 v1.0 IAEE Article Class]

\DeclareOption{EEEPJ}{ % Define the EEEPJ option for the Economics of Energy & Environmental Policy Journal
   \newcommand{\journal}{EEEPJ}
}

\DeclareOption{EJ}{ % Define the EJ option for the Energy Journal
   \newcommand{\journal}{EJ}
}

\ProcessOptions\relax

\LoadClass{article} % Load the primary class

%----------------------------------------------------------------------------------------
%	REQUIRED PACKAGES AND MISC CONFIGURATIONS
%----------------------------------------------------------------------------------------

\usepackage{lipsum} % Package to generate dummy text throughout this template

\usepackage{ifthen} % Required for if statements

\usepackage{graphicx} % Required for including images
\graphicspath{{figures/}} % Directory in which figures are stored

\usepackage{rotating} % Required for the "sidewaysfigure" environment for rotating figures

\usepackage[round]{natbib} % Referencing with round brackets
\setlength{\bibsep}{0pt plus 0.1ex} % Reduce space between references
\ifthenelse{\equal{\journal}{EEEPJ}}{\def\bibfont{\fontsize{9pt}{11pt}\selectfont}}{} % Font size for references (EEEPJ)
\ifthenelse{\equal{\journal}{EJ}}{\def\bibfont{\fontsize{8pt}{11pt}\selectfont}}{} % Font size for references (EJ)

\ifthenelse{\equal{\journal}{EEEPJ}}{\renewcommand{\refname}{References}}{} % References section title (EEEPJ)
\ifthenelse{\equal{\journal}{EJ}}{\renewcommand{\refname}{REFERENCES}}{} % References section title (EJ)
\ifthenelse{\equal{\journal}{EEEPJ}}{\renewcommand\bibsection{\vspace{24pt}\noindent\bfseries\fontsize{10pt}{13pt}\selectfont\refname\vspace{11pt}\normalfont}}{} % Custom references section font specification (EEEPJ)

\ifthenelse{\equal{\journal}{EEEPJ}}{\newcommand{\appendixtitle}{\vspace{20pt}{\bfseries\fontsize{10pt}{13pt} \selectfont \begin{center}APPENDIX\end{center}}}}{} % Appendix section title (EEEPJ)
\ifthenelse{\equal{\journal}{EJ}}{\newcommand{\appendixtitle}{\section{Appendix}}}{} % Appendix section title (EJ)

\ifthenelse{\equal{\journal}{EEEPJ}}{\newcommand{\appendixtext}[1]{\setlength{\parindent}{12pt} #1\setlength{\parindent}{18pt}}}{} % Appendix section text (EEEPJ)
\ifthenelse{\equal{\journal}{EJ}}{\newcommand{\appendixtext}[1]{#1}}{} % Appendix section title (EJ)

\usepackage[layoutwidth=7in, layoutheight=10in, layouthoffset=0.75in, layoutvoffset=0.5in, top=42pt,bottom=42pt,left=60pt,right=48pt, twoside, letterpaper]{geometry} % Document margins and layout

\usepackage[colorlinks=false]{hyperref} % For hyperlinks in the PDF

\ifthenelse{\equal{\journal}{EEEPJ}}{\setlength{\parindent}{18pt}}{} % Paragraph indentation (EEEPJ)
\ifthenelse{\equal{\journal}{EJ}}{\setlength{\parindent}{36pt}}{} % Paragraph indentation (EJ)

\usepackage{setspace} % Required for adjusting line spacing
\setstretch{1.05} % Line spacing

\ifthenelse{\equal{\journal}{EEEPJ}}{\usepackage[bottom]{footmisc}}{} % Required for footer customisation (EEEPJ)
\ifthenelse{\equal{\journal}{EJ}}{\usepackage[norule,bottom]{footmisc}}{} % Required for footer customisation (EJ)

% Define the nohyphens environment to selectively disable hyphenation 
\makeatletter
\@ifpackageloaded{babel}
{\newenvironment{nohyphens}
{\par\sloppy\exhyphenpenalty=\@M
\@ifundefined{l@nohyphenation}
{\language=\@cclv}
{\hyphenrules{nohyphenation}}%
}
{\par
\@ifundefined{l@nohyphenation}
{}
{\endhyphenrules}%
}
}
{\newenvironment{nohyphens}
{\par\sloppy\exhyphenpenalty=\@M
\@ifundefined{l@nohyphenation}
{\language=\@cclv}
{\language=\l@nohyphenation}%
}
{\par}
}
\makeatother

\newcommand{\articletitle}[1]{\renewcommand{\articletitle}{#1}} % Define a command for storing the article title

\ifthenelse{\equal{\journal}{EEEPJ}}{\newcommand{\authors}[1]{\author{\fontsize{7pt}{13pt}\scshape #1}}}{} % Define a command for specifying the authors (EEEPJ)
\ifthenelse{\equal{\journal}{EJ}}{\newcommand{\authors}[1]{\author{\fontsize{10pt}{12pt}\itshape#1}}}{} % Define a command for specifying the authors (EJ)
\newcommand{\singleauthor}[2]{#1$^{#2}$} % Define a command for a single author within a block of authors

\newcommand{\affiliations}[1]{\renewcommand{\affiliations}{#1}} % Define a command to store author affiliations
\newcommand{\singleaffiliation}[3]{\footnotetext{\hspace{-#1}$^{#2}$#3}} % Define a command for a single affiliation within a block of affiliations
\newcommand{\printaffiliations}[1]{ % Define a command to print affiliations on the first page footer
\renewcommand{\thefootnote}{\fnsymbol{footnote}} % Stop standard footnote numbering
\affiliations % Print affiliations
\footnotetext{} % Empty line between the affiliations and regular footnotes on the first page
\renewcommand{\thefootnote}{\arabic{footnote}} % Resume standard footnote numbering
\vspace{-16pt} % Move the horizontal rule under the title up
\begin{center}\rule{\textwidth}{1pt}\end{center} % Horizontal rule under the title
}

\newcommand{\abstractblock}[4]{ % Define a command for the abstract block
\begin{abstract}
#1 % Abstract text
\ifthenelse{\equal{\journal}{EEEPJ}}{{\begin{nohyphens}\noindent\normalfont\fontsize{9pt}{11pt}\selectfont\textbf{Keywords:} #2\end{nohyphens}}}{} % Keywords (EEEPJ)
\ifthenelse{\equal{\journal}{EJ}}{{\begin{nohyphens}\noindent \fontsize{10pt}{12pt}\selectfont \textbf{Keywords:} #2\end{nohyphens}}}{} % Keywords (EJ)
\ifthenelse{\equal{\journal}{EEEPJ}}{{\begin{nohyphens}\noindent\normalfont\fontsize{9pt}{11pt}\selectfont\textbf{JEL:} #4\end{nohyphens}}}{} % JEL (EEEPJ)
\ifthenelse{\equal{\journal}{EJ}}{{\begin{nohyphens}\noindent \fontsize{10pt}{12pt}\selectfont \textbf{JEL:} #4\end{nohyphens}}}{} % JEL (EJ)
\ifthenelse{\equal{\journal}{EEEPJ}}{{\vspace{5pt}\fontsize{8pt}{14pt}\selectfont\normalfont\hfill \href{#3}{#3}}}{} % URL (EEEPJ)
\ifthenelse{\equal{\journal}{EJ}}{{\vspace{5pt}\fontsize{8pt}{14pt}\selectfont\hfill \href{#3}{#3}}}{} % URL (EJ)
\end{abstract}
}

%----------------------------------------------------------------------------------------
%	CAPTION CUSTOMIZATION
%----------------------------------------------------------------------------------------

\usepackage{caption} % Required for customizing captions

\DeclareCaptionFormat{hrule}{#1#2#3\vspace{-6pt}\rule{\linewidth}{1pt}\vspace{2pt}} % Define a caption format with a rule under the caption - used for figure captions
\ifthenelse{\equal{\journal}{EEEPJ}}{\captionsetup[table]{labelfont={bf,sc},labelsep=newline,justification=raggedright,  font={}}}{} % Table caption set up (EEEPJ)
\ifthenelse{\equal{\journal}{EJ}}{\captionsetup[table]{labelfont={bf},labelsep=colon,justification=raggedright,  font={bf}}}{} % Table caption set up (EJ)
\captionsetup[figure]{labelfont={bf},labelsep=colon,justification=raggedright, singlelinecheck=off, font={small,bf}, format=hrule} % Specify the figure caption style
\setlength{\abovecaptionskip}{2pt} % Whitespace above captions

%----------------------------------------------------------------------------------------
%	FONTS
%----------------------------------------------------------------------------------------
 
\usepackage{newtxtext} % Times New Roman font (text)
\usepackage{newtxmath} % Times New Roman font (math)

\usepackage[utf8]{inputenc} % Required for inputting international characters
\usepackage[T1]{fontenc} % Output font encoding for international characters

\usepackage{microtype} % Slightly tweak font spacing for aesthetics

%----------------------------------------------------------------------------------------
%	ABSTRACT
%----------------------------------------------------------------------------------------

\usepackage{abstract} % Allows abstract customization

\renewcommand{\abstractname}{abstract} % Redefine the default "Abstract" title to "abstract" for small caps
\setlength{\abstitleskip}{-16pt} % Move the "Abstract" closer to the abstract
\setlength{\absleftindent}{36pt} % Left abstract indent
\setlength{\absrightindent}{36pt} % Right abstract indent

\ifthenelse{\equal{\journal}{EEEPJ}}{\renewcommand{\abstractnamefont}{\vspace{-10pt}\fontsize{11pt}{21pt}\selectfont\scshape}}{} % Abstract title (EEEPJ)
\ifthenelse{\equal{\journal}{EJ}}{\renewcommand{\abstractnamefont}{\vspace{-10pt}\fontsize{10pt}{15pt}\selectfont\bfseries\scshape}}{} % Abstract title (EJ)

\ifthenelse{\equal{\journal}{EEEPJ}}{\renewcommand{\abstracttextfont}{\noindent\fontsize{10pt}{12pt}\selectfont\itshape}}{} % Abstract text (EEEPJ)
\ifthenelse{\equal{\journal}{EJ}}{\renewcommand{\abstracttextfont}{\noindent\fontsize{9pt}{11pt}\selectfont}}{} % Abstract text (EJ)

%----------------------------------------------------------------------------------------
%	SECTION TITLES
%----------------------------------------------------------------------------------------

\usepackage{titlesec} % Allows customization of titles

\ifthenelse{\equal{\journal}{EEEPJ}}{\titleformat{\section}{\bfseries\fontsize{10pt}{13pt}\selectfont\centering}{\thesection.~}{0em}{\uppercase}}{} % Change the look of the section titles (EEEPJ)
\ifthenelse{\equal{\journal}{EJ}}{\titleformat{\section}{\bfseries\fontsize{10pt}{13pt}\selectfont}{\thesection.~}{0em}{\uppercase}}{} % Change the look of the section titles (EJ)
\ifthenelse{\equal{\journal}{EEEPJ}}{\titlespacing*{\section}{0pt}{19pt}{11pt}[0pt]}{} % Spacing around the section titles (EEEPJ)
\ifthenelse{\equal{\journal}{EJ}}{\titlespacing*{\section}{0pt}{12pt}{13pt}[0pt]}{} % Spacing around the section titles (EJ)

\ifthenelse{\equal{\journal}{EEEPJ}}{\titleformat{\subsection}{\bfseries\fontsize{10pt}{13pt}\selectfont\centering}{\thesubsection~}{0pt}{}}{} % Change the look of the subsection titles (EEEPJ)
\ifthenelse{\equal{\journal}{EJ}}{\titleformat{\subsection}{\bfseries\fontsize{10pt}{13pt}\selectfont}{\thesubsection~}{0pt}{}}{} % Change the look of the subsection titles (EJ)
\ifthenelse{\equal{\journal}{EEEPJ}}{\titlespacing*{\subsection}{0pt}{13pt}{5.5pt}}{} % Spacing around the subsection titles (EEEPJ)
\ifthenelse{\equal{\journal}{EJ}}{\titlespacing*{\subsection}{0pt}{12pt}{13pt}}{} % Spacing around the subsection titles (EJ)

\ifthenelse{\equal{\journal}{EEEPJ}}{\titleformat{\subsubsection}{\itshape\fontsize{10pt}{13pt}\selectfont\centering}{\thesubsubsection~}{0pt}{}}{} % Change the look of the subsubsection titles (EEEPJ) 
\ifthenelse{\equal{\journal}{EJ}}{\titleformat{\subsubsection}{\itshape\fontsize{10pt}{13pt}\selectfont}{\thesubsubsection~}{0pt}{}}{} % Change the look of the subsubsection titles (EJ)
\ifthenelse{\equal{\journal}{EEEPJ}}{\titlespacing*{\subsubsection}{0pt}{13pt}{5.5pt}}{} % Spacing around the subsubsection titles (EEEPJ)
\ifthenelse{\equal{\journal}{EJ}}{\titlespacing*{\subsubsection}{0pt}{12pt}{12pt}}{} % Spacing around the subsubsection titles (EJ)

\ifthenelse{\equal{\journal}{EEEPJ}}{\titleformat{\paragraph}{\itshape\fontsize{10pt}{13pt}\selectfont}{\thesubsubsection~}{0pt}{}}{} % Change the look of the paragraph titles (EEEPJ)
\ifthenelse{\equal{\journal}{EEEPJ}}{\titlespacing*{\paragraph}{0pt}{13pt}{5.5pt}}{} % Spacing around the paragraph titles (EEEPJ)

%----------------------------------------------------------------------------------------
%	HEADERS AND FOOTERS
%----------------------------------------------------------------------------------------

\usepackage{fancyhdr} % Headers and footers

\pagestyle{fancy} % Use the default headers and footers for all pages
\fancyhead{} % Blank out the default header
\fancyfoot{} % Blank out the default footer

\ifthenelse{\equal{\journal}{EEEPJ}}{\fancyhead[LE]{\small \thepage}\fancyhead[RE]{\small \textit{Economics of Energy \& Environmental Policy}}}{} % Custom header text -even pages (EEEPJ)
\ifthenelse{\equal{\journal}{EJ}}{\fancyhead[RE]{\small \textit{\articletitle}~/~\thepage}}{} % Custom header text - even pages (EJ)

\ifthenelse{\equal{\journal}{EEEPJ}}{\fancyhead[RO]{\small \thepage}\fancyhead[LO]{\small\bfseries \articletitle}}{} % Custom header text - odd pages (EEEPJ)
\ifthenelse{\equal{\journal}{EJ}}{\fancyhead[LO]{\small \thepage~/~\textit{The Energy Journal}}}{} % Custom header text - odd pages (EJ)

\ifthenelse{\equal{\journal}{EEEPJ}}{\fancyfoot[C]{\small Copyright \textcopyright~2018 by the IAEE. All rights reserved.}}{} % Centered footer (EEEPJ)
\ifthenelse{\equal{\journal}{EJ}}{\fancyfoot[C]{}}{} % Centered footer (EJ)
\ifthenelse{\equal{\journal}{EEEPJ}}{\fancyfoot[RE]{}}{} % Footer - even pages (EEEPJ)
\ifthenelse{\equal{\journal}{EJ}}{\fancyfoot[RE]{\small Copyright \textcopyright~2018 by the IAEE. All rights reserved.}}{} % Footer - even pages (EJ)
\ifthenelse{\equal{\journal}{EEEPJ}}{\fancyfoot[LO]{}}{} % Footer - odd pages (EEEPJ)
\ifthenelse{\equal{\journal}{EJ}}{\fancyfoot[LO]{\small Copyright \textcopyright~2018 by the IAEE. All rights reserved.}}{} % Footer - odd pages (EJ)
\renewcommand{\headrulewidth}{1pt} % Disable the line under the header

\usepackage{lastpage} % Used to determine the number of pages in the document (for "Page X of Total")

%----------------------------------------------------------------------------------------
%	TITLE SECTION
%----------------------------------------------------------------------------------------

\ifthenelse{\equal{\journal}{EEEPJ}}{\title{\fontsize{18pt}{24pt}\selectfont\textbf{\articletitle}}}{} % Article title (EEEPJ)
\ifthenelse{\equal{\journal}{EJ}}{\title{\fontsize{14pt}{18pt}\selectfont\textbf{\articletitle}}}{} % Article title (EJ)

\date{\vspace{-1cm}} % Move the Abstract up slightly by getting rid of the date space