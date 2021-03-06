% This style requires Lato and Old Standard TT.

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{style}

%%  Class loading and defaults:  %%

\LoadClass[ebook, 17pt, openany, twoside, extrafontsizes, showtrims]{memoir}

\RequireXeTeX

%%  Custom metadata:  %%

\newcommand{\draftinfo}{} % Default to empty
\newcommand{\publicationdetailsinfo}{}

%%  Checking if empty:  %%
\RequirePackage{ifmtarg}
\newcommand{\ifexpandsnotmt}[2]{\expandafter\@ifnotmtarg\expandafter{#1}{#2}}

%%  Font and language setup:  %%

\RequirePackage{fontspec, polyglossia}
\setmainlanguage[variant=uk,ordinalmonthday=false]{english}
\setmainfont{Lato}
\newfontfamily{\ostt}{Old Standard TT}
\newcommand{\subs}[1]{\raisebox{-.35ex}{\scriptsize #1}}
\newcommand{\supers}[1]{\raisebox{.7ex}{\scriptsize #1}}

\RequirePackage{metalogo}

\RequirePackage{newunicodechar}
\newunicodechar{⸺}{\makebox[2em][s]{\textemdash\hss\textemdash\hss\textemdash}} % Lato requires adjustment to remove space
\newunicodechar{⁓}{\scalebox{1.7}[1.35]{\textasciitilde}} % Not in Lato

%%  Page geometry:  %%

\setlrmarginsandblock{.875in}{.875in}{*}
\setulmarginsandblock{.875in}{.875in}{*}
\setheadfoot{\baselineskip}{34pt}
\setheaderspaces{*}{17pt}{*}
% \setstocksize{11in}{8.5in} % This sets the page up on letter stock
% \setpagecc{\paperheight}{\paperwidth}{*}  %  This centres the page on the stock
% \trimFrame
\showtrimsoff
\checkandfixthelayout[nearest]
\newlength{\smallheight}
\newlength{\smallwidth}
\setlength{\smallheight}{502.4pt} % Half an inch shorter
\setlength{\smallwidth}{282.6pt} % This gives a 9:16 ratio with the small height

%%  Empty last page:  %%

\AtEndDocument{\atendtext\cleartoevenpage[\null\thispagestyle{cleared}]\null\pagestyle{cleared}}

%%  Frame formatting:  %%

\setlength{\fboxrule}{4.5pt}
\setlength{\fboxsep}{5pt}

%%  Stamp marks:  %%

\RequirePackage[usenames,dvipsnames,svgnames,table]{xcolor}
\RequirePackage[pages=some]{background}
\newcommand{\textmark}{\backgroundsetup{
    contents={\ostt\Huge\bfseries\framebox{\MakeUppercase{\titleinfo}}},
    color={black},
    angle={24},
    opacity={1},
    scale={1},
    position={-5pc,-4pc},
    nodeanchor={north west}
}\BgThispage}

%%  List formatting:  %%

\RequirePackage[inline]{enumitem}

%%  Date/time setup:  %%

\RequirePackage[english, cleanlook]{isodate}

%%  Quotation setup:  %%

\RequirePackage[style=french,french=guillemets]{csquotes}
\DeclareQuoteStyle[guillemets]{french}{« }[» ]{ »}{« }[» ]{ »}

%%  Footnote formatting:  %%

\footmarkstyle{#1.\hfill}
\setlength{\footmarkwidth}{1.7em}
\setlength{\footmarksep}{-1.7em}
\setlength{\footparindent}{1.7em}
\setlength{\footnotesep}{\onelineskip}
\setfootins{28pt plus 17pt minus 9pt}{21pt}
\feetbelowfloat
\renewcommand{\@makefntext}[1]{\makefootmark #1}
\renewcommand{\foottextfont}{\scriptsize}

%%  Chapter formatting:  %%

\makechapterstyle{ANDY}{
	\renewcommand*{\printchaptername}{}
	\renewcommand*{\chapternamenum}{}
	\renewcommand*{\afterchapternum}{\enspace}
	\renewcommand*{\printchapternonum}{}
	\renewcommand*{\chapnumfont}{\ostt\huge\bfseries}
	\renewcommand*{\chaptitlefont}{\ostt\huge\bfseries}
	\setlength{\beforechapskip}{48pt}
	\setlength{\afterchapskip}{34pt plus 6pt minus 2pt}
}
\makechapterstyle{SANDY}{
	\renewcommand{\chapterheadstart}{\vspace*{\beforechapskip}\hspace{1.5em}\textmark}
	\renewcommand*{\printchaptername}{}
	\renewcommand*{\chapternamenum}{}
	\renewcommand*{\afterchapternum}{\enspace}
	\renewcommand*{\printchapternonum}{}
	\renewcommand*{\chapnumfont}{\ostt\huge\bfseries}
	\renewcommand*{\chaptitlefont}{\ostt\huge\bfseries}
	\setlength{\beforechapskip}{48pt}
	\setlength{\afterchapskip}{34pt plus 6pt minus 2pt}
}

\copypagestyle{chapter}{plain}
\makeevenhead{chapter}{}{\tiny\copyrightinfo}{}
\makeoddhead{chapter}{}{\tiny\copyrightinfo}{}

%%  Lettrines:  %%

\newcommand*{\lettrine}[1]{\textbf{#1}\quad}

%%  Breaks:  %%

\setlength{\pfbreakskip}{32pt}
\renewcommand*{\pfbreakdisplay}{\bigskip·\quad ·\quad ·\quad ·\quad ·\bigskip}

%%  The title:  %%

\RequirePackage{graphicx}
\renewcommand{\maketitle}{
	\pagestyle{empty}
	{\large\descriptioninfo}
	\cleartorecto
	\begin{center}
		\begin{minipage}[t]{\smallwidth}
			\parindent=0pt\centering\bfseries\ostt
			{\large~\seriesinfo~} % Spaces ensure this line is printed even if blank
			\par\bigskip
			\par\Huge\MakeUppercase{\titleinfo}
		\end{minipage}
	\end{center}
	\clearpage\null\cleartorecto
	\begin{center}
		\begin{minipage}[t][\smallheight][t]{\smallwidth}
			\parindent=0pt\centering\ostt
			\vfill
			{\large~\seriesinfo~}
			\par\bigskip\HUGE\bfseries\framebox{\MakeUppercase{\titleinfo}}
			\par\vfill
			\par{\huge \authorinfo}
			\par\vfill
			\par\vfill
			\par\vfill
			\par{\Large ⁖~\publisherinfo~\reflectbox{⁖}}
		\end{minipage}
	\end{center}
	\clearpage
}

%%  The copyright:  %%

\newcommand{\makecopyright}{
	\clearpage\null\vfill
	{
		\parindent=0pt\tiny
		\ifexpandsnotmt{\publicationdetailsinfo}{\publicationdetailsinfo\par\bigskip}
		\ifexpandsnotmt{\thecopyright}{\thecopyright\par\medskip}
		This draft compiled \today{} at \printtime.
		\par\styleinfo{} Edition, \draftinfo{}.
		\par\bigskip
		Book design by KIBI Gô.
		\par\medskip
		This work is formatted via \XeLaTeX{}.
		Body text has been set in 12pt Lato.
		Headings have been set in Old Standard TT.
		\par\bigskip
		\par\vfill
	}
}

%%  Option handling:  %%

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{memoir}}

\ProcessOptions\relax

%%  Defaults:  %%

\RequirePackage{fmtcount}
\renewcommand{\thechapter}{\padzeroes[2]{\decimal{chapter}}}
\newcommand*{\nonmaintitle}{SANDY}
\newcommand{\beforefulltext}{\renewcommand*{\nonmaintitle}{ANDY}\renewcommand{\atendtext}{}}
\setsecnumdepth{chapter}
\pagenumbering{arabic}
\openany
\pagestyle{simple}
\chapterstyle{SANDY}
\newcommand{\atendtext}{\par\vfill\centering\pagebreak[1]\null\vfill\parbox[b]{\smallwidth}{\tiny\ifexpandsnotmt{\publicationdetailsinfo}{\leavevmode\publicationdetailsinfo\nolinebreak\qquad}\ifexpandsnotmt{\thecopyright}{\thecopyright{} }Text design by KIBI Gô. This work was formatted via \XeLaTeX{}, and this draft was compiled \today{} at \printtime{}.\nolinebreak\qquad Body text has been set in 17pt Lato. Headings have been set in Old Standard TT.\nolinebreak\qquad This has been the \ordinalstring{chapter} chapter of \seriesinfo{} – \titleinfo{}. Thank you for reading.\lastlinerulefill}}
\tolerance=9999

%%  Matter handling:  %%

\newcounter{lastfmpage}
\renewcommand{\frontmatter}{
    \cleardoublepage
    \openright
    \pagenumbering{roman}
    \pagestyle{simple}
    \chapterstyle{\nonmaintitle}
    \makeevenhead{chapter}{}{}{}
    \makeoddhead{chapter}{}{}{}
}
\renewcommand{\mainmatter}{
    \cleardoublepage
    \setcounter{lastfmpage}{\value{page}}
    \pagenumbering{arabic}
    \openany
    \pagestyle{simple}
    \setcounter{chapter}{0}
    \chapterstyle{SANDY}
    \makeevenhead{chapter}{}{}{}
    \makeoddhead{chapter}{}{}{}
}
\renewcommand{\backmatter}{
    \cleardoublepage
    \pagenumbering{roman}
    \setcounter{page}{\value{lastfmpage}}
    \openright
    \addtocontents{toc}{\vspace{17pt}}
    \chapterstyle{\nonmaintitle}
    \makeevenhead{chapter}{}{}{}
    \makeoddhead{chapter}{}{}{}
}