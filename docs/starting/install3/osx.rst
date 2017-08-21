:orphan: This article should not be added to a toctree for now

.. _install3-osx:

在Mac OS X上安装Python 3
================================

最新版本的Mac OS X，Sierra， **自带Python 2.7**。

你不必安装和配置即可直接使用Python 2。本教程用来说明Python 3的安装。

OS X自带的Python版本更适合用于学习而不是开发。因为版本与Python官网发布的 `官方最新稳定版本 
<https://www.python.org/downloads/mac-osx/>`_ 相比可能已经过时。

现在就开始吧！
--------------

跟着我一起安装真实版本的Python吧。

在正式安装之前，应先安装C编译器。最快的方式是运行 ``xcode-select --install`` 来安装Xcode命令行工具。
你也可以从Mac应用商店下载完全版的 `XCode <http://developer.apple.com/xcode/>`_， 
或者更轻巧的 `OSX-GCC-Installer <https://github.com/kennethreitz/osx-gcc-installer#readme>`_ 。

.. 注意::
    如果已经安装了XCode，请不要再安装 OSX-GCC-Installer。两者结合可能会引发难以诊断的问题。

.. 注意::
    执行XCode的全新安装完成后，须在终端执行下述命令 ``xcode-select --install`` 来安装命令行工具。


尽管OS X系统附带了大量UNIX工具，熟悉Linux系统的人员使用时会发现缺少一个重要的组件——合适的包管理工具，
`Homebrew <http://brew.sh>`_ 正好填补了这个空缺。

`安装 Homebrew <http://brew.sh/#install>`_ 只需打开 :file:`终端` 或个人常用的终端模拟器并运行：

.. code-block:: console

    $ /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

运行这段脚本将列出它会引起的改变，并在安装开始前提示你。
安装完成Homebrew后，需将其所在路径插入到 :envvar:`PATH` 环境变量的最前面，即在你所登录用户的
:file:`~/.profile` 文件末尾加上这一行：

.. code-block:: console

    export PATH=/usr/local/bin:/usr/local/sbin:$PATH

接下来可以开始安装Python 3：

.. code-block:: console

    $ brew install python3

这将持续几分钟。


Pip
---

Homebrew 会为你安装 ``pip3`` 。

``pip3`` 是Homebrew版Python 3的 ``pip`` 的别名。

使用Python 3
---------------------

这个时候，在你系统上可能Python 2.7也是可用的。可能 :ref:`Homebrew 版本的Python 2 <install-osx>`
和Python 3都安装了。 

.. code-block:: console

    $ python

将打开系统Python解释器。

.. code-block:: console

    $ python2

将会打开使用Homebrew安装的Python 2解释器（如果有）。

.. code-block:: console

    $ python3

将会打开使用Homebrew安装的Python 3解释器（如果有）。

如果Homebrew版的Python 2安装了，``pip2`` 指向Python 2。
如果Homebrew版的Python 3安装了，``pip3`` 指向Python 3。


虚拟环境
--------------------

虚拟环境工具(通常是指“virturalenv”)通过为不同项目创建专属的Python虚拟环境，以实现其依赖的库独立保存在不同的路径。
这解决了“项目X依赖包版本1.x，但项目Y依赖包版本为4.x”的难题, 并且维持全局的site-packages目录干净、易管理。 

举个例子，通过这个工具可以实现依赖Django 1.10的项目与依赖Django 1.8的项目共存。

进一步了解与使用请参考文档 :ref:`虚拟环境 <virtualenvironments-ref>`  。

也可使用 :ref:`virtualenvwrapper <virtualenvwrapper-ref>` 更轻松地管理你的虚拟环境。

--------------------------------

该页是 `另一份指南 <http://www.stuartellis.eu/articles/python-development-windows/>`_ 的混合版本，可通过同一份许可获取。

