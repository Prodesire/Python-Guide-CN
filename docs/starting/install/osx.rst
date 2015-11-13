.. _install-osx:

在Mac OS X上安装Python
=============================

最新版本的Mac OX X, E1 Captian上 **自带 Python 2.7**。

不必安装和配置即可直接使用Python进行开发。
话虽如此，我还是强烈建议各位，在正式开始Python应用开发前，安装接下来教程中所介绍的工具和库。
特别应该安装Setuptools——它将简化安装和使用Python第三方库的流程。

OS X自带的Python版本更适合用于学习而不是开发。因为版本与Python官网发布的 `官方最新稳定版本 <https://www.python.org/downloads/mac-osx/>`_,相比可能已经过时。


现在就开始吧！
--------------

跟着我一起安装合适的Python吧。

在正式安装之前，应先安装GCC。GCC的获取方式包括：下载安装 `XCode <http://developer.apple.com/xcode/>`_, 或安装小巧一些的 `Command Line Tools <https://developer.apple.com/downloads/>`_ (需要一个Apple账号)
或者更轻巧的 `OSX-GCC-Installer <https://github.com/kennethreitz/osx-gcc-installer#readme>`_ 。

.. 注意::
    如果已经安装了XCode，请不要再安装 OSX-GCC-Installer。两者结合可能会引发难以诊断的问题。

.. 注意::
    执行XCode的全新安装完成后，须在终端执行下述命令 ``xcode-select --install`` 来安装命令行工具。
	
尽管OS X系统附带了大量UNIX工具，熟悉Linux系统的人员使用时会发现缺少一个重要的组件——合适的包管理工具， `Homebrew <http://brew.sh>` 正好填补了这个空缺。

`安装 Homebrew <http://brew.sh/#install>`_ 只需打开 :file:`终端` 或个人常用的终端模拟器并运行

.. code-block:: console

    $ ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

运行这段脚本将列出它会引起的改变，并在安装开始前提示你。
安装完成Homebrew后，需将其所在路径插入到 :envvar:`PATH` 环境变量的最前面，即在你所登录用户的 :file:`~/.profile` 文件末尾加上这一行：

.. code-block:: console

    export PATH=/usr/local/bin:/usr/local/sbin:$PATH

接下来可以开始安装Python 2.7：

.. code-block:: console

    $ brew install python

耗时大概几分钟。

Setuptools & Pip
----------------

Homebrew会自动安装好Setuptools和 ``pip`` 。
Setuptools提供 ``easy_install`` 命令，实现通过网络（通常Internet）下载和安装第三方Python包。
还可以简单地使用该命令将自己开发的Python应用加入到这种包管理方式中。


``pip`` 是一款方便安装和管理Python 包的工具，
在 `一些方面 <https://python-packaging-user-guide.readthedocs.org/en/latest/pip_easy_install/#pip-vs-easy-install>`_ ，它更优于 ``easy_install`` ，故更推荐它。



虚拟环境(Virtual Environment)
--------------------
Virtual Environment工具通过为不同项目创建专属的Python虚拟环境，以实现其依赖的库独立保存在不同的路径。
这解决了“项目X依赖包版本1.x，但项目Y依赖包版本为4.x”的难题，并且维持全局的site-packages目录干净、易管理。

举个栗子，通过这个工具可以实现依赖Django 1.3的项目与依赖Django 1.0的项目共存。

进一步了解与使用请参考文档 `Virtual Environments <http://github.com/kennethreitz/python-guide/blob/master/docs/dev/virtualenvs.rst>`_ 

--------------------------------

该页是 `另一份指南 <http://www.stuartellis.eu/articles/python-development-windows/>`_ 的混合版本，可通过同一份许可获取。