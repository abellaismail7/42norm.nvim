if exists('g:loaded_ft_norm_nvim') | finish | endif

if !has('nvim-0.5')
    echohl Error
    echom "Sorry this plugin only works with versions of neovim that support lua"
    echohl clear
    finish
endif

if exists('g:loaded_ft_norm_nvim')
  finish
endif

let g:loaded_ft_norm_nvim = 1

command! -nargs=0 Ftnorm :lua require("ft_norm").format()
