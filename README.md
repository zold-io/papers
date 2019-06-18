<img src="http://www.zold.io/logo.svg" width="92px" height="92px"/>

[![Donate via Zerocracy](https://www.0crat.com/contrib-badge/CAZPZR9FS.svg)](https://www.0crat.com/contrib/CAZPZR9FS)

[![Build Status](https://travis-ci.org/zold-io/papers.svg?branch=master)](https://travis-ci.org/zold-io/papers)
[![License](https://img.shields.io/badge/license-MIT-green.svg)](https://github.com/yegor256/takes/blob/master/LICENSE.txt)
[![Hits-of-Code](https://hitsofcode.com/github/zold-io/papers)](https://hitsofcode.com/view/github/zold-io/papers)

Here is the [White Paper](https://papers.zold.io/wp.pdf).

Join our [Telegram group](https://t.me/zold_io) to discuss it all live.

The documentation here is created in [LaTeX](https://www.latex-project.org/).
In order to compile these `.tex` files in to `.pdf` you have to
install
[Ruby 2.3+](https://www.ruby-lang.org/en/documentation/installation/),
[Rubygems](https://rubygems.org/pages/download),
and
[Bundler](https://bundler.io/). Then, you have to install
[LaTeX](https://www.latex-project.org/get/).
Then:

```bash
$ bundle update
$ bundle exec rake --quiet
```

You should get `.pdf` files in the `target` directory. If something
goes wrong, don't hesitate to [submit a ticket](https://github.com/zold-io/papers/issues).

If you find a typo in any document, please let us know via a new ticket.
If you want to contribute, you are more than welcome. The White Paper (`wp.tex`)
is the main document here, this is where you can contribute.
