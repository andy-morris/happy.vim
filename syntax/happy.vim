"
" Syntax file for the Happy parser generator
" <http://haskell.org/happy>
"

syn include @Haskell syntax/haskell.vim
set isk-='
syn region happyHsSnippet matchgroup=happyDelim start="{%\?" end="}" contains=@Haskell,happySplice,happySpliceEscape,happyHsBraces,happyHsPragma,happyMComment
" needed for the same reason as alex.vim
syn region happyHsBraces matchgroup=hsDelimiter start="{\ze[^-]" end="}" contains=@Haskell,happyHsBrace contained
syn region happyHsPragma start="{-#" end="#-}" contained
syn region happyMComment start="{-\ze[^#]" end="-}"
syn region happyString start="\k\@<!\z(['\"]\)" end="\z1" skip="\\\z1"
syn match happyNumber "\<\d\+\>"
syn match happyPrimeErr "\k\zs'\+"
syn match happySplice "\\\@<!\$\([\$>]\|\d\+\)" contained
syn match happySpliceEscape "\\\ze\$" contained
syn match happyComment "--.*"

syn match happyDirError "%\K\k*\>" contains=happyDirName,happyDirPercent
syn match happyDirPercent "%" contained
syn keyword happyDirName contained tokentype token name partial monad lexer
syn keyword happyDirName contained left right nonassoc expect error
syn keyword happyDirName contained attributetype attribute prec

syn match happyDblPercent "^%%$"

syn match happyRuleName "\K\k*\(([^{]*)\)\?\ze\_s*:"
      \ contains=happyRuleArgList,happyFunHead
syn match happyRuleArgList "(.*)"
      \ contained contains=happyRuleArg,happyRuleArgDelim,happyString
syn match happyRuleArg "\K\k*" contained
syn match happyRuleArgDelim "[(),]" contained
" :, ::, and |
syn match happyRuleOps "::\?\||"

syn match happyProduction '[:|].*$' contains=TOP
syn match happyVar '\u\k*' contained containedin=happyProduction
syn match happyTerminal '\l\k*' contained containedin=happyProduction
syn match happyFun "\K\k*\(([^{]*)\)" contained containedin=happyProduction
      \ contains=@happyFunInternals,happyString

syn cluster happyFunInternals
      \ contains=happyFunHead,happyFunArgDelim,happyVar,happyTerminal
syn match happyFunHead "\K\k*\ze(" contained
syn match happyFunArg "\K\k*" contained
syn match happyFunArgDelim "[(),]" contained


hi def link happyMComment       Comment
hi def link happyHsPragma       Special
hi def link happyDelim          Delimiter
hi def link happyString         String
hi def link happyNumber         Number
hi def link happyPrimeErr       Error
hi def link happySplice         Special
hi def link happySpliceEscape   Special
hi def link happyComment        Comment
hi def link happyDirError       Error
hi def link happyDirPercent     PreProc
hi def link happyDirName        PreProc
hi def link happyDblPercent     Special
hi def link happyRuleName       Structure
hi def link happyRuleArg        Define
hi def link happyRuleOps        Keyword
if !exists('g:happy_no_highlight_vars')
  hi def link happyRuleArgDelim Delimiter
  hi def link happyVar Identifier
  hi def link happyTerminal Constant
  hi def link happyFunArgDelim Delimiter
  hi def link happyFunHead Operator
endif

set autoindent copyindent
