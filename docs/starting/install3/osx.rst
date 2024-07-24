:orphan: This article should not be added to a toctree for now

.. _install3-osx:


###############################
在Mac OS X上安装Python 3
###############################

.. image:: https://farm5.staticflickr.com/4276/34435689480_2e6f358510_k_d.jpg

Mac OS X的 10.8~12.3 版本自带 Python 2.7。

如果您的Mac OS X版本在上述版本之间，不必安装和配置即可直接使用Python 2。本教程用来说明Python 3的安装。

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

    $ /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

运行这段脚本将列出它会引起的改变，并在安装开始前提示您。
安装完成Homebrew后，需将其所在路径插入到 :envvar:`PATH` 环境变量的最前面，即在您所登录用户的
:file:`~/.profile` 文件末尾加上这一行：

.. code-block:: console

    export PATH="/usr/local/opt/python/libexec/bin:$PATH"

如果您使用的是 OS X 10.12（Sierra）或者更旧的系统，请使用如下命令

.. code-block:: console

    export PATH=/usr/local/bin:/usr/local/sbin:$PATH

接下来可以开始安装Python 3：

.. code-block:: console

    $ brew install python

这将持续几分钟。


***
Pip
***

Homebrew 会为您安装 ``pip3`` 。

``pip3`` 是Homebrew版Python 3的 ``pip`` 的别名。


*********************
使用Python 3
*********************

这个时候，在您系统上可能Python 2.7也是可用的。可能 :ref:`Homebrew 版本的Python 2 <install-osx>`
和Python 3都安装了。 

.. code-block:: console

    $ python

将打开通过HomeBrew安装的Python解释器。

.. code-block:: console

    $ python2

将会打开使用Homebrew安装的Python 2解释器（如果有）。

.. code-block:: console

    $ python3

将会打开使用Homebrew安装的Python 3解释器（如果有）。

如果Homebrew版的Python 2安装了，``pip2`` 指向Python 2。
如果Homebrew版的Python 3安装了，``pip`` 指向Python 3。

本指南的其余部分假定 ``python`` 指 Python 3。

.. code-block:: console

    # 我安装Python 3了吗？
    $ python --version
    Python 3.6.4 # Success! 
    # If you still see 2.7 ensure in PATH /usr/local/bin/ takes pecedence over /usr/bin/

*********************
Pipenv & 虚拟环境
*********************

下一步安装 Pipenv，然后就可以安装依赖关系并管理虚拟环境。

虚拟环境工具通过为不同项目创建专属的 Python 虚拟环境，以实现其依赖的库独立保存在不同的路径。
这解决了“项目X依赖于 1.x 版本，但项目 Y 需要 4.x”的难题，并且维持全局的 site-packages 目录干净、易管理。 

举个例子，通过这个工具可以实现依赖 Django 1.10 的项目与依赖 Django 1.8 的项目共存。

所以，向前！进入到 :ref:`Pipenv & 虚拟环境 <virtualenvironments-ref>` 文档中！

--------------------------------

该页是 `另一份指南 <https://www.stuartellis.name/articles/python-development-windows/>`_ 的混合版本，可通过同一份许可获取。

