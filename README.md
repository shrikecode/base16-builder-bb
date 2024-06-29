
# base16 builder in babashka

It is kind of toy project to make base16 theme builder in Clojure, and since
it's a command-line tool, why not use babashka? For migh clone the whole repo
and run it like this:

``` sh
cat scheme.yaml | bb -m base16/-main --template template.mustache \
    > colorscheme.vim # or whatever out file you want
```

Alternatively you can also pass scheme as an argument:

``` sh
bb -m base16/-main --template template.mustache --scheme scheme.yaml \
    > colorscheme.vim
```

## Installation

Just grab the `base16-builder-bb` from the releases, put somewhere in your `$PATH`,
make it executable and you're good to go.

### Requirements

* babashka

## Installing from source

Just run:

``` sh
bb build # creates a script in ./bin of the project
sudo bb install # copies the script to /usr/local/bin
```

To install in custom dir (e.g.: your local user scripts dir):

``` sh
bb install --destdir ~/.local/bin
```

### Build requirements

* babashka

## Note

It is very barebones for now, will add some arguments and error handling in the
future.

## Roadmap

* [ ] add option to build whole dir with templates like newer builders
* [ ] arguments like `--version`, `--help`
* [ ] arguments validation
* [ ] ~~build single binary from the project~~
* [x] build single script from the project
