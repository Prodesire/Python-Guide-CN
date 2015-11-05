Hitchhiker的Python指南
============================
翻译自 `Hitchhiker's Guide to Python <https://github.com/kennethreitz/python-guide>`_.

**Python 最佳实践指导书**

-----------

**在过程中工作。如果你愿意帮助，欢迎贡献你的力量。这里有很多工作要做。**

这份指南目前处于大量的发展阶段。这份颇具自我风格的指南旨在为Python新手和
专家提供一个关于Python安装、配置、和日常使用的最佳实践手册。


话题包括:

- 平台和特定版本的安装
- Py2app, Py2exe, bbfreeze, pyInstaller
- Pip
- Numpy, scipy, statpy, pylot, matlib
- Virtualenv
- Fabric
- 详尽的模块推荐, 按话题/作用划分
- 在哪些场景下使用哪些模块
- 服务器配置 & 多种多样的web框架工具
- 文档: 写文档
- 测试: Jenkins & tox 指南
- 如何从 ``git`` 到 ``hg`` 进行交互

如果你不喜欢阅读reStructuredText形式的文档, 这里有一份几乎最新的文档 
`HTML版，请戳docs.python-guide.org <http://docs.python-guide.org>`_.

使用指南
============================
1. 下载zip文件或clone到本地
2. 打开cmd，进入根目录，输入命令: make html
3. 上述步骤自动在根目录下生成build文件夹，打开./build/html/index.html即可浏览文档

或者
-----------------
1. 下载zip文件或clone到本地
2. 进入根目录，运行makehtml.bat