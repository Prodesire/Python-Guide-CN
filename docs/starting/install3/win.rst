.. _install3-windows:


##############################
在Windows上安装Python 3

##############################

.. image:: https://farm5.staticflickr.com/4276/34435689480_2e6f358510_k_d.jpg

首先，遵照 `Chocolatey <https://chocolatey.org/install>`_ 的安装指引。
它是 Windows 7+ 的社区系统包管理器（很像Mac OS X上的Homebrew）。

完成之后，安装Python 3会非常简单，因为Chocolatey将Python 3作为默认设置。

.. code-block:: doscon

    choco install python

一旦您运行了上述命令，您应该能够直接从控制台启动Python。（Chocolatey非常棒，会自动将Python添加到您的系统路径中。）


****************
Setuptools + Pip
****************

`setuptools <https://pypi.org/project/setuptools>`_ 和 `pip <https://pip.pypa.io/en/stable/>`_
是两个最重要的第三方Python包。

安装完成后，您可以使用单个命令下载、安装和卸载任何兼容的Python应用包。还可以轻松地这种网络安装的方式加入到自己开发
的Python应用中。

所有受支持的Python 3版本都包含pip，因此请确保它是最新的:

.. code-block:: doscon

    python -m pip install -U pip


********************
Pipenv & 虚拟环境
********************

下一步安装 Pipenv，然后就可以安装依赖关系并管理虚拟环境。

虚拟环境工具通过为不同项目创建专属的 Python 虚拟环境，以实现其依赖的库独立保存在不同的路径。
这解决了“项目X依赖于 1.x 版本，但项目 Y 需要 4.x”的难题，并且维持全局的 site-packages 目录干净、易管理。 

举个例子，通过这个工具可以实现依赖 Django 2.0 的项目与依赖 Django 1.8 的项目共存。

所以，向前！进入到 :ref:`Pipenv & 虚拟环境 <virtualenvironments-ref>` 文档中！

--------------------------------

该页是 `另一份指南 <https://www.stuartellis.name/articles/python-development-windows/>`_ 的混合版本，可通过同一份许可获取。

