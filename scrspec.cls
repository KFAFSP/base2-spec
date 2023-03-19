\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{scrspec}

% Class options.
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{scrbook}}
\ProcessOptions\relax

% Base class.
\LoadClass[oneside,parskip=half-,bibliography=leveldown,bibliography=numbered]{scrbook}

%
% Packages
%

% Commands.
\RequirePackage{xspace}
\RequirePackage{xparse}
\RequirePackage{environ}
\RequirePackage{scrdate}

% Typography.
\RequirePackage{geometry}
\RequirePackage[draft=false,automark,autooneside=false]{scrlayer-scrpage}
\RequirePackage{helvet}
\renewcommand*{\familydefault}{\sfdefault}
\RequirePackage[dvipsnames]{xcolor}
\RequirePackage{microtype}
\RequirePackage{calc}
\RequirePackage{needspace}

% Graphics.
\RequirePackage{graphicx}
\RequirePackage{tikz}
    \usetikzlibrary{arrows.meta}
    \usetikzlibrary{patterns}

% Boxes.
\RequirePackage{mdframed}

% Math.
\RequirePackage{amssymb}
\RequirePackage{amsmath}
\RequirePackage{amsthm}
\RequirePackage{centernot}

% Floats.
\RequirePackage{caption}
\RequirePackage{subcaption}
\RequirePackage{float}

% Environments.
\RequirePackage[ruled]{algorithm2e}
\RequirePackage{booktabs}
\RequirePackage{xltabular}
\RequirePackage{colortbl}
\RequirePackage{enumitem}

% Versioning and comments.
\RequirePackage[layout=inline]{fixme}
    \fxusetheme{color}
\RequirePackage[tablegrid]{vhistory}

% Index.
\RequirePackage{imakeidx}
    \makeindex

% References.
\RequirePackage{natbib}

% Cross-references.
\RequirePackage{lastpage}
\RequirePackage[final,colorlinks,linktocpage]{hyperref}
\RequirePackage{cleveref}
\RequirePackage[acronym,automake=immediate,nomain,toc,section,numberedsection]{glossaries}
\RequirePackage{glossary-longbooktabs}

%
% Styling
%

% Colors.
\colorlet{heading}{MidnightBlue}
\colorlet{remark}{Apricot}
\colorlet{tableheader}{Apricot!50}
\colorlet{highlight}{Periwinkle}
\colorlet{definition}{MidnightBlue}

% Heading format.
\setkomafont{disposition}{\normalfont\color{heading}}
\setkomafont{partentry}{\scshape\bfseries\color{heading}}
\setkomafont{chapterentry}{\bfseries\color{heading}}
\RedeclareSectionCommands[
    tocentryformat=\usekomafont{disposition},
    tocpagenumberformat=\usekomafont{disposition}
]{section}
\RedeclareSectionCommands[
    font=\usekomafont{disposition}\itshape,
    tocentryformat=\usekomafont{disposition}\itshape,
    tocpagenumberformat=\usekomafont{disposition}\itshape
]{subsection,subsubsection}
\setkomafont{pagehead}{\upshape}
\setkomafont{pagefoot}{\upshape}
\renewcommand*{\chapterlinesformat}[3]{%
    \parbox{\linewidth}{%
        \raggedleft\@hangfrom{#2}{#3}%
        \par\kern-.75\ht\strutbox\rule{\linewidth}{1.5pt}
    }%
}

% Heading indentation.
\renewcommand*{\sectionformat}{\makebox[1.5cm][l]{\thesection\autodot\hfil}}
\renewcommand*{\subsectionformat}{\makebox[1.5cm][l]{\thesubsection\autodot\hfil}}
\renewcommand*{\subsubsectionformat}{\makebox[1.5cm][l]{\thesubsubsection\autodot\hfil}}

% Numbered run-in subsubections.
\setcounter{secnumdepth}{3}
\renewcommand{\sectioncatchphraseformat}[4]{\hskip #2#3#4.}

% Page margins.
\AfterCalculatingTypearea{\geometry{paper=a4paper,left=2cm,right=2cm,top=1cm,bottom=2.5cm,bindingoffset=0cm}}
\KOMAoptions{automark,headinclude=true,footinclude=true,headsepline,footsepline,plainfootsepline,plainheadsepline}
\recalctypearea

% Page contents vertical alignment.
\RedeclareSectionCommand[beforeskip=0pt,afterskip=0pt]{chapter}
\RedeclareSectionCommand[beforeskip=0pt,afterskip=0pt,runin=false]{section}
\RedeclareSectionCommand[beforeskip=0pt,afterskip=0pt,runin=false]{subsection}
\RedeclareSectionCommand[beforeskip=0pt,afterskip=3pt,runin=true]{subsubsection}
\raggedbottom

% Header and footer.
\let\titleoriginal\title
\renewcommand{\title}[1]{
    \titleoriginal{#1}%
    \newcommand{\thetitle}{#1}
}
\renewcommand{\part}[1]{\addcontentsline{toc}{part}{#1}\renewcommand{\partname}{#1}}
\clearpairofpagestyles
\setlength{\headheight}{1.5cm}
\setlength{\footheight}{1.5cm}
\lohead[]{\rightmark}
\cohead[\partname]{\partname}
\rohead[]{\leftmark}
\lofoot[\ISOToday]{\ISOToday}
\cofoot[\thetitle]{\thetitle}
\rofoot[Page \pagemark{} of \pageref*{LastPage}]{Page \pagemark{} of \pageref*{LastPage}}
\pagestyle{scrheadings}

% Indented remark box.
\mdfdefinestyle{remark}{topline=false,rightline=false,bottomline=false,linecolor=remark,linewidth=3pt,backgroundcolor=remark!25}
\newenvironment{remark}[1]{
    \begin{mdframed}[style=remark]
        \begin{description}[labelwidth=\widthof{\textbf{#1}},leftmargin=!]
            \item[#1]
}{
        \end{description}
    \end{mdframed}
}

% Titled highlight box.
\mdfdefinestyle{highlight}{topline=false,rightline=false,bottomline=false,linecolor=highlight,linewidth=3pt,backgroundcolor=highlight!25,frametitlealignment=\center}
\newenvironment{highlight}[1]{
    \begin{mdframed}[style=highlight,frametitle={#1}]
}{
    \end{mdframed}
}

% Definition box.
\theoremstyle{definition}
\mdfdefinestyle{definition}{topline=false,rightline=false,bottomline=false,linecolor=definition,linewidth=3pt,backgroundcolor=definition!10,skipabove=8pt,skipbelow=0pt,frametitlerule=true,frametitlealignment=\raggedright,frametitleaboveskip=2pt,frametitlebelowskip=2pt}
\mdtheorem[style=definition]{definition}{Definition}

% Reference section name.
\renewcommand\bibname{References}

% Framed, colored table version history style.
\renewcommand*{\vh@showAuthorHead}{%
  \ifnum \vh@tablegrid=0\relax
    \vh@verbwrite \vh@verfile {%
      \begin{longtable}{@{}ll>{\hsize=\vhAuthorColWidth}X>{\hsize=\vhChangeColWidth}X@{}}\rowcolor{tableheader}%
    }%
  \else
    \vh@verbwrite \vh@verfile {%
      \begin{longtable}{@{}|l|l|>{\hsize=\vhAuthorColWidth}X|>{\hsize=\vhChangeColWidth}X|@{}}\hline\rowcolor{tableheader}%
    }%
  \fi
}

% Counter for goals.
\newcounter{goal}
\renewcommand*{\thegoal}{\textbf{G\arabic{goal}}}
\newcommand*{\Goal}[1]{\refstepcounter{goal}\thegoal\label{#1}}
\crefname{goal}{goal}{goals}
\Crefname{goal}{Goal}{Goals}

% Counter for assumptions.
\newcounter{assumption}
\renewcommand*{\theassumption}{\textbf{A\arabic{assumption}}}
\newcommand*{\Assume}[1]{\refstepcounter{assumption}\theassumption\label{#1}}
\crefname{assumption}{assumption}{assumptions}
\Crefname{assumption}{Assumption}{Assumptions}

% Counter for requirements.
\newcounter{requirement}
\renewcommand*{\therequirement}{\textbf{R\arabic{requirement}}}
\newcommand*{\Require}[1]{\refstepcounter{requirement}\therequirement\label{#1}}
\crefname{requirement}{requirement}{requirements}
\Crefname{requirement}{Requirement}{Requirements}

% Framed, colored table glossary style.
\NewEnviron{xltwocol}{%
    \begin{xltabular}{\linewidth}{|l|X|}%
        \BODY
    \end{xltabular}
}
\newglossarystyle{xl3col-framed}{%
    %\glspatchLToutput
    %\setglossarystyle{long3col}%
    \renewenvironment{theglossary}%
        {\xltwocol}%
        {\endxltwocol}%
    \renewcommand*{\glossaryheader}{%
        \hline\rowcolor{tableheader}
        \bfseries \entryname &
        \bfseries \descriptionname
        \tabularnewline\hline\endhead\hline\endfoot}%
    \renewcommand*{\glsgroupheading}[1]{}%
    \renewcommand{\glossentry}[2]{%
        \glsentryitem{##1}\glstarget{##1}{\glossentryname{##1}} &
        \glossentrydesc{##1} \tabularnewline
    }%
    \ifglsnogroupskip
        \renewcommand*{\glsgroupskip}{}%
    \else
        \renewcommand*{\glsgroupskip}{ & \tabularnewline}%
    \fi
}

%
% Commands
%

% Introduce a new anchored term.
\NewDocumentCommand{\newterm}{mO{#1}O{#2}}{\hypertarget{#2}{\emph{#1}}\index{#3}}
% Use an anchored term.
\NewDocumentCommand{\term}{mO{#1}}{\hyperlink{#2}{#1}}

% Print a glossary section.
\NewDocumentCommand{\PrintGlossary}{m}{\Needspace{6em}\printglossary[type={#1},style={xl3col-framed}]}

% Print the references section.
\NewDocumentCommand{\PrintReferences}{m}{\bibliographystyle{ACM-Reference-Format}
\bibliography{#1}}
