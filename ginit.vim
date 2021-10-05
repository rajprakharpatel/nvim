"""""""""""""
"  Neovide  "
"""""""""""""

let g:neovide_refresh_rate=120
let g:neovide_transparency=0.8
let g:neovide_cursor_animation_length=0.87
let g:neovide_cursor_trail_length=0.8
let g:neovide_cursor_antialiasing=v:true
let g:neovide_cursor_vfx_mode = "railgun" "torpedo, pixiedust, wireframe, sonicboom, ripple
let g:neovide_cursor_vfx_opacity=200.0
let g:neovide_cursor_vfx_particle_lifetime=1.2
let g:neovide_cursor_vfx_particle_density=7.0
let g:neovide_cursor_vfx_particle_speed=10.0
let g:neovide_cursor_vfx_particle_phase=1.5
let g:neovide_cursor_vfx_particle_curl=1.0

"""""""""""""
"  Nvim-qt  "
"""""""""""""

if exists('g:GuiLoaded')
    GuiFont! SauceCodePro Nerd Font:h13
    GuiTabline 0
    GuiPopupmenu 1
    GuiScrollBar 1
    GuiWindowOpacity 0.95
  GuiRenderLigatures 1
endif

" Right Click Context Menu (Copy-Cut-Paste)
nnoremap <silent><RightMouse> :call GuiShowContextMenu()<CR>
inoremap <silent><RightMouse> <Esc>:call GuiShowContextMenu()<CR>
xnoremap <silent><RightMouse> :call GuiShowContextMenu()<CR>gv
snoremap <silent><RightMouse> <C-G>:call GuiShowContextMenu()<CR>gv

""""""""""
"  fvim  "
""""""""""
if exists('g:fvim_loaded')
    " good old 'set guifont' compatibility with HiDPI hints...
    if g:fvim_os == 'windows' || g:fvim_render_scale > 1.0
      set guifont=Iosevka\ Slab:h14
    else
      set guifont=FantasqueSansMono\ Nerd\ Font:h15
    endif
      
    FVimCursorSmoothMove v:true
    FVimCursorSmoothBlink v:true
    FVimBackgroundComposition 'transparent'
    FVimDrawFPS v:false
    " FVimCustomTitleBar v:false

    " Font tweaks
    FVimFontAntialias v:true
    FVimFontAutohint v:true
    FVimFontHintLevel 'full'
    FVimFontLigature v:true
    FVimFontSubpixel v:true

    " UI options (all default to v:false)
    " FVimUIPopupMenu v:false
    " FVimUIWildMenu v:false      " external wildmenu -- work in progress

    " Ctrl-ScrollWheel for zooming in/out
    nnoremap <silent> <C-ScrollWheelUp> :set guifont=+<CR>
    nnoremap <silent> <C-ScrollWheelDown> :set guifont=-<CR>
    nnoremap <A-CR> :FVimToggleFullScreen<CR>
endif

