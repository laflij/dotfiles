" My modifications for vim-latex
" Turn spell checking on
:setlocal spell spelllang=en_us

" Synctex Modifications for vim-latex
let g:Tex_DefaultTargetFormat = 'pdf'
 
let g:Tex_CompileRule_dvi = 'latex --interaction=nonstopmode $*'
let g:Tex_CompileRule_ps = 'dvips -Pwww -o $*.ps $*.dvi'
let g:Tex_CompileRule_pspdf = 'ps2pdf $*.ps'
let g:Tex_CompileRule_dvipdf = 'dvipdfm $*.dvi'
let g:Tex_CompileRule_pdf = 'pdflatex -synctex=1 --interaction=nonstopmode $*'
 
let g:Tex_ViewRule_dvi = 'texniscope'
let g:Tex_ViewRule_ps = 'Preview'
let g:Tex_ViewRule_pdf = 'Skim'
 
let g:Tex_FormatDependency_ps  = 'dvi,ps'
let g:Tex_FormatDependency_pspdf = 'dvi,ps,pspdf'
let g:Tex_FormatDependency_dvipdf = 'dvi,dvipdf'
 
" let g:Tex_IgnoredWarnings ='
"       \"Underfull\n".
"       \"Overfull\n".
"       \"specifier changed to\n".
"       \"You have requested\n".
"       \"Missing number, treated as zero.\n".
"       \"There were undefined references\n".
"       \"Citation %.%# undefined\n".
"       \"\oval, \circle, or \line size unavailable\n"' 

" Set multiple compile rule for bibtex 
let g:Tex_MultipleCompileFormats='pdf'

" Stop hopping out of the file
let g:Tex_GotoError=0

" For Latex files re-map gj and jk to j and k 
:nnoremap k gk
:nnoremap j gj

" Specify indentation
set sw=2
" Set Keyword to ':' so we can cycle through figs and eqn's
"  type in \ref{fig: and press <C-n> you will automatically cycle through figs
set iskeyword+=:
