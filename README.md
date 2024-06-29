
# base16 builder in babashka

It is kind of toy project to make base16 theme builder in Clojure, and since it's
a command-line tool, why not use babashka? For now you need to clone the whole
repo and run it like this:

``` sh
cat scheme.yaml | bb -m base16/-main --template template.mustache \
    > colorscheme.vim # or whatever out file you want
```

Alternatively you can also pass scheme as an argument:

``` sh
bb -m base16/-main --template template.mustache --scheme scheme.yaml \
    > colorscheme.vim
```

## Roadmap

* [ ] add option to build whole dir with templates like newer builders
* [ ] build single binary from the project
