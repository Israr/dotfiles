function! ToggleNumber()
    let s:isThereNumber = &nu
    let s:isThereRelativeNumber = &relativenumber
    if s:isThereNumber && s:isThereRelativeNumber
        set paste!
        set nonumber
        set norelativenumber
    else
        set paste!
        set number
        set relativenumber
    endif
endf


function! MyLeaderTabfunc() abort
    return deoplete#mappings#manual_complete(['omni'])
endfunction


function! ShowGlobals()
    for varname in keys(g:)
        echo varname"="g:[varname]
    endfor
endfunction