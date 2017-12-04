.. _install3-windows:

在Windows上安装Python 3
==============================

.. image:: https://farm5.staticflickr.com/4276/34435689480_2e6f358510_k_d.jpg

首先，从官网下载 `最新版本 <https://www.python.org/ftp/python/3.6.3/python-3.6.3.exe>`_
的Python 3.6。如果想要确保下载到最新版本，单击 `Python官网 <http://python.org>`_ 的
Downloads > Windows 链接。

Python将安装到内含版本号信息的路径，例如Python 3.6版本将被安装到 :file:`C:\\Python36\\`, 
故多个版本的Python可以共存在一个系统里，不会有冲突。当然仅有一个默认的Python解释器，
:envvar:`PATH` 环境变量也不是自动修改的，开发人员可以控制要运行的Python版本。

把默认使用的Python版本路径加到 :envvar:`PATH` 环境变量中，避免每次使用时都要冗余地写全Python
解释器路径。假设安装路径是 :file:`C:\\Python36\\`, 将这段加入到 :envvar:`PATH` 中:

.. code-block:: console

    C:\Python36\;C:\Python36\Scripts\

或在 ``powershell`` 中运行:

.. code-block:: console

    [Environment]::SetEnvironmentVariable("Path", "$env:Path;C:\Python36\;C:\Python36\Scripts\", "User")

这也是安装过程中的一个选择。

其中第二个路径(:file:`Scripts`)可接收已安装包的命令文件，添加这个路径很有益处。虽然以上步骤完成后，
就可以开始正式使用Python了，但我还是强烈建议各位，在正式开始Python应用开发前，安装接下来教程中所介绍
的工具和库。特别应该安装Setuptools——它将简化安装和使用Python第三方库的流程。

使用Python 3
---------------------

这个时候，您可能已经安装了Python 2.7。

.. code-block:: console

    $ python

将打开Python 2解释器。

.. code-block:: console

    $ python3

将打开Python 3解释器。


Setuptools + Pip
----------------

`setuptools <https://pypi.python.org/pypi/setuptools>`_ 和 `pip <https://pip.pypa.io/en/stable/>`_
是两个最重要的第三方Python包。

安装完成后，您可以使用单个命令下载、安装和卸载任何兼容的Python应用包。还可以轻松地这种网络安装的方式加入到自己开发
的Python应用中。

所有受支持的Python 3版本都包含pip，因此请确保它是最新的::

    python -m pip install -U pip


Pipenv & 虚拟环境
--------------------

下一步安装 Pipenv，然后就可以安装依赖关系并管理虚拟环境。

虚拟环境工具通过为不同项目创建专属的 Python 虚拟环境，以实现其依赖的库独立保存在不同的路径。
这解决了“项目X依赖于 1.x 版本，但项目 Y 需要 4.x”的难题，并且维持全局的 site-packages 目录干净、易管理。 

举个例子，通过这个工具可以实现依赖 Django 1.10 的项目与依赖 Django 1.8 的项目共存。

所以，向前！进入到 :ref:`Pipenv & 虚拟环境 <virtualenvironments-ref>` 文档中！

--------------------------------

该页是 `另一份指南 <http://www.stuartellis.eu/articles/python-development-windows/>`_ 的混合版本，可通过同一份许可获取。

