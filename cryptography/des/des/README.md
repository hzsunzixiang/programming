# des

http://page.math.tu-berlin.de/~kant/teaching/hess/krypto-ws2006/des.htm
https://github.com/aimxhaisse/des

## Description
Yet another C implementation of DES.

## Usage
Example of usage :
```sh
$ ./des
    usage: des [-de] [-i infile] [-o outfile] [-k=key]
        -e       encrypt infile to outfile using key
        -d       decrypt infile to outfile using key
$ ./des -e -i /bin/ls -o /tmp/ls_encrypted -k "hello!"
$ ./des -d -i /bin/ls_encrypted -o /tmp/ls -k "hello!"
$ diff /tmp/ls /bin/ls
```

## License
Copyright (c) 2010 C. Chorin, S. Rannou <mxs@buffout.org>

Permission to use, copy, modify, and distribute this software for any
purpose with or without fee is hereby granted, provided that the above
copyright notice and this permission notice appear in all copies.

THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
