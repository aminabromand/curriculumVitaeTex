\ProvidesClass{amin-cv}[2019/01/24 CV class]
\NeedsTeXFormat{LaTeX2e}

\DeclareOption{print}{\def\@cv@print{}}
\DeclareOption*{%
	\PassOptionsToClass{\CurrentOption}{article}%
}
\ProcessOptions\relax
\LoadClass{article}

%%%%%%%%%%
% Colors %
%%%%%%%%%%

\RequirePackage{xcolor}
%\definecolor{pblue}{HTML}{0395DE}
%\definecolor{pblue}{text}{blue!40}
\definecolor{pblue}{RGB}{128, 128, 255}


%%%%%%%%%%
% Fonts  %
%%%%%%%%%%


%\RequirePackage[quiet]{fontspec}
%\RequirePackage[math-style=TeX]{unicode-math}

%\setmainfont{Georgia} 
%\setsansfont{Trebuchet MS} 
%\setmonofont{Inconsolata}
%\newcommand*{\headingfont}{\bitter\fontsize{34}{36}\mdseries\upshape}
%\newfontfamily{\headingfont}{Trebuchet MS}
\renewcommand{\familydefault}{\sfdefault}
\newcommand\headingfont[1]{{\textbf{\sffamily\Large #1}}}
\newcommand\headingfontLogo[1]{{\textbf{\sffamily\Large\color{white} #1}}}
\newcommand\subheadingfont[1]{{\textbf{\sffamily\large #1}}}
\newcommand\headingInfo[1]{\textcolor{pblue}{{\footnotesize #1}}}
\newcommand\mylogo[1]{\centering{{\textbf{\sffamily\Huge #1}}}}
\newcommand\mylogoLink[2]{\href{#1}{\centering{{\textbf{\sffamily\Huge #2}}}}}
%\headingfont{This is a note.}

%%%%%%%%%%%%%%
% Side block %
%%%%%%%%%%%%%%

\RequirePackage[absolute,overlay]{textpos}
\setlength{\TPHorizModule}{1cm}
\setlength{\TPVertModule}{1cm}
\newenvironment{aside}{
	\let\oldsection\section
	\renewcommand{\section}[1]{
		{\headingfont{\color{black} ##1}}
	}
\begin{textblock}{5}(0.0, 0.0)
	\begin{center}
		\obeycr
	}{%
		\restorecr
	\end{center}
\end{textblock}
\let\section\oldsection
}


\newcommand\headerLogo[1]{\tikz\node[circle,draw,text=white,path picture={
		\node at (path picture bounding box.center){
			\includegraphics[width=4.1cm]{#1}
		};
	}]{\makebox[3.3cm]{}};}	

%\RequirePackage[absolute,overlay]{textpos}
%\setlength{\TPHorizModule}{1cm}
%\setlength{\TPVertModule}{1cm}
%\newenvironment{aside}{%
%  \let\oldsection\section
%  \renewcommand{\section}[1]{
%    \par\vspace{\baselineskip}{\Large\headingfont\color{pblue} ##1}
%  }
%  \begin{textblock}{3.6}(2.0, 0.55)
%  \begin{flushright}
%  \obeycr
%}{%
%  \restorecr
%  \end{flushright}
%  \end{textblock}
%  \let\section\oldsection
%}



%%%%%%%%%%%%%
% Structure %
%%%%%%%%%%%%%
\RequirePackage{parskip}

\newcounter{colorCounter}
\def\@sectioncolor#1#2#3{%
	{%
		\color{%
			\ifcase\value{colorCounter}%
			pblue\else%
			pblue\fi%
		} #1#2#3%
	}%
	\stepcounter{colorCounter}%
}

\usepackage{fontawesome}
\renewcommand{\section}[2]{
	\par\vspace{\parskip}
	{%
		\makebox[0cm][r]{\headingfontLogo{#1}\hskip 1.1em}\LARGE\headingfont{\@sectioncolor #2}%
	}
\newline\textcolor{pblue}{\rule{\textwidth}{0.4pt}}
	\par\vspace{\parskip}
}

\renewcommand{\subsection}[1]{
	\par\vspace{\parskip}
	{%
		\large\subheadingfont{#1}%
	}
	\newline\rule{\textwidth}{0.4pt}
	\par\vspace{\parskip}
}

%%%%%%%%%%%%%%%%%%%%
% List environment %
%%%%%%%%%%%%%%%%%%%%

\setlength{\tabcolsep}{0pt}

\newenvironment{entrylist}{%
	\begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}ll}
	}{%
	\end{tabular*}
}
\newcommand{\entry}[6]{%
	\parbox[t]{2.5cm}{#1}\parbox[t]{11cm}{%
		\textbf{#2}%
		\hfill%
		%\headingInfo{#3}\\%
		%\headingInfo{#4}\\%
		%\headingInfo{#5}\\%
		{\footnotesize #4}\\%
		{\footnotesize #3}\\%
		{\footnotesize #5}\\%
		#6\vspace{\parsep}%
	}\\}

\usepackage { progressbar }
\newcommand{\entrySmall}[3]{%
	\parbox[t]{6.5cm}{%
		\textbf{#1}%
		\hfill\\%
		\progressbar [width=5cm, ticksheight=0.1,filledcolor=pblue]{#2}\\%
		#3\vspace{\parsep}%
	}}
\newcommand{\entrySmallDouble}[6]{%
	\entrySmall{#1}{#2}{#3} \hskip 1em%&
	\entrySmall{#4}{#5}{#6}\\}


%%%%%%%%%%%%%%%%
% Other tweaks %
%%%%%%%%%%%%%%%%

\RequirePackage[left=6.5cm,top=1cm,right=0.0cm,bottom=1cm,nohead,nofoot]{geometry}
\RequirePackage{hyperref}
