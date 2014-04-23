# (The MIT license)
#
# Copyright (c) 2014 sasa+1 <sasaplus1@gmail.com>
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to
# deal in the Software without restriction, including without limitation the
# rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
# sell copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
# FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
# IN THE SOFTWARE.

up() {
  # arguments not found
  [ "$#" -eq 0 ] && _up_usage

  expr "$1" + 0 >/dev/null 2>&1

  # $1 is not a number?
  if [ "$?" -eq 2 ]
  then
    # $1 is not a number
    _up_grep $1
  else
    # $1 is a number
    _up_move $1
  fi
}

_up_grep() {
  cd "$(echo -n "$PWD" | grep -Eio "^.*$1[^/]*")"
}

_up_move() {
  local dir=

  for ((i=1; i<=$1; i++))
  do
    dir=${dir}../
  done

  cd "$dir"
}

_up_usage() {
  # CAUTION: do not delete tabs
  cat <<-USAGE >&2
	Usage: up pattern
	USAGE
}
