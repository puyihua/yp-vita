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
\newfontfamily\FA[Path=\@fontdir]{FontAwesome}
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

\newcommand{\cvHeaderNameIndent}{-3mm}
\newcommand{\cvSectionNameIndent}{-2mm}
\newcommand{\cvSectionNameSkipSpace}{1.5mm}


%-------------------------------------------------------------------------------
%                Configuration for styles
%-------------------------------------------------------------------------------
\newcommand{\makename}[1]{
    \hspace{\cvHeaderNameIndent}{\Huge\sectionfont\scshape #1}
}

\newcommand{\msection}[1]{%
    \hspace{\cvSectionNameIndent}
    {\Large\sectionfont\scshape\color{darkRed} #1}
    \hrulefill
    \vskip\cvSectionNameSkipSpace
    
}

