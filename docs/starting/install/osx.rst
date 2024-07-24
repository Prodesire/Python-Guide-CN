.. _install-osx:


###############################
在Mac OS X上安装Python 2
###############################

.. image:: https://farm5.staticflickr.com/4268/34435688560_4cc2a7bcbb_k_d.jpg

.. note::
    查看我们的 :ref:`在OS X上安装Python 3指南<install3-osx>`.

Mac OS X的 10.8~12.3 版本自带 Python 2.7。

如果您的Mac OS X版本在上述版本之间，不必安装和配置即可直接使用Python进行开发。
话虽如此，我还是强烈建议各位，在正式开始Python应用开发前，安装接下来教程中所介绍的工具和库。
特别应该安装Setuptools——它将简化安装和使用Python第三方库的流程。

OS X自带的Python版本更适合用于学习而不是开发。因为版本与Python官网发布的 `官方最新稳定版本 
<https://www.python.org/downloads/mac-osx/>`_ 相比可能已经过时。


**************
现在就开始吧！
**************

跟着我一起安装真实版本的Python吧。

在正式安装之前，应先安装C编译器。最快的方式是运行 ``xcode-select --install`` 来安装Xcode命令行工具。
您也可以从Mac应用商店下载完全版的 `Xcode <https://developer.apple.com/xcode/>`_， 
或者更轻巧的 `OSX-GCC-Installer <https://github.com/kennethreitz/osx-gcc-installer#readme>`_ 。

.. note::
    如果已经安装了Xcode，请不要再安装 OSX-GCC-Installer。两者结合可能会引发难以诊断的问题。

.. note::
    执行Xcode的全新安装完成后，须在终端执行下述命令 ``xcode-select --install`` 来安装命令行工具。


尽管OS X系统附带了大量Unix工具，熟悉Linux系统的人员使用时会发现缺少一个重要的组件——合适的包管理工具，
`Homebrew <https://brew.sh>`_ 正好填补了这个空缺。

`安装 Homebrew <https://brew.sh/#install>`_ 只需打开 :file:`终端` 或个人常用的终端模拟器并运行：

.. code-block:: console

    $ /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

运行这段脚本将列出它会引起的改变，并在安装开始前提示您。
安装完成Homebrew后，需将其所在路径插入到 :envvar:`PATH` 环境变量的最前面，即在您所登录用户的
:file:`~/.profile` 文件末尾加上这一行：

.. code-block:: console

    export PATH="/usr/local/bin:/usr/local/sbin:$PATH"

接下来可以开始安装Python 2.7：

.. code-block:: console

    $ brew install python@2

因为 ``python@2`` 像一个“桶”，我们需要再次更新我们的``PATH``，以指向我们的新安装：

.. code-block:: console

    export PATH="/usr/local/opt/python@2/libexec/bin:$PATH"

Homebrew命名可执行文件 ``python2``，以便您仍然可以通过可执行文件“python”运行系统Python。

.. code-block:: console

    $ python -V   # Homebrew安装的Python 3解释器（如果安装了）
    $ python2 -V  # Homebrew安装的Python 2解释器
    $ python3 -V  # Homebrew安装的Python 3解释器（如果安装了）


****************
Setuptools & Pip
****************

Homebrew会自动安装好Setuptools和 ``pip`` 。
Setuptools提供 ``easy_install`` 命令，实现通过网络（通常Internet）下载和安装第三方Python包。
还可以轻松地将这种网络安装的方式加入到自己开发的Python应用中。


``pip`` 是一款方便安装和管理Python 包的工具，
在 `一些方面 <https://python-packaging-user-guide.readthedocs.org/en/latest/pip_easy_install/#pip-vs-easy-install>`_ ，
它更优于 ``easy_install`` ，故更推荐它。

.. code-block:: console

    $ pip2 -V  # pip指向Homebrew安装的Python 2解释器
    $ pip -V  # pip指向Homebrew安装的Python 3解释器（如果安装了）


****************************************
虚拟环境(Virtual Environment)
****************************************

虚拟环境工具(virturalenv)通过为不同项目创建专属的Python虚拟环境，以实现其依赖的库独立保存在不同的路径。
这解决了“项目X依赖包版本1.x，但项目Y依赖包版本为4.x”的难题，并且维持全局的site-packages目录干净、易管理。

举个例子，通过这个工具可以实现依赖Django 1.10的项目与依赖Django 1.8的项目共存。

进一步了解与使用请参考文档  :ref:`Virtual Environments <virtualenvironments-ref>` 。

--------------------------------

该页是 `另一份指南 <https://www.stuartellis.name/articles/python-development-windows/>`_ 的混合版本，可通过同一份许可获取。