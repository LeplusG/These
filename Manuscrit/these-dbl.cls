%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                      %
% Cette classe de document est basee sur [report].                     %
% Assurez vous d'avoir installe tous les paquets utiles                %
%                                                                      %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Licence %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                      %
% This program is free software: you can redistribute it and/or modify %
% it under the terms of the GNU General Public License as published by %
% the Free Software Foundation, either version 3 of the License, or    %
% (at your option) any later version.                                  %
%                                                                      %
% This program is distributed in the hope that it will be useful,      %
% but WITHOUT ANY WARRANTY; without even the implied warranty of       %
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the         %
% GNU General Public License for more details.                         %
%                                                                      %
% You should have received a copy of the GNU General Public License    %
% along with this program.  If not, see <http://www.gnu.org/licenses/>.%
%                                                                      %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                      %
% Revision des en-tetes et prise en compte de [twoside]                %
% Revision de la gestion de la bibliographie avec BiblaTex             %
% Ajouts de boites et encarts grises                                   %
% revision de l'enchainement des chapitres                             %
% Mise aux normes typographiques suivant les Regles Typographiques     %
% en usage \`{a} l'Imprimerie Nationale                                %
%                                                                      %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                      %
% Authors: https://gitlab.inria.fr/proman/mathstic-thesis-template     %
% Modified By: Amine Jaamoum                                           %
%                                                                      %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{these-dbl}[11/07/2022 v5.1]

% notez le "twoside", essentiellement pour alterner les en-tete et pieds 
% de page gauche et droit si on veut utliser les fancyhead. 
\LoadClass[12pt]{report}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%           Required Packages            %%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{parskip}
\RequirePackage[utf8]{inputenc} 
\RequirePackage[french, english]{babel}
\RequirePackage{ifpdf}
\RequirePackage[usenames,dvipsnames]{color}
\RequirePackage{textcomp}
\RequirePackage{titlesec}
\RequirePackage{parcolumns}
\RequirePackage{multicol}
\RequirePackage{pdfpages}
\RequirePackage[T1]{fontenc}
\RequirePackage{lmodern}  % Assurer une bonne impression!
\RequirePackage{tikz}     % tikz est utilise pour tracer des boites, par exemple
\RequirePackage{fix-cm}
\RequirePackage{abstract}
\RequirePackage{graphicx}
\RequirePackage{subcaption}
\RequirePackage{sectsty}  % obligatoire, pour jouer avec l'apparence des titres
\RequirePackage{shorttoc}
\RequirePackage{fancyhdr}
\RequirePackage{pifont}   % Pour utiliser des symboles divers.
\RequirePackage{color}
\RequirePackage{comment}
\RequirePackage{wallpaper}
\RequirePackage[inner=30mm,outer=20mm,top=30mm,bottom=20mm]{geometry}
\RequirePackage{epigraph}
\RequirePackage{minitoc}  % used to construct mini content for each chpter
\RequirePackage{titletoc}
\RequirePackage{lineno}   % is needed to add line's number
\RequirePackage{setspace} % needed to add more space between lines (added for reviewing)
% tables
\RequirePackage{multirow}
\RequirePackage{lscape}
\RequirePackage{array}
\newcolumntype{P}[1]{>{\centering\arraybackslash}p{#1}}
\newcolumntype{M}[1]{>{\centering\arraybackslash}m{#1}}

\RequirePackage{amsmath}
\RequirePackage{stmaryrd}

\RequirePackage{eso-pic}
\RequirePackage{framed}   % utilise pour coloriser les encarts

\RequirePackage{ifthen}
\RequirePackage{csquotes} % Assurer les guillemets français

\RequirePackage{hyperref} 
\usepackage{breakcites}
%\usepackage{xurl}

\RequirePackage{xargs}
\RequirePackage[colorinlistoftodos, prependcaption, textsize=small]{todonotes}
\RequirePackage{soul}    % Pour créer untext barré

%% for mdpi chapter 4
\RequirePackage{booktabs}
\RequirePackage{listings}

\RequirePackage[linesnumbered, ruled, lined, commentsnumbered]{algorithm2e}
\SetKw{KwBy}{by}
\SetKwInput{KwInput}{Input}
\SetKwInput{KwOutput}{Output}

\RequirePackage{xcolor}
\RequirePackage{float}

\newcommand\mycommfont[1]{\footnotesize\ttfamily\textcolor{blue}{#1}}
\SetCommentSty{mycommfont}

\usepackage{amsthm, amssymb, amsopn}
\theoremstyle{definition}
\newtheorem{definition}{Definition}[section]

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%           Document settings            %%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\setcounter{minitocdepth}{1} % Show until sections in minitoc

\hypersetup{ colorlinks=true,
             citecolor=black,
             filecolor=black,
             linkcolor=black,
             urlcolor=black
           }

\frenchspacing
\FrenchFootnotes

%\setlength{\parskip}{5mm plus4mm minus3mm} % reduce the blank space between paragraphs

% todo: MUST be comment-out on release
%\linenumbers % print lines number
\onehalfspace % inclease the space between lines (\doublespace, \onehalfspace \singlespace)

%% caption and subcaption settings:
\captionsetup{
    %width=0.9\linewidth, % width of caption is 90% of current textwidth
    labelfont=bf,        % the label, e.g. figure 12, is bold
    font=small,          % the whole caption text (label + content) is small
    format=hang,         % no caption text under the label
}
\captionsetup[subfigure]{
    format=plain,   % but allowed in subfigure to save space
}
\usepackage{wrapfig}

\DeclareUnicodeCharacter{0301}{\'{e}}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%       Global Commande Definition       %%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Define command to set fonts style used in front cover 
\newcommand*{\selectfontfrontcover}{\fontfamily{phv}\selectfont}

% Define command to set fonts style used in back cover 
\newcommand*{\selectfontbackcover}{\fontfamily{phv}\selectfont} 

% Define command to set fonts style used chapter headings
\newcommand*{\selectfontchapheads}{\fontfamily{phv}\selectfont} 

% Override default font here if you want
\renewcommand{\rmdefault}{qpl}
\renewcommand{\sfdefault}{qpl} 


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%        Local Commande Definition       %%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Define command to sets fronts style used for attack names
\newcommand{\attack}[1]{\textsc{#1}}

% Todo annotation (debug only) => MUST be comment-out on release
\newcommand{\todoaj}[2][]
{\todo[color=green!10, #1]{\textbf{AJ}: #2}}

\newcommand{\todoth}[2][]
{\todo[color=cyan!40, #1]{\textbf{TH}: #2}}

% Circled symbol used to reference part of pictures
\usepackage{tikz}  % needed to align the base line, to adjust the size and to get the circle shape. 
\newcommand*\picref[1]{\tikz[baseline=(char.base)]{
            \node[shape=circle,draw,inner sep=1pt] (char) {#1};}}

% Reviewing commands (remove, rephrase, typo)
\newcommand{\remove}[1]{\textcolor{red!80}{\st{#1}}}
\newcommand{\rephrase}[1]{\textcolor{blue!80}{\underline{#1}}}
\newcommand{\typo}[1]{\colorbox{BurntOrange}{#1}}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%              En-tete chap              %%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\definecolor{gray75}{gray}{0.75}

\makeatletter
\def\thickhrulefill{\leavevmode \leaders \hrule height 1ex \hfill \kern \z@}
\def\@makechapterhead#1{%
  \vspace*{-30\p@}%
  { \flushright \fontseries{bc} \fontsize{100}{60} \selectfont 
    \textcolor{gray75} \thechapter
    \par\nobreak
    \interlinepenalty\@M

    \selectfontchapheads \Huge \bfseries #1 \par\nobreak
    \hrulefill
    \par\nobreak
    \vskip 50\p@
  }}

\def\@makeschapterhead#1{%
 \vspace*{-50\p@}%
  { \parindent \z@ \raggedleft \reset@font
    \scshape \vphantom{\@chapapp{} \thechapter}
    \par\nobreak

    \interlinepenalty\@M
    \selectfontchapheads \Huge \bfseries  #1 \par\nobreak 
    \hrulefill
    \par\nobreak
    \vskip 30\p@
  }}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%            Tete de parties             %%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\makeatletter
\newcommand*{\jolipart}[1]{%
	\begin{center}
		\begin{Huge}\color{black}
			#1
		\end{Huge}
		\end{center}
		\vspace{1cm}		
	\begin{center}
	\hrulefill
	\end{center}		
	}

\parttitlefont{\jolipart}

\partnumberfont{\sc\normalsize}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%       REGLAGE DE LA BIBLIOGRAPHIE      %%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%     ATTENTION, on utilise Biblatex     %%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Les dernieres versions de biblatex pr\'{e}conisent l'option backend
% =biber pour profiter des derni\`{e}res nouveaut\'{e}s. Si vous 
% choisissez cette option, il vous faut simplement compiler avec $biber
% nomdufichier (sans le % .tex). Pour utiliser bibtex, remplacer par 
% backend=bibtex.
\RequirePackage[hyperref,backend=bibtex,
  % Exemples de styles: alphabetic, ieee, nature, numeric, verbose-trad1 
  % (en utilisant \footcite{}).
  % https://www.overleaf.com/learn/latex/Biblatex_bibliography_styles
  style=alphabetic
  ]{biblatex}

%%%% Ajustements pour la bibliographie
% Virgule entre les parties d'une reference (merci a Josquin Debaz)
\renewcommand*{\newunitpunct}{\addcomma\space} 

% Le numero de volume en gras
\DeclareFieldFormat[article]{volume}{\textbf{#1}}

%Le numero dans le volume en italique
\DeclareFieldFormat[article]{number}{\textit{#1}} 

% Et pour mettre le in en italique dans la ref\'{e}rence biblio
\DefineBibliographyStrings{english}{%
        in = {\emph{in}}%
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%  Interligne simple pour citations et vers  %%%%%%%%%%%%%%
% Environnements: QUOTE, QUOTATION, VERSE                              %
% Copyright (C) 2002 Mike Nolta <mrnolta@princeton.edu>,               %
% GPL V. 2.0 and later version.                                        %
% www.physics.princeton.edu/cosmology/computing/PrincetonThesis.cls    %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\let\orig@quote\quote
\let\endorig@quote\endquote
\renewenvironment*{quote}
	{\begin{orig@quote}\begin{singlespace}}
	{\end{singlespace}\end{orig@quote}}

\let\old@quotation\quotation
\let\endold@quotation\endquotation
\renewenvironment*{quotation}
	{\begin{old@quotation}\begin{singlespace}}
        {\end{singlespace}\end{old@quotation}}

\let\old@verse\verse
\let\endold@verse\endverse
\renewenvironment*{verse}
	{\begin{old@verse}\begin{singlespace}}
        {\end{singlespace}\end{old@verse}}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%              PAGE DE GARDE             %%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Define some font sizes specific to the covers, supposed to be in 12pt
\newcommand{\HugeTwelve}{\fontsize{26}{31}\selectfont}
\newcommand{\LARGETwelve}{\fontsize{20.74}{25}\selectfont}
\newcommand{\LargeTwelve}{\fontsize{16}{19}\selectfont}
\newcommand{\largeTwelve}{\fontsize{14.4}{17}\selectfont}
\newcommand{\normalTwelve}{\fontsize{12}{13.2}\selectfont}
\newcommand{\smallTwelve}{\fontsize{11}{13.5}\selectfont}
\newcommand{\footnotesizeTwelve}{\fontsize{9.5}{11}\selectfont}

\makeatother


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%         QUATRIEME DE COUVERTURE        %%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\titleFR}[1]{%
  \vspace{1cm}
  {\centering \noindent \textcolor{shadecolor}{\rule{\textwidth}{0.2cm}}}
  \vspace{-1cm}
  \selectlanguage{french}
  \section*{\selectfontbackcover\smallTwelve \textcolor{shadecolor}{Titre : }
  {\selectfontbackcover\mdseries{#1}}} 
  % In this particular case, font style needs to get re-selected locally
}

\newcommand{\keywordsFR}[1]{%
\vspace{-0.2cm}
\noindent{\smallTwelve \textbf{Mot cl\'{e}s : }#1}
}

\newcommand{\abstractFR}[1]{%
  \vspace{-0.2cm}
  \begin{multicols}{2}
    \begin{spacing}{1}
	    \noindent\smallTwelve \textbf{R\'{e}sum\'{e} : }#1
    \end{spacing}
  \end{multicols}
}

\newcommand{\titleEN}[1]{%
  \vspace{0.5cm}
  {\centering \noindent \textcolor{shadecolor}{\rule{\textwidth}{0.2cm}}}
  \vspace{-1cm}
  \selectlanguage{english}
  \section*{\selectfontbackcover\smallTwelve \textcolor{shadecolor}{Title: }
  {\selectfontbackcover\mdseries{#1}}} 
  % In this particular case, font style needs to get re-selected locally
}

\newcommand{\keywordsEN}[1]{%
  \vspace{-0.2cm}
  \noindent{\smallTwelve \textbf{Keywords: }#1}
}

\newcommand{\abstractEN}[1]{%
  \vspace{-0.2cm}
  \begin{multicols}{2}
    \begin{spacing}{1}
	    \noindent\smallTwelve \textbf{Abstract: }#1
    \end{spacing}
  \end{multicols}
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%             EN-TETES PAGES             %%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Pour suppirmer les entetes et pied de page gênants 
% par exemple juste avant un chapitre sur une page de droite
% utiliser la commande \clearemptydoublepage juste avant le \chapter
\newcommand{\clearemptydoublepage}{%
   \newpage{\pagestyle{empty}\cleardoublepage}}

\newcommand{\clearemptypage}{%
  \newpage{\null\addtocounter{page}{-1}\thispagestyle{empty}}}

% on annule le fancy automatique
\fancyhf{}                      

% Gerer les en tetes dans les frontmatter mainmatter et backmatter
\RequirePackage{geometry}
\RequirePackage{etoolbox}

\appto\frontmatter{\pagestyle{fancy}
\renewcommand{\sectionmark}[1]{}
\renewcommand{\chaptermark}[1]{\markboth{\textit{#1}}{}}
\fancyhead[LE,RO]{\small\thepage}
    \fancyhead[RO]{\small\leftmark}   % \rightmark = section courante
    \fancyhead[LE]{\small\leftmark}   % \leftmark = chapitre courant
    \fancyfoot[C]{\thepage}           % marque la page au centre
}

\appto\mainmatter{\pagestyle{fancy}
\renewcommand{\sectionmark}[1]{\markright{\textit{\thesection.\ #1}}}
\renewcommand{\chaptermark}[1]{\markboth{\chaptername~\thechapter~--\ \textit{#1}}{}}
\fancyhead[LE,RO]{\small\thepage}
    \fancyhead[RO]{\small\rightmark}                % \rightmark = section courante
    \fancyhead[LE]{\small Part~\thepart, \leftmark} % \leftmark = chapitre courant
    \fancyfoot[C]{\thepage}                         % marque la page au centre
}     

\appto\backmatter{\pagestyle{fancy}
\renewcommand{\sectionmark}[1]{\markright{\thesection.\ #1}}
\renewcommand{\chaptermark}[1]{\markboth{\chaptername~\thechapter~--\ #1}{}}
\fancyhead[LE,RO]{\small\thepage}
    \fancyhead[RO]{}            % \rightmark = section courante
    \fancyhead[LE]{}            % \leftmark = chapitre courant
    \fancyfoot[C]{\thepage}     % marque la page au centre
} 


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%            FAIRE DES ENCARTS           %%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\definecolor{fondtitre}{RGB}{85,85,85}
\definecolor{fonddeboite}{RGB}{232,232,232}
\definecolor{shadecolor}{RGB}{159,182,217}

\ProcessOptions

% Boitemagique  
\newcommand*{\boitemagique}[2]{
\begin{center}
\begin{tikzpicture}

% la boite
\node[rectangle,
      draw=fondtitre!100,
      fill=fonddeboite!100,
      inner sep=10pt,
      inner ysep=20pt] (mabox)
{
  \begin{minipage}{12cm}
  #2
  \end{minipage}};
  
  % le titre de la boite
  \node[fill=fondtitre!100,
        text=white,
        rectangle] at (mabox.north) {\sffamily\textbf{#1}};
  \end{tikzpicture}
  \end{center}
}

% boitesimple
\newcommand*{\boitesimple}[1]{%
  \begin{center}
    \begin{minipage}{12cm}
      \begin{shaded}
	      #1
      \end{shaded}
    \end{minipage}
  \end{center}
}

% 
%%

%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%              python env                %%%%%%%%%%%%%%%%
%% Python definition (c) 1998 Michael Weber                           %%
%% Additional definitions (2013) Alexis Dimitriadis                   %%
%% modified by me (should not have empty lines)                       %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\usepackage{xcolor}
\definecolor{maroon}{cmyk}{0, 0.87, 0.68, 0.32}
\definecolor{halfgray}{gray}{0.55}
\definecolor{ipython_frame}{RGB}{207, 207, 207}
\definecolor{ipython_bg}{RGB}{247, 247, 247}
\definecolor{ipython_red}{RGB}{186, 33, 33}
\definecolor{ipython_green}{RGB}{0, 128, 0}
\definecolor{ipython_cyan}{RGB}{64, 128, 128}
\definecolor{ipython_purple}{RGB}{170, 34, 255}

\lstset{
    breaklines=true,
    %
    extendedchars=true,
    literate=
    {á}{{\'a}}1 {é}{{\'e}}1 {í}{{\'i}}1 {ó}{{\'o}}1 {ú}{{\'u}}1
    {Á}{{\'A}}1 {É}{{\'E}}1 {Í}{{\'I}}1 {Ó}{{\'O}}1 {Ú}{{\'U}}1
    {à}{{\`a}}1 {è}{{\`e}}1 {ì}{{\`i}}1 {ò}{{\`o}}1 {ù}{{\`u}}1
    {À}{{\`A}}1 {È}{{\'E}}1 {Ì}{{\`I}}1 {Ò}{{\`O}}1 {Ù}{{\`U}}1
    {ä}{{\"a}}1 {ë}{{\"e}}1 {ï}{{\"i}}1 {ö}{{\"o}}1 {ü}{{\"u}}1
    {Ä}{{\"A}}1 {Ë}{{\"E}}1 {Ï}{{\"I}}1 {Ö}{{\"O}}1 {Ü}{{\"U}}1
    {â}{{\^a}}1 {ê}{{\^e}}1 {î}{{\^i}}1 {ô}{{\^o}}1 {û}{{\^u}}1
    {Â}{{\^A}}1 {Ê}{{\^E}}1 {Î}{{\^I}}1 {Ô}{{\^O}}1 {Û}{{\^U}}1
    {œ}{{\oe}}1 {Œ}{{\OE}}1 {æ}{{\ae}}1 {Æ}{{\AE}}1 {ß}{{\ss}}1
    {ç}{{\c c}}1 {Ç}{{\c C}}1 {ø}{{\o}}1 {å}{{\r a}}1 {Å}{{\r A}}1
    {€}{{\EUR}}1 {£}{{\pounds}}1
}

\lstdefinelanguage{ipython}{
    morekeywords = {access,and,break,class,continue,def,del,elif,else,except,%
                    exec,finally,for,from,global,if,import,in,is,lambda,not,or,%
                    pass,print,raise,return,try,while},%
    %
    % Built-ins
    morekeywords = [2]{abs,all,any,basestring,bin,bool,bytearray,callable,chr,%
                       classmethod,cmp,compile,complex,delattr,dict,dir,divmod,%
                       enumerate,eval,execfile,file,filter,float,format,%
                       frozenset,getattr,globals,hasattr,hash,help,hex,id,%
                       input,int,isinstance,issubclass,iter,len,list,locals,%
                       long,map,max,memoryview,min,next,object,oct,open,ord,%
                       pow,property,range,raw_input,reduce,reload,repr,reversed,%
                       round,set,setattr,slice,sorted,staticmethod,str,sum,super,tuple,%
                       type,unichr,unicode,vars,xrange,zip,apply,buffer,coerce,intern,self},%
    %
    sensitive=true,%
    morecomment=[l]\#,%
    morestring=[b]',%
    morestring=[b]",%
    %
    morestring=[s]{'''}{'''},% used for documentation text (mulitiline strings)
    morestring=[s]{"""}{"""},% added by Philipp Matthias Hahn
    %
    morestring=[s]{r'}{'},% `raw' strings
    morestring=[s]{r"}{"},%
    morestring=[s]{r'''}{'''},%
    morestring=[s]{r"""}{"""},%
    morestring=[s]{u'}{'},% unicode strings
    morestring=[s]{u"}{"},%
    morestring=[s]{u'''}{'''},%
    morestring=[s]{u"""}{"""},%
    %
    % {replace}{replacement}{lenght of replace}
    % *{-}{-}{1} will not replace in comments and so on
    literate=
        {á}{{\'a}}1 {é}{{\'e}}1 {í}{{\'i}}1 {ó}{{\'o}}1 {ú}{{\'u}}1
        {Á}{{\'A}}1 {É}{{\'E}}1 {Í}{{\'I}}1 {Ó}{{\'O}}1 {Ú}{{\'U}}1
        {à}{{\`a}}1 {è}{{\`e}}1 {ì}{{\`i}}1 {ò}{{\`o}}1 {ù}{{\`u}}1
        {À}{{\`A}}1 {È}{{\'E}}1 {Ì}{{\`I}}1 {Ò}{{\`O}}1 {Ù}{{\`U}}1
        {ä}{{\"a}}1 {ë}{{\"e}}1 {ï}{{\"i}}1 {ö}{{\"o}}1 {ü}{{\"u}}1
        {Ä}{{\"A}}1 {Ë}{{\"E}}1 {Ï}{{\"I}}1 {Ö}{{\"O}}1 {Ü}{{\"U}}1
        {â}{{\^a}}1 {ê}{{\^e}}1 {î}{{\^i}}1 {ô}{{\^o}}1 {û}{{\^u}}1
        {Â}{{\^A}}1 {Ê}{{\^E}}1 {Î}{{\^I}}1 {Ô}{{\^O}}1 {Û}{{\^U}}1
        {œ}{{\oe}}1 {Œ}{{\OE}}1 {æ}{{\ae}}1 {Æ}{{\AE}}1 {ß}{{\ss}}1
        {ç}{{\c c}}1 {Ç}{{\c C}}1 {ø}{{\o}}1 {å}{{\r a}}1 {Å}{{\r A}}1
        {€}{{\EUR}}1 {£}{{\pounds}}1
        %
        {^}{{{\color{ipython_purple}\^{}}}}1
        {=}{{{\color{ipython_purple}=}}}1
        %
        {+}{{{\color{ipython_purple}+}}}1
        {*}{{{\color{ipython_purple}$^\ast$}}}1
        {/}{{{\color{ipython_purple}/}}}1
        %
        {+=}{{{+=}}}1
        {-=}{{{-=}}}1
        {*=}{{{$^\ast$=}}}1
        {/=}{{{/=}}}1,
    literate=
        *{-}{{{\color{ipython_purple}-}}}1
         {?}{{{\color{ipython_purple}?}}}1,
        %
    identifierstyle=\color{black}\ttfamily,
    commentstyle=\color{ipython_cyan}\ttfamily,
    stringstyle=\color{ipython_red}\ttfamily,
    keepspaces=false,
    showspaces=false,
    showstringspaces=false,
    %
    rulecolor=\color{white}\ttfamily,,
    frame=single,
    frameround={t}{t}{t}{t},
    framexleftmargin=0mm,
    numbers=left,
    numberstyle=\tiny\color{halfgray},
    %
    %
    backgroundcolor=\color{white},
    %   extendedchars=true,
    basicstyle=\footnotesize,
    keywordstyle=\color{ipython_green}\ttfamily,
}
