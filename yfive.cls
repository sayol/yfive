%TODO: TEMPLATE WRITER: SAY OL  %%
%TODO: EMAIL: say_ol@yahoo.com  %%
%TODO: WEBSITE: khtug.blogspot.com  %%
%TODO: PERSONAL BLOG: bunnybookshelf.blogspot.com  %%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{yfive}[2019/09/25]
\LoadClassWithOptions{book}
%TODO: geometry
\RequirePackage{geometry}
\geometry{%
	left=1cm,%
	right=1cm,%
	top=1.5cm,%
	bottom=1.5cm,%
	bindingoffset=0.8cm}
%TODO: math font
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{amsthm}
\RequirePackage{mathtools}
\RequirePackage{newpxmath}
%TODO: language
\RequirePackage[no-math]{fontspec}% no math font
\setmainfont[Ligatures=TeX,AutoFakeBold=0.5,AutoFakeSlant=0.25]{Khmer OS}% roman font
\setsansfont[Ligatures=TeX,AutoFakeBold=0,AutoFakeSlant=0.25]{Khmer OS Bokor}% sans serif font
\setmonofont[Ligatures=TeX,AutoFakeBold=0.5,AutoFakeSlant=0.25]{Khmer OS}% typewriter font
\XeTeXlinebreaklocale "km"% line break rule
\XeTeXlinebreakskip = 0pt plus 1pt minus 0.5pt% line break skip
%TODO: khmer number
\def\khmer#1{\expandafter\@khmer\csname c@#1\endcsname}
\def\@khmer#1{\expandafter\@@khmer\number#1\@nil}
\def\@@khmer#1{%
	\ifx#1\@nil% terminate when encounter @nil
	\else%
	  \ifcase#1 ០\or ១\or ២\or ៣\or ៤\or ៥\or ៦\or ៧\or ៨\or ៩\fi%
	  \expandafter\@@khmer% recursively map the following characters
	\fi}
\def\khmernumeral#1{\@@khmer#1\@nil}
%TODO: khmer alphabet
\def\alpkh#1{\expandafter\@alpkh\csname c@#1\endcsname}
\def\@alpkh#1{%
	\ifcase#1% zero -> none
	  \or ក\or ខ\or គ\or ឃ\or ង%
	  \or ច\or ឆ\or ជ\or ឈ\or ញ%
	  \or ដ\or ឋ\or ឌ\or ឍ\or ណ%
	  \or ត\or ថ\or ទ\or ធ\or ន%
	  \or ប\or ផ\or ព\or ភ\or ម%
	  \or យ\or រ\or ល\or វ\or ស%
	  \or ហ\or ឡ\or អ%
	\else%
	  \@ctrerr% otherwise, counter error!
	\fi}
%
\def\khmershortdate{%
	\ifnum\day<10\@khmer{0\day}\else\@khmer\day\fi%
	/\@khmer\month%
	/\@khmer\year}
\def\khmerdate{%
	\ifnum\day<10\@khmer{0\day}\else\@khmer\day\fi~%
	\ifcase\month\or%
	មករា\or%
	កុម្ភៈ\or%
	មិនា\or%
	មេសា\or%
	ឧសភា\or%
	មិថុនា\or%
	កក្កដា\or%
	សីហា\or%
	កញ្ញា\or%
	តុលា\or%
	វិច្ឆិកា\or%
	ធ្នូ\fi~%
	\@khmer\year}
%TODO: color
\RequirePackage[table]{xcolor}
\DeclareOption{black}{%
	\colorlet{xfive}{black}
	\colorlet{blue}{black}
	\colorlet{brown}{black}
	\colorlet{cyan}{black}
	\colorlet{darkgray}{black}
	\colorlet{gray}{black}
	\colorlet{green}{black}
	\colorlet{lime}{black}
	\colorlet{magenta}{black}
	\colorlet{olive}{black}
	\colorlet{orange}{black}
	\colorlet{pink}{black}
	\colorlet{purple}{black}
	\colorlet{red}{black}
	\colorlet{teal}{black}
	\colorlet{violet}{black}
	\colorlet{yellow}{black}
}
\DeclareOption{blue}{\colorlet{xfive}{blue}}
\DeclareOption{brown}{\colorlet{xfive}{brown}}
\DeclareOption{cyan}{\colorlet{xfive}{cyan}}
\DeclareOption{darkgray}{\colorlet{xfive}{darkgray}}
\DeclareOption{gray}{\colorlet{xfive}{gray}}
\DeclareOption{green}{\colorlet{xfive}{green}}
\DeclareOption{lime}{\colorlet{xfive}{lime}}
\DeclareOption{magenta}{\colorlet{xfive}{magenta}}
\DeclareOption{olive}{\colorlet{xfive}{olive}}
\DeclareOption{orange}{\colorlet{xfive}{orange}}
\DeclareOption{pink}{\colorlet{xfive}{pink}}
\DeclareOption{purple}{\colorlet{xfive}{purple}}
\DeclareOption{red}{\colorlet{xfive}{red}}
\DeclareOption{teal}{\colorlet{xfive}{teal}}
\DeclareOption{violet}{\colorlet{xfive}{violet}}
\DeclareOption{yellow}{\colorlet{xfive}{yellow!45!red}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ExecuteOptions{magenta}
\ProcessOptions\relax
%TODO: floating object
\RequirePackage{float}
%TODO: graphic
\RequirePackage{graphicx}
%TODO: table
\RequirePackage{colortbl}
\arrayrulecolor{xfive}
%TODO: picture
\RequirePackage{tikz}
\usetikzlibrary{calc}
\usetikzlibrary{angles}
\usetikzlibrary{quotes}
\usetikzlibrary{arrows.meta}
\tikzset{%
	every picture/.style={%
		line width=1pt,%
		fill=xfive,%
		draw=xfive,%
		text=blue,%
	},%
	>={Stealth[length=6pt,inset=2pt]}%
}
%TODO: paint header and footer
\RequirePackage{everypage}
\AddEverypageHook{%
	\begin{tikzpicture}[remember picture,overlay]
	\fill[top color=magenta,bottom color=white](current page.north west) rectangle ([yshift=-2cm]current page.north east);
	\fill[bottom color=magenta,top color=white](current page.south west) rectangle ([yshift=2cm]current page.south east);
	\end{tikzpicture}}
%TODO: draw box
\RequirePackage[many]{tcolorbox}
\tcbset{
	breakable,
	enhanced,
	drop lifted shadow,
	rounded corners,
	arc=1ex,
	boxrule=1pt,
	boxsep=0pt,
	left=2ex,
	right=2ex,
	top=1ex,
	bottom=1ex,
	colframe=xfive,
	colback=magenta!17!white,
	overlay={%
		\node at ([xshift=-1.25ex,yshift=-.75ex]frame.north east){\includegraphics[width=2ex]{img/rightpin.png}};%
		\node at ([xshift=1.25ex,yshift=-.75ex]frame.north west){\includegraphics[width=2ex]{img/leftpin.png}};
	}%
}
\let\emph\relax
\DeclareTextFontCommand{\emph}{\color{xfive}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%TODO: sections format
\def\thechapter{\khmer{chapter}}
\def\thesection{\khmer{section}}
\def\thesubsection{\alpkh{subsection}}
\def\theequation{\arabic{equation}}
\def\thepage{\textsf{\khmer{page}}}
\def\@seccntformat#1{\begingroup\color{xfive}\csname the#1\endcsname.\endgroup~}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%TODO: table of contents
%TODO: chapter
\def\l@chapter#1#2{%
	\ifnum \c@tocdepth >\m@ne
		\addpenalty{-\@highpenalty}%
		\vskip 1.0em \@plus\p@
		\setlength\@tempdima{1.5em}%
		\begingroup
			\parindent \z@ \rightskip \@pnumwidth
			\parfillskip -\@pnumwidth
			\leavevmode 
			\advance\leftskip\@tempdima
			\hskip -\leftskip
			\textcolor{xfive}{\sffamily \chaptername~#1}\nobreak\hfil \nobreak\hb@xt@\@pnumwidth{\hss\color{xfive}#2}\par
			\penalty\@highpenalty
		\endgroup
	\fi}
%TODO: section
\renewcommand*\l@section{\@dottedtocline{1}{2ex}{3ex}}
\renewcommand*\l@subsection{\@dottedtocline{1}{5ex}{3ex}}
\def\@pnumwidth{6ex}
\def\@dotsep{.25}
\def\@dottedtocline#1#2#3#4#5{%
	\ifnum #1>\c@tocdepth \else
	\vskip \z@ \@plus.2\p@
	{\leftskip #2\relax \rightskip \@tocrmarg \parfillskip -\rightskip
		\parindent #2\relax\@afterindenttrue
		\interlinepenalty\@M
		\leavevmode
		\@tempdima #3\relax
		\advance\leftskip \@tempdima \null\nobreak\hskip -\leftskip
		\color{xfive}\sffamily #4\nobreak
		\leaders\hbox{$\m@th
			\mkern \@dotsep mu\hbox{.}\mkern \@dotsep
			mu$}\hfill
		\nobreak
		\hb@xt@\@pnumwidth{\hfil\normalfont\color{xfive}#5}%
		\par}%
	\fi}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%TODO: part
\renewcommand*{\partname}{ផ្នែក}
%TODO: chapter
%TODO: \RequirePackage{tikz}
\def\@makechapterhead#1{%
	{\if@twocolumn\vspace*{2.5ex}\else\relax\fi%
		\parindent\z@\raggedright%
		\ifnum\c@secnumdepth>\m@ne%
		%
		\begin{tikzpicture}[overlay]
		\node [left,draw=magenta,top color=white,bottom color=magenta!50!white,line width=1pt,rounded rectangle,minimum height=6ex,inner xsep=1ex,inner ysep=.5ex] (chapbox) at (\textwidth,0) {\Large\sffamily\textcolor{xfive}{\thechapter.}~\textcolor{blue}{#1}};
		\path [draw=magenta,line width=1pt] (0,0) node[xshift=1.7ex,yshift=2ex]{\includegraphics[width=4ex]{img/leftpin.png}} -- (chapbox.west);
		\end{tikzpicture}}%
	%
	\fi\@@par\nobreak\vskip5ex}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%TODO: chapter star
\def\@makeschapterhead#1{%
	{\if@twocolumn\vspace*{2.5ex}\else\relax\fi%
		\parindent\z@\raggedright%
		\ifnum\c@secnumdepth>\m@ne%
		%
		\begin{tikzpicture}[overlay]
		\node [left,draw=magenta,top color=white,bottom color=magenta!50!white,line width=1pt,rounded rectangle,minimum height=6ex,inner xsep=1ex,inner ysep=.5ex] (chapbox) at (\textwidth,0) {\Large\sffamily\textcolor{blue}{#1}};
		\path [draw=magenta,line width=1pt] (0,0) node[xshift=1.7ex,yshift=2ex]{\includegraphics[width=4ex]{img/leftpin.png}} -- (chapbox.west);
		\end{tikzpicture}}%
	%
	\fi\@@par\nobreak\vskip5ex}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%TODO: section spacing
\long\def\section{%
	\@startsection{section}{1}{\z@}{%
		-1.0ex\@plus-.2ex\@minus-.2ex}{%
		1.5ex\@plus.2ex\@minus.2ex}{\normalfont}}
\long\def\subsection{%
	\@startsection{subsection}{2}{\z@}{%
		-1.0ex\@plus-.2ex\@minus-.2ex}{%
		1.5ex\@plus.2ex\@minus.2ex}{\normalfont}}
\long\def\subsubsection{%
	\@startsection{subsubsection}{3}{\z@}{%
		-1.0ex\@plus-.2ex\@minus-.2ex}{%
		1.5ex\@plus.2ex\@minus.2ex}{\normalfont}}
\long\def\paragraph{%
	\@startsection{paragraph}{4}{\z@}{%
		1.5ex\@plus.2ex\@minus.2ex}{-1em}{\normalfont}}
\long\def\subparagraph{%
	\@startsection{subparagraph}{4}{\parindent}{%
		1.5ex\@plus.2ex\@minus.2ex}{-1em}{\normalfont}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%TODO: section drawing
%TODO: \RequirePackage{tikz}
\def\@sect#1#2#3#4#5#6[#7]#8{%
	\ifnum #2>\c@secnumdepth
		\let\@svsec\@empty
	\else
		\refstepcounter{#1}%
		\protected@edef\@svsec{\@seccntformat{#1}\relax}%
	\fi
	\@tempskipa #5\relax
	\ifdim \@tempskipa>\z@
		\begingroup
		#6{%
			\vskip1ex\noindent%
			\begin{tikzpicture}[overlay]
			\node [right,rounded rectangle,top color=white,bottom color=magenta!50!white,minimum height=4.5ex,draw=magenta,line width=1pt,inner xsep=1ex,inner ysep=.25ex] (secbox) at (0,0) {\sffamily\@svsec\textcolor{blue}{#8}};
			\draw [draw=magenta,line width=1pt] (secbox.east) -- (\textwidth,0) node[xshift=-1ex,yshift=1ex]{\includegraphics[width=2ex]{img/rightpin.png}};
			\end{tikzpicture}
			\@@par\nobreak\vskip1ex}%
		\endgroup
		\csname #1mark\endcsname{#7}%
		\addcontentsline{toc}{#1}{%
			\ifnum #2>\c@secnumdepth \else
				\protect\numberline{\csname the#1\endcsname}%
			\fi
			#7}%
	\else
		\def\@svsechd{%
			#6{\hskip #3\relax
				\@svsec #8}%
			\csname #1mark\endcsname{#7}%
			\addcontentsline{toc}{#1}{%
				\ifnum #2>\c@secnumdepth \else
					\protect\numberline{\csname the#1\endcsname}%
				\fi
				#7}}%
	\fi
	\@xsect{#5}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%TODO: section star
%TODO: \RequirePackage{tikz}
\def\@ssect#1#2#3#4#5{%
	\@tempskipa #3\relax
	\ifdim \@tempskipa>\z@
		\begingroup
		#4{%
			\noindent%
			\begin{tikzpicture}[overlay]
			\node [right,rounded rectangle,top color=white,bottom color=magenta!50!white,minimum height=4.5ex,draw=magenta,line width=1pt,inner xsep=1ex,inner ysep=.25ex] (secbox) at (0,0) {\sffamily\textcolor{blue}{#5}};
			\draw [draw=magenta,line width=1pt] (secbox.east) -- (\textwidth,0) node[xshift=-1ex,yshift=1ex]{\includegraphics[width=2ex]{img/rightpin.png}};
			\end{tikzpicture}%
			\@@par\nobreak\vskip1ex}%
		\endgroup
	\else
		\def\@svsechd{#4{\hskip #1\relax #5}}%
	\fi
	\@xsect{#3}}
%TODO: reference
\RequirePackage{hyperref}
\hypersetup{%
	linktoc=all,%
	bookmarksnumbered,%
	bookmarksopen,%
	hidelinks}
\RequirePackage{bookmark}
\bookmarksetup{
	addtohook={%
		\ifnum\bookmarkget{level}=0%
		\bookmarksetup{color=red}%
		\fi%
		\ifnum\bookmarkget{level}=1%
		\bookmarksetup{color=blue}%
		\fi%
		\ifnum\bookmarkget{level}=2%
		\bookmarksetup{color=teal}%
		\fi}}
%TODO: enumerate
\RequirePackage[inline]{enumitem}
\RequirePackage{multicol}
\RequirePackage{pifont}
%TODO: set enumerate and itemize key for number of columns
%TODO: \RequirePackage{multicol}
\SetEnumitemKey{2}{before=\raggedcolumns\setlength{\multicolsep}{\topsep}\begin{multicols}{2},after=\end{multicols}}
\SetEnumitemKey{3}{before=\raggedcolumns\setlength{\multicolsep}{\topsep}\begin{multicols}{3},after=\end{multicols}}
\SetEnumitemKey{4}{before=\raggedcolumns\setlength{\multicolsep}{\topsep}\begin{multicols}{4},after=\end{multicols}}
\SetEnumitemKey{5}{before=\raggedcolumns\setlength{\multicolsep}{\topsep}\begin{multicols}{5},after=\end{multicols}}
\SetEnumitemKey{6}{before=\raggedcolumns\setlength{\multicolsep}{\topsep}\begin{multicols}{6},after=\end{multicols}}
%TODO: set enumerate and itemize key for numerals
%\AddEnumerateCounter{\alpkh}{\@alpkh}{\char"1788}
%\AddEnumerateCounter{\khmer}{\@khmer}{\char"17e3}
\AddEnumerateCounter{\alpkh}{\@alpkh}{ឈ}
\AddEnumerateCounter{\khmer}{\@khmer}{៣}
%TODO: enumerate keys
\SetEnumitemKey{1}{label=\protect\color{xfive}\protect\sffamily\arabic*.}
\SetEnumitemKey{a}{label=\protect\color{xfive}\protect\sffamily\alph*.}
\SetEnumitemKey{A}{label=\protect\color{xfive}\protect\sffamily\Alph*.}
\SetEnumitemKey{i}{label=\protect\color{xfive}\protect\sffamily\roman*.}
\SetEnumitemKey{I}{label=\protect\color{xfive}\protect\sffamily\Roman*.}
\SetEnumitemKey{k}{label=\protect\color{xfive}\protect\sffamily\alpkh*.}
\SetEnumitemKey{m}{label=\protect\color{xfive}\protect\sffamily\khmer*.}
%TODO: itemize keys
\SetEnumitemKey{b}{label=\protect\color{xfive}\protect\ensuremath{\bullet}}
\SetEnumitemKey{c}{label=\protect\color{xfive}\protect\ensuremath{\circ}}
\SetEnumitemKey{d}{label=\protect\color{xfive}\protect\ensuremath{\diamond}}
\SetEnumitemKey{t}{label=\protect\color{xfive}\protect\ensuremath{\triangleright}}
\SetEnumitemKey{p}{label=\protect\color{xfive}\protect\ding{43}}
\SetEnumitemKey{w}{label=\protect\color{xfive}\protect\ding{45}}
%TODO: styling enumerate
\setlist[enumerate]{%
	parsep=0pt,%
	topsep=1ex,%
	partopsep=0pt,%
	leftmargin=*,%
	itemsep=.5ex,%
	labelsep=0.5ex}
\setlist[enumerate,1]{m}
\setlist[enumerate,2]{k}
\setlist[enumerate,3]{a}
\setlist[enumerate,4]{i}
%TODO: styling itemize
\setlist[itemize]{%
	parsep=0pt,%
	topsep=1ex,%
	partopsep=0pt,%
	leftmargin=*,%
	itemsep=.5ex,%
	labelsep=.5ex}
\setlist[itemize,1]{b}
\setlist[itemize,2]{c}
\setlist[itemize,3]{d}
\setlist[itemize,4]{t}
%TODO: caption
\RequirePackage{caption}
\RequirePackage{subcaption}
\renewcommand{\thefigure}{\khmer{figure}}
\renewcommand{\thetable}{\khmer{table}}
\renewcommand{\thesubtable}{\alpkh{subtable}}
\renewcommand{\thesubfigure}{\alpkh{subfigure}}
\DeclareCaptionFont{xfive}{\color{xfive}}
\captionsetup{%
	font=small,%
	skip=0pt,%
	labelfont={xfive,sf},%
	textfont={xfive,sf},%
	labelsep=period}
\captionsetup[sub]{%
	font=small,%
	skip=0.5ex,%
	labelfont={xfive,sf},%
	textfont={xfive,sf},%
	labelsep=period}
\setlength{\intextsep}{0pt}
%TODO: name macro %%
\def\chaptername{មេរៀន}
\def\contentsname{មាតិកា}
\def\appendixname{បន្ថែម}
\def\listtablename{បញ្ជីតារាង}
\def\listfigurename{បញ្ជីរូភាព}
\def\tablename{តារាង}
\def\figurename{រូប}
\def\bibname{គន្ថនិទ្ទេស}
\def\refname{ឯកសារយោង}
\def\abstractname{សង្ខេប}
%TODO: theorem name maro
\def\lemmaname{បទគន្លិះ}
\def\theoremname{ទ្រឹស្ដីបទ}
\def\corollaryname{វិបាក}
\def\propositionname{លក្ខណៈ}
\def\definitionname{និយមន័យ}
\def\examplename{ឧទាហរណ៍}
\def\exercisename{លំហាត់}
\def\answername{ចម្លើយ}
\def\remarkname{សម្គាល់}
\def\practicename{ប្រតិបត្តិ}
\def\formulaname{រូបមន្ត}
\def\proofname{សម្រាយបញ្ជាក់}
\def\explanationname{ពន្យល់}
\allowdisplaybreaks
%TODO: change label color %%
\thm@headfont{\color{blue}\sffamily}
\def\th@remark{%
	\thm@headfont{\color{xfive}\sffamily}%
	\normalfont % body font
	\thm@preskip\topsep \divide\thm@preskip\tw@
	\thm@postskip\thm@preskip
}
%TODO: re-define proof environment %%
\renewenvironment{proof}[1][\itshape\sffamily\textcolor{blue}{\proofname}]{\par
	\pushQED{\qed}%
	\normalfont \topsep2\p@\@plus1\p@\relax
	\trivlist
	\item[\hskip\labelsep
	\color{xfive}\sffamily
	#1\@addpunct{.}]\ignorespaces
}{%
	\popQED\endtrivlist\@endpefalse
}
%TODO: re-define quite easy done symbol %%
\def\qedsymbol{\textcolor{xfive}{\ensuremath{\blacksquare}}}
%TODO: definition, example & exercise
\theoremstyle{definition}
\newtheorem{definition}{និយមន័យ}
\def\thedefinition{\khmer{definition}}
\tcolorboxenvironment{definition}{}
%
\newtheorem{example}{ឧទាហរណ៍}
\def\theexample{\khmer{example}}
\tcolorboxenvironment{example}{}
%
\newtheorem{exercise}{លំហាត់}
\def\theexercise{\khmer{exercise}}
\tcolorboxenvironment{exercise}{}
%TODO: theorem
\theoremstyle{theorem}
\newtheorem{theorem}{ទ្រឹស្ដីបទ}
\def\thetheorem{\khmer{theorem}}
\tcolorboxenvironment{theorem}{}
\tcolorboxenvironment{proof}{sharp corners,colback=cyan!45!white,boxrule=0pt}
%TODO: remark
\theoremstyle{remark}
\newtheorem{remark}{សម្គាល់}
\def\theremark{\khmer{remark}}
\tcolorboxenvironment{remark}{sharp corners,boxrule=0pt,colback=yellow!45!white}
%TODO: paint color for bibiography counter %%
\def\@biblabel#1{\textcolor{xfive}{[#1]}}
%TODO: footnote %%
\def\footnoterule{\kern -3pt\textcolor{xfive}{\hrule width \linewidth height 0.4pt}\kern 2.6pt}
\def\thefootnote{\color{xfive}\sffamily(\arabic{footnote})}
%TODO: change every inline maths to display maths %%
\everymath{\displaystyle}
%TODO: increase base line skip in display formula
\addtolength{\jot}{1pt}
%TODO: prevent book contents from vertical stretching %%
\raggedbottom
\def\preparelabel{រៀបរៀងដោយ}
\def\preparename{អូល សាយ}
\let\ps@origin\ps@plain
\def\ps@plain{%
	\let\@oddhead\@empty%
	\let\@evenhead\@oddhead%
	\def\@oddfoot{%
		\textcolor{blue}{\footnotesize\itshape\preparelabel~\preparename}%និពន្ធ និងរៀបរៀងដោយ អូល សាយ
		\hfil\tikz[baseline=-.5ex]{\node [xshift=-1ex,rounded rectangle,top color=white,bottom color=magenta!50!white,minimum height=3ex,draw=magenta,line width=1pt,inner xsep=.5ex,inner ysep=.25ex]{\parbox{6ex}{\centering\thepage}};}%
		\hfil\textcolor{blue}{\footnotesize\itshape ក្រុមអ្នកប្រើ LaTeX ជាភាសាខ្មែរ}}%
	\def\@evenfoot{%
		\textcolor{blue}{\footnotesize\itshape ក្រុមអ្នកប្រើ LaTeX ជាភាសាខ្មែរ}%
		\hfil\tikz[baseline=-.5ex]{\node [xshift=-1ex,rounded rectangle,top color=white,bottom color=magenta!50!white,minimum height=3ex,draw=magenta,line width=1pt,inner xsep=.5ex,inner ysep=.25ex]{\parbox{6ex}{\centering\thepage}};}%
		\hfil\textcolor{blue}{\footnotesize\itshape\preparelabel~\preparename}%
		}%
	}
%
\def\ps@xfive{%
	\def\@oddhead{%
		\textcolor{blue}{\footnotesize\itshape \leftmark}%
		\hfil\textcolor{blue}{\footnotesize\itshape \rightmark}}%
	\def\@evenhead{%
		\textcolor{blue}{\footnotesize\itshape \rightmark}%
		\hfil\textcolor{blue}{\footnotesize\itshape \leftmark}}%
	\def\@oddfoot{%
		\textcolor{blue}{\footnotesize\itshape\preparelabel~\preparename}%
		\hfil\tikz[baseline=-.5ex]{\node [xshift=-1ex,rounded rectangle,top color=white,bottom color=magenta!50!white,minimum height=3ex,draw=magenta,line width=1pt,inner xsep=.5ex,inner ysep=.25ex]{\parbox{6ex}{\centering\thepage}};}%
		\hfil\textcolor{blue}{\footnotesize\itshape ក្រុមអ្នកប្រើ LaTeX ជាភាសាខ្មែរ}}%
	\def\@evenfoot{%
		\textcolor{blue}{\footnotesize\itshape ក្រុមអ្នកប្រើ LaTeX ជាភាសាខ្មែរ}%
		\hfil\tikz[baseline=-.5ex]{\node [xshift=-1ex,rounded rectangle,top color=white,bottom color=magenta!50!white,minimum height=3ex,draw=magenta,line width=1pt,inner xsep=.5ex,inner ysep=.25ex]{\parbox{6ex}{\centering\thepage}};}%
		\hfil\textcolor{blue}{\footnotesize\itshape\preparelabel~\preparename}%
	}%
}
%
\pagestyle{xfive}
%
\def\arraystretch{1.25}
%
\def\baselinestretch{1.2}
\def\setminus{\ensuremath{{}-{}}}
%
\RequirePackage{cancel}
\def\CancelColor{\color{xfive}}
%
\RequirePackage{tkz-tab}
\tikzset{%
	t style/.style={draw=xfive},%
	h style/.style={pattern = north east lines,pattern color =xfive},%
	double style/.append style={draw=xfive},%
	arrow style/.style={->,draw=xfive},%
	from style/.append style={draw=xfive}}
\def\tkzTabDefaultLineWidth{1pt}
\RequirePackage{tkz-euclide}
%
\endinput