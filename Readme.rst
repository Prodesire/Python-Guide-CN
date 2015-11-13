Test
Python最佳实践指南中文版
============================
项目翻译自 `Hitchhiker's Guide to Python <https://github.com/kennethreitz/python-guide>`_。

Readthedocs文档地址 `Python最佳实践指南中文版 <http://pythonguidecn.readthedocs.org/>`_。

**项目还在进行中，如果你有意一起翻译，欢迎贡献你的力量。这里还有很多工作要做~**

-----------

本指南目前持续不断地更新与完善。这份主要是自我见解的指南旨在为Python初学者和
专家提供一个关于Python安装、配置、和日常使用的最佳实践手册。


主题包括:

- 不同平台和系统上的安装
- Py2app, Py2exe, bbfreeze, pyInstaller
- Pip
- Numpy, scipy, statpy, pylot, matlib
- Virtualenv
- Fabric
- 优秀的模块推荐，按主题/目的分类
- 在哪些场景下使用哪些模块
- 服务器配置 & 不同的web框架和工具
- 文档: 写文档
- 测试: Jenkins & tox 指南
- 如何更方便地通过 ``git`` 连接 ``hg``

如果你不习惯阅读reStructuredText形式的文档, 这里有一份同步更新的 `HTML版文档，请戳它 <http://pythonguidecn.readthedocs.org/>`_。

使用指南
============================
1. 打开cmd，运行 `pip install sphinx` 安装sphinx
2. 下载zip文件或clone到本地
3. 打开cmd，进入根目录，输入命令: make html 或者进入根目录，运行makehtml.bat
4. 上述步骤自动在根目录下生成build文件夹，打开./build/html/index.html即可浏览文档

或者
---------------------------
- 直接访问 `Python最佳实践指南中文版 <http://pythonguidecn.readthedocs.org/>`_。
