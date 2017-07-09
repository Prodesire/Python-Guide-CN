如何贡献
-----------------

此份指南处于大量的发展阶段，如果你愿意贡献一份力量，请见此：

http://docs.python-guide.org/en/latest/notes/contribute/

如何测试你的修改
------------------------

The html version of this guide is built with [sphinx](http://www.sphinx-doc.org/en/stable/). You may test your revisions locally by having sphinx installed. You can do this easily with pip (as described in the link).

``` bash
pip install --user sphinx
```

Then navigate to the directory of the makefile and ```make build``` or ```make html```. Sphinx will then generate the html in a folder called _build/html

After navigating to this folder, you can then use python's built in webserver to view your changes locally:

``` bash
python3 -m http.server
```

By default, http.server listens on every ip address bound on your host on port 8000. To bind to a specific one, say, localhost on port 8005:

``` bash
python3 -m http.server 8005 --bind 127.0.0.1
```


风格指南
-----------

所有的贡献请遵循 `指南风格指引`:

http://docs.python-guide.org/en/latest/notes/styleguide/
