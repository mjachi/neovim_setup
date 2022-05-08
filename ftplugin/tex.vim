let g:vimtex_view_method = "zathura"
let g:vimtex_compiler_method = "latexmk"

function ZathuraOpenPdf()
  let fullPath = expand("%:p")
  let pdfFile = substitute(fullPath, ".tex", ".pdf", "")
  execute "silent !zathura '" . pdfFile . "' &"
endfunction

nnoremap <C-p> :call ZathuraOpenPdf()<CR>
