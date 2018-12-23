如何贡献
-----------------

此份指南处于大量的发展阶段，如果您愿意贡献一份力量，请见此：

https://docs.python-guide.org/en/latest/notes/contribute/

如何测试您的修改
------------------------

本指南的html版本使用 [sphinx](http://www.sphinx-doc.org/en/stable/) 构建。 
您可以通过在本地安装sphinx测试您的修订版本。您可以轻松地使用pip（如链接中所述）。

``` bash
pip install --user sphinx
```

然后导航到makefile的目录，并执行 ```make build``` 或 ```make html``` 。然后，
Sphinx将在名为 `_build/html` 的文件夹中生成html。

导航到此文件夹后，您可以使用Python的内置Web服务器在本地查看更改：

``` bash
python3 -m http.server
```

默认情况下，`http.server` 监听每个绑定在您的主机IP地址的8000端口。要绑定到特定IP和端口，例如，localhost的8005端口：

``` bash
python3 -m http.server 8005 --bind 127.0.0.1
```


风格指南
-----------

所有的贡献请遵循 `指南风格指引`:

https://docs.python-guide.org/notes/styleguide/
