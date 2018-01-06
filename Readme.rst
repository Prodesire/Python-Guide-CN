Python最佳实践指南中文版
============================

.. image:: https://farm1.staticflickr.com/628/33173824932_58add34581_k_d.jpg

项目翻译自 `Hitchhiker's Guide to Python <https://github.com/kennethreitz/python-guide>`_。

Readthedocs文档地址 `Python最佳实践指南中文版 <http://pythonguidecn.readthedocs.org/>`_。

-----------

本指南目前持续不断地更新与完善。这份主要是自我见解的指南旨在为Python初学者和
专家提供一个关于Python安装、配置、和日常使用的最佳实践手册。


主题包括:

- 不同平台和系统上的安装
- Py2app, Py2exe, bbfreeze, pyInstaller
- Pip
- Numpy, scipy, statpy, pyplot, matplotlib
- Virtualenv
- Fabric
- 优秀的模块推荐，按主题/目的分类
- 在哪些场景下使用哪些模块
- 服务器配置 & 不同的web框架和工具
- 文档: 写文档
- 测试: Jenkins & tox 指南
- 如何更方便地通过 ``git`` 连接 ``hg``

如果您不习惯阅读reStructuredText形式的文档, 这里有一份同步更新的 `HTML版文档，请戳它 <http://pythonguidecn.readthedocs.org/>`_。

使用指南
============================
1. 下载zip文件或clone到本地，并进入到项目根目录
2. 打开命令行，运行 `pip install -r requirements.txt` 安装依赖
3. 打开命令行，运行 `make html` ; 或者（针对Windows）运行makehtml.bat
4. 上述步骤自动在根目录下生成build文件夹，打开./build/html/index.html即可浏览文档

或者
---------------------------
- 直接访问 `Python最佳实践指南中文版 <http://pythonguidecn.readthedocs.org/>`_。
