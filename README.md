# url.vim

Vim plugin that allows for opening abstract links of different types.

## Installation

If you don't have a preferred installation method check out
[vim-plug](https://github.com/junegunn/vim-plug):

```vim
Plug 'gfontenot/vim-url-opener'
```

## Usage

`url.vim` is a super thin wrapper around `netrw` that allows for basic url
transformations before opening them. It works by exposing an entry point
(`g:url_transformers`) so that you can define a custom set of functions to run
against the word under the cursor.

For example, if you were to define something like:

```vim
function! g:example_url(word)
  if a:word ==# 'foo'
    return 'http://example.com'
  endif
endfunction
```

You could then add it as a transformer inside your vimrc:

```vim
let g:url_transformers =
      \ [ 'example_url'
      \ ]
```

With this small bit of configuration, invoking `gx` when over the word `foo`
will open `http://example.com`.

Custom transformation functions like this should return either a string
for the input value that is able to be handled by netrw, or it should return
nothing if it shouldn't take any action.

`url.vim` will move through the list of transformers until one returns a
value. If none of the transformers return a value, it will pass the raw value
(the word under the cursor) to `netrw` for handling.

### Mappings

`url.vim` maps itself to `gx` by default. This is intentional, since it's
intended to take the place of `netrw`. If you have an existing custom mapping
assigned to `gx`, it will be left alone.

## License

url.vim is copyright © 2018 Gordon Fontenot. It is free software, and may be
redistributed under the terms specified in the `LICENSE` file.
