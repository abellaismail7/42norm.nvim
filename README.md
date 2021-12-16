# FT NORM (under development)
FT NORM is a neovim plugin that norm your code, so you can write it in the way you likeand we will do the rest.

# We can We can't
We can handle most norm errors but we can't handle :

1. 25 line limit (but we will warn you).
1. if you have a syntax error code then it might not work.

# Requirements
this plugin will only work if you have neovim (0.5 or later) with treesitter installed.

# checklist 
here is the current state:

| Norm           | implemented      | mostly works |
|----------------|------------------|--------------|
| space checker  |         ✓        |      ✗       |
