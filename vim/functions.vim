function! MyLeaderTabfunc() abort
    return deoplete#mappings#manual_complete(['omni'])
endfunction


function! ShowGlobals()
    for varname in keys(g:)
        echo varname"="g:[varname]
    endfor
endfunction
