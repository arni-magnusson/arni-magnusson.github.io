% LaTeX class for the Hafro report series

% History
% 3.2  05 Jul 2015  AM added document option [english]
% 3.1  04 Jul 2015  AM improved TOC dot spacing in \hafrochapterx, added
%                   commands \bannerenglish, \hafrochapterm, \hafrosectionx
% 3.0  16 Jun 2015  AM added commands \bannerx, \s, changed \abstracts to clear
%                   pages, changed \banner to get automatic banner, changed
%                   \pathstamp to get rid of warnings
% 2.14 10 Jun 2015  AM changed TOC dots to slanted, added command \pathstamp
% 2.13 09 Jun 2015  AM changed TOC to slanted, added package 'multicol'
% 2.12 07 Jun 2015  AM switched to frenchspacing, added commands \abstracts,
%                   \h, \hafrochapter, \hafrochapterx, \hafrosection, \p,
%                   removed command \u, added packages 'enumitem', 'rotating',
%                   'tocloft', removed package 'ulem'
% 2.11 22 Apr 2015  AM added error for en dash and curly right single quote
% 2.10 20 Apr 2015  AM changed default caption to tabcap
% 2.9  18 Apr 2015  AM added support for degree symbol
% 2.8  18 Apr 2015  AM added support for table caption on side and [H] floats
% 2.7  15 Apr 2015  AM removed package 'subscript' (not available in MiKTeX)
% 2.6  12 Apr 2015  AM added package 'subscript'
% 2.5  12 Apr 2015  AM added command \superi
% 2.4  10 Apr 2015  AM added commands \bigbanner, \figcenter, \x-commands
% 2.3  26 Sep 2014  AM increased horizontal margins
% 2.2  22 Sep 2014  AM added command \sub
% 2.1  13 Sep 2014  AM increased top margin, frenchspace captions
% 2.0  12 Sep 2014  AM converted to 1-column layout
% 1.1  12 Sep 2014  AM added package 'ulem'
% 1.0  12 Jun 2014  AM created

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{hafrorep}[2015/07/05 v3.2 Hafro report]

% ----------------------
% 1  Inherit and options
% ----------------------

% 1.1 Inherit
\LoadClass[11pt,twoside]{report}

% 1.2 Options
\DeclareOption{english}{\PassOptionsToPackage{main=english}{babel}}
\ProcessOptions

% ----------------
% 2  Load packages
% ----------------

% 2.1 Character
\RequirePackage[english,icelandic]{babel}
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}

% 2.2 Page
\RequirePackage
[a4paper,hmargin=3.0cm,vmargin={2.6cm,2.2cm},headsep=1.0cm,foot=0.5cm]{geometry}

% 2.3 Header and footer
\RequirePackage{color}
\RequirePackage{fancyhdr}

% 2.4 Table of contents
\RequirePackage{tocloft}

% 2.5 Section
\RequirePackage{tikz}
\RequirePackage{titlesec}

% 2.6 Paragraph
\RequirePackage{multicol}

% 2.7 List
\RequirePackage{enumitem}

% 2.8 Table
\RequirePackage{array}
\RequirePackage{rotating}

% 2.9 Figure
\RequirePackage{graphicx}
\RequirePackage[absolute,overlay,quiet]{textpos}

% 2.10 Caption
\RequirePackage{caption}
\RequirePackage[capbesidesep=qquad]{floatrow}

% -----------
% 3  Settings
% -----------

% 3.1 Species
\newcommand\speciesIS{}
\newcommand\speciesEN{}
\newcommand\speciesLA{}

% 3.2 Character
\frenchspacing
\DeclareUnicodeCharacter{00B0}{\ensuremath{^{\circ}}}   % degree symbol => do it
\DeclareUnicodeCharacter{2013}{\PackageError{hafrorep}  % en dash => error
  {En dash (-) not allowed.\MessageBreak Please use two hyphens (--) instead}}
\DeclareUnicodeCharacter{2019}{\PackageError{hafrorep}  % curly rsquote => error
  {Curly right single quote (') not allowed.\MessageBreak
    Please use plain apostrophe (') instead}}

% 3.3 Header and footer
\pagestyle{fancy}
\newcommand\hafroLeft{}
\newcommand\hafroRight{}
\fancyhead[LO]{\small\hafroLeft}
\fancyhead[RE]{\small\hafroRight}
\fancyhead[RO,LE]{\small\thepage}
\fancyfoot{}
\renewcommand\headrule{\color{blue}\vspace{1pt}\hrule height 2pt\vspace{-4ex}}
\renewcommand\footrule{\color{blue}\hrule height 0.8pt\vspace{1.2pt}
  \hrule height 2pt\vspace{-0.4ex}}

% 3.4 Table of contents
\renewcommand{\cftchapleader}{\cftdotfill{\cftdotsep}}
\setlength{\cftbeforechapskip}{0.9ex}

% 3.5 Section
\definecolor{ShadowColor}{gray}{0.8}
\usetikzlibrary{shadows}
\setcounter{secnumdepth}{3}
\titleformat\section{\b}{\thesection}{1.5ex}{\I{2ex}}
\titleformat\subsection{\b}{\thesubsection}{1.5ex}{\I{2ex}}
\titleformat\subsubsection{\b}{\thesubsubsection}{1.5ex}{\I{2ex}}

% 3.6 Paragraph
\setlength\columnsep{0.6cm}

% 3.7 List
\setlist{topsep=0ex,itemsep=-1ex}

% 3.8 Table
\floatsetup[table]{style=plaintop,capbesideposition={right,top}}

% 3.9 Figure
\newcommand\figwidth{0.55\textwidth}
\floatsetup[figure]{capbesideposition=right}

% 3.10 Caption
\renewcommand\thefigure{\thesection.\arabic{figure}}
\renewcommand\thetable{\thesection.\arabic{table}}
\DeclareCaptionFormat{cencap}{\frenchspacing#3\par\vspace{-1ex}}
\DeclareCaptionFormat{mapcap}{\frenchspacing#3\par\vspace{0ex}}
\DeclareCaptionFormat{figcap}{\frenchspacing#3\par\vspace{6ex}}
\DeclareCaptionFormat{tabcap}{\frenchspacing#3\par\vspace{-1.5ex}}
\captionsetup{font=footnotesize,format=tabcap}

% ----------------
% 4  Large objects
% ----------------

% 4.1 Banner
\newcommand\banner{\bannerx\thesection\speciesIS\speciesLA\par}
\newcommand\bannerenglish{\bannerx\thesection\speciesEN\speciesLA\par}
% #1 prefix, #2 icelandic, #3 foreign
\newcommand\bannerx[3]{
  ~\\[-1.4ex]\noindent
  \begin{tikzpicture}
    \filldraw [fill=white,drop shadow={opacity=1,fill=ShadowColor,
      shadow xshift=0.12,shadow yshift=-0.14,shadow scale=1.005}]
    (0,0) rectangle (\textwidth-1.15,1.15);
    \node at (0.42,0.58) [right]
    {\LARGE\b#1\hspace{1.1ex}#2\hspace{1.5ex}\normalsize\i#3};
  \end{tikzpicture}\\[-2.7ex]}

% 4.2 Big three-line banner
% #1 top, #2 middle, #3 bottom
\newcommand\bigbanner[3]{
  ~\\[-1.4ex]\noindent
  \begin{tikzpicture}
    \filldraw [fill=white,drop shadow={opacity=1,fill=ShadowColor,
      shadow xshift=0.12,shadow yshift=-0.14,shadow scale=1.005}]
    (0,0) rectangle (\textwidth-1.15,2.30);
    \node at (0.5\textwidth,0.1) [align=center,above]
    {\Large\b#1\\[0.8ex]\Large\b#2\\[0.8ex]\Large\b#3\phantom p};
  \end{tikzpicture}\\[-2.7ex]}
% The \phantom p makes space at bottom when text has no typographic descender

% 4.3 Animal painting
% #1 file, #2 width, #3 xypos
\newcommand\painting[3]{
  \begin{textblock*}{0cm}(#3)
    \includegraphics[width=#2]{figs/#1}
  \end{textblock*}}

% 4.4 Figure showing a map
% #1 file, #2 position, #3 icelandic, #4 english
\newcommand\figmap[4]{\figmapx{#1}{#2}{\speciesIS.}{#3}{\speciesEN.}{#4}}
% Low-level x-command, to override automatic caption when needed
% #1 file, #2 position, #3 boldIS, #4 normIS, #5 boldEN, #6 normEN
\newcommand\figmapx[6]{
  \begin{figure}[#2]
    \captionsetup{format=mapcap}
    \fcapside[\FBwidth]
    {\caption*{{\b#3} #4\\[1ex]
        \i{\b#5} #6}}
    {\includegraphics[width=\figwidth]{figs/#1}
      \vspace{-3ex}}
  \end{figure}}

% 4.5 Numbered figure
% #1 file, #2 label, #3 position, #4 icelandic, #5 english
\newcommand\fignum[5]{\fignumx{#1}{#2}{#3}{\speciesIS.}{#4}{\speciesEN.}{#5}}
% Low-level x-command, to override automatic caption when needed
% #1 file, #2 label, #3 position, #4 boldIS, #5 normIS, #6 boldEN, #7 normEN
\newcommand\fignumx[7]{
  \begin{figure}[#3]
    \captionsetup{format=figcap}
    \fcapside[\FBwidth]
    {\caption{Mynd \thefigure. {\b#4} #5\\[1ex]
        \i Figure \thefigure. {\b#6} #7\label{#2}}}
    {\includegraphics[width=\figwidth]{figs/#1}}
  \end{figure}}

% 4.6 Centered figure
% #1 file, #2 label, #3 pos, #4 figwidth, #5 capwidth, #6 icelandic, #7 english
\newcommand\figcenter[7]{
  \figcenterx{#1}{#2}{#3}{#4}{#5}{\speciesIS.}{#6}{\speciesEN.}{#7}}
% Low-level x-command, to override automatic caption when needed
% #1 file, #2 lab, #3 pos, #4 fwidth, #5 cwidth, #6 bIS, #7 nIS, #8 bEN, #9 nEN
\newcommand\figcenterx[9]{
  \begin{figure}[#3]
    \centering\includegraphics[width=#4]{figs/#1}
    \captionsetup{format=cencap,width=#5}
    \caption{Mynd \thefigure. {\b#6} #7\\[1ex]
      \i Figure \thefigure. {\b#8} #9}\label{#2}
  \end{figure}}

% ---------------
% 5  Small macros
% ---------------

% 5.1 Section
\renewcommand\chapter[1]{
  \begin{center}~\\[-2ex]\LARGE\b\thechapter\hspace{1.1ex}#1\end{center}}
\newcommand\chapterx[1]{\begin{center}~\\[-2ex]\LARGE\b#1\end{center}}
\newcommand\abstracts{
  \clearpage
  \bannerx\thesection\speciesIS\speciesLA\\[1em]
  \input{abs/is}
  \vspace{5em}
  \bannerx\thesection\speciesEN\speciesLA\\[1em]
  \input{abs/en}}
% #1 number, #2 icelandic, #3 english, #4 page
\newcommand\hafrochapter[4]{
  \contentsline{chapter}{\numberline{#1}#2 {\sl(#3)}}{\mdseries #4}}
\newcommand\hafrochapterm[3]{
  \contentsline{chapter}{\numberline{\mdseries #1}\mdseries #2}{\mdseries #3}}
\newcommand\hafrochapterx[3]{
  \contentsline{chapter}{\numberline{#1}#2}{\mdseries #3}}
\newcommand\hafrosection[4]{
  \contentsline{section}{\numberline{#1}#2 {\sl(#3)}}{#4}}
\newcommand\hafrosectionx[3]{\contentsline{section}{\numberline{#1}#2}{#3}}

% 5.2 Table
\newcommand\h[1]{\hspace{#1}}
\newcommand\I[1]{\rule{0pt}{#1}}
\newcommand\m{\multicolumn}
\newcommand\mc[1]{\multicolumn{1}{c}{#1}}
\newcommand\mci[1]{\multicolumn{1}{c}{\i#1}}
\newcommand\mcI[1]{\multicolumn{1}{c|}{#1}}
\newcommand\mciI[1]{\multicolumn{1}{c|}{\i#1}}
\newcommand\ml[1]{\multicolumn{1}{l}{#1}}
\newcommand\mli[1]{\multicolumn{1}{l}{\i#1}}
\newcommand\mlI[1]{\multicolumn{1}{l|}{#1}}
\newcommand\mliI[1]{\multicolumn{1}{l|}{\i#1}}
\newcommand\p[1]{\phantom{#1}}
\newcommand\s[1]{\super{#1}}
\newcommand\tabsection{3.\the\value{section}}
\newcommand\pathstamp[2][]{
  \par
  \begin{textblock*}{0cm}(3.1cm,27.43cm)
    {\ttfamily\tiny\color{gray}#1}
  \end{textblock*}
  \par
  \begin{textblock*}{0cm}(3.1cm,27.65cm)
    {\ttfamily\tiny\color{gray}#2}
  \end{textblock*}
  \par}

% 5.3 Character
\renewcommand\b{\bfseries}
\renewcommand\i{\slshape}
\newcommand\sub[1]{\textsubscript{#1}}
\newcommand\super[1]{\textsuperscript{#1}}
\newcommand\superi[1]{\textsuperscript{$\;\!$#1$\:\!\!$}}
\newcommand\f[1]{\textsuperscript{#1)}}
% Provide \textsubscript, as defined in CTAN package subscript.sty
\DeclareRobustCommand*\textsubscript[1]{\@textsubscript{\selectfont#1}}
\def\@textsubscript#1{{\m@th\ensuremath{_{\mbox{\fontsize\sf@size\z@#1}}}}}
