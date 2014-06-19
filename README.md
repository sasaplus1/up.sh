# up.sh

jump to parent dir

## Installation

append to your `.bashrc` or `.bash_profile` the following:

```sh
. /path/to/up.sh
```

## Usage

### use number

```sh
$ pwd
/foo/bar/baz/qux/quux
$ up 3
$ pwd
/foo/bar
```

### use grep

```sh
$ pwd
/foo/bar/baz/qux/quux
$ up az
$ pwd
/foo/bar/baz
```

## License

The MIT license. Please see top of `up.sh`.
