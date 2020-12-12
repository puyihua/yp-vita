%-------------------------------------------------------------------------------
%                Identification
%-------------------------------------------------------------------------------
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{yp-vita}[2020/12/06 v1.0.0 yp-vita LaTex class]

%-------------------------------------------------------------------------------
%                Class options
%
% (need to be done before the external package loading, for example because
% we need \paperwidth, \paperheight and \@ptsize to be defined before loading
% geometry and fancyhdr)
%-------------------------------------------------------------------------------
\DeclareOption{twocolumn}{\OptionNotUsed}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass{article}


%-------------------------------------------------------------------------------
%                3rd party packages
%-------------------------------------------------------------------------------
% Needed to use \if-\then-\else statement
\RequirePackage{xifthen}
% Needed to handle text alignment
\RequirePackage{ragged2e}
% Needed to make header & footer effeciently
\RequirePackage{fancyhdr}
% Needed to handle list environment
\RequirePackage{enumitem}
% Needed to manage colors
\RequirePackage{xcolor}
\definecolor{darkRed}{HTML}{660000}
% Needed to configure page layout
\RequirePackage{geometry}
% Needed to deal hyperlink
\RequirePackage[hidelinks,unicode]{hyperref}
\hypersetup{%
  pdftitle={},
  pdfauthor={},
  pdfsubject={},
  pdfkeywords={}
}
% Needed to deal a paragraphs
\RequirePackage{parskip}
% Needed to manage fonts
\RequirePackage[quiet]{fontspec}
\RequirePackage{fontawesome}
% \RequirePackage[default,opentype]{sourcesanspro}


%-------------------------------------------------------------------------------
%                Configuration for directory locations
%-------------------------------------------------------------------------------
% Configure a directory location for fonts(default: 'fonts/')
\newcommand*{\fontdir}[1][fonts/]{\def\@fontdir{#1}}
\fontdir


%-------------------------------------------------------------------------------
%                Configuration for fonts
%-------------------------------------------------------------------------------
% \newfontfamily\FA[Path=\@fontdir]{FontAwesome}
% Set font for section name
\newfontfamily\sectionfont[
    Path=\@fontdir,
    UprightFont=*-Regular,
    ItalicFont=*-Italic,
    BoldFont=*-SemiBold,
    BoldItalicFont=*-SemiBoldItalic,
]{EBGaramond}

\setmainfont[
    Path=\@fontdir,
    UprightFont=*-Light,
    ItalicFont=*-LightItalic,
    BoldFont=*-Regular,
    BoldItalicFont=*-Italic,
]{Lato}


%-------------------------------------------------------------------------------
%                Commands for indent & spacing
%-------------------------------------------------------------------------------
\geometry{top=0.6in, bottom=0.6in, right=0.8in, left=0.8in}

\setlength{\parindent}{0em}
\setlength{\parskip}{0em}

\newcommand{\cvHeaderNameIndent}{0mm}
\newcommand{\cvSectionNameIndent}{1mm}
\newcommand{\cvSectionNameBeforeSpace}{1.5mm}
\newcommand{\cvSectionNameAfterSpace}{1mm}
\newcommand{\cvDescriptionIndent}{3mm}

%% Header & Footer
% Set offset to each header and footer
\fancyhfoffset{0em}
% Remove head rule
\renewcommand{\headrulewidth}{0pt}
% Clear all header & footer fields
\fancyhf{}
% Enable if you want to make header or footer using fancyhdr
\pagestyle{fancy}

%-------------------------------------------------------------------------------
%                Commands for personal information
%-------------------------------------------------------------------------------
\newcommand*{\name}[2]{\def\@firstname{#1}\def\@lastname{#2}\def\@name{#1 #2}}
\newcommand*{\email}[1]{\def\@email{#1}}
\newcommand*{\mobile}[1]{\def\@mobile{#1}}
\newcommand*{\homepage}[1]{\def\@homepage{#1}}
\newcommand*{\github}[1]{\def\@github{#1}}
\newcommand*{\linkedin}[1]{\def\@linkedin{#1}}

\newcommand{\myemail}{\href{mailto:\@email}{\faEnvelopeO~\@email}}
\newcommand{\mymobile}{\faPhone~\@mobile}
\newcommand{\mygithub}{\href{https://\@github}{\faGithub~\@github}}
\newcommand{\mylinkedin}{\href{https://\@linkedin}{\faLinkedin~\@linkedin}}
%-------------------------------------------------------------------------------
%                Configuration for styles
%-------------------------------------------------------------------------------

\newcommand*{\entrytitlestyle}[1]{{\bfseries #1}}
\newcommand*{\entrypositionstyle}[1]{{\slshape #1}}
\newcommand*{\entrydatestyle}[1]{\hfill #1}
\newcommand*{\entrydescriptionstyle}[1]{{#1}}



\newcommand{\makename}[1][\@name]{%
    \hspace{\cvHeaderNameIndent}{\Huge\sectionfont\scshape #1}
}

\newcommand{\makecontact}[4]{%
{
    \hfill
    \begin{minipage}[b]{4.5in}
      \flushright \footnotesize
      #1~~~#2
      \vskip .5mm%
      #3~~~#4
    \end{minipage}
  }
}

\newcommand{\msection}[1]{%
    \vspace{\cvSectionNameBeforeSpace}
    \hspace{\cvSectionNameIndent}{
        {\Large\sectionfont\scshape\color{darkRed} #1}
        \hrulefill
    }
    \vspace{\cvSectionNameAfterSpace}
}

\newenvironment{cvitems}{%
%   \vspace{-7.5mm}
  \begin{justify}
  \begin{itemize}[leftmargin=2em, nosep, noitemsep]
    \setlength{\parskip}{0pt}
    \renewcommand{\labelitemi}{\textendash}
}{%
  \end{itemize}
  \end{justify}
%   \vspace{-1.5mm}
}

\newcommand{\mentry}[4]{%
    \setlength{\leftskip}{\cvDescriptionIndent}

        \entrytitlestyle{#1}\\
        \entrypositionstyle{#2}
        \ifthenelse{\isempty{#3}}{}{\entrydatestyle{#3}}
        \entrydescriptionstyle{#4}

    \setlength{\leftskip}{0pt}
}

