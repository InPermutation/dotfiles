if has("gui_kde")
    " KDE
elseif has("gui_gtk")
    " GTK
elseif has("gui_running")
    if has("win32") || has("win64")
    " Windows
        set guifont=Consolas:h12
    else
    " Mac?
    endif
endif

