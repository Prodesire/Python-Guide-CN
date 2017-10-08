.. _install-windows:

在Windows上安装Python 2
============================

.. image:: https://farm5.staticflickr.com/4268/34435688560_4cc2a7bcbb_k_d.jpg

首先，从官网下载 `最新版本 <https://www.python.org/ftp/python/2.7.14/python-2.7.14.msi>`_
的Python 2.7。如果想要确保下载到最新版本，单击 `Python官网 <http://python.org>`_ 的
Downloads > Windows 链接。

Windows版本是MSI文件格式，双击它即可开始安装。MSI文件格式允许Windows管理员使用标准工具自动
进行安装流程。

Python将安装到内含版本号信息的路径，例如Python 2.7版本将被安装到 :file:`C:\\Python27\\`, 
故多个版本的Python可以共存在一个系统里，不会有冲突。当然仅有一个默认的Python解释器，
:envvar:`PATH` 环境变量也不是自动修改的，开发人员可以控制要运行的Python版本。

把默认使用的Python版本路径加到 :envvar:`PATH` 环境变量中，避免每次使用时都要冗余地写全Python
解释器路径。假设安装路径是 :file:`C:\\Python27\\`, 将这段加入到 :envvar:`PATH` 中:

.. code-block:: console

    C:\Python27\;C:\Python27\Scripts\

或在 ``powershell`` 中运行:

.. code-block:: console

    [Environment]::SetEnvironmentVariable("Path", "$env:Path;C:\Python27\;C:\Python27\Scripts\", "User")

这也是安装过程中的一个选择。

其中第二个路径(:file:`Scripts`)可接收已安装包的命令文件，添加这个路径很有益处。虽然以上步骤完成后，
就可以开始正式使用Python了，但我还是强烈建议各位，在正式开始Python应用开发前，安装接下来教程中所介绍
的工具和库。特别应该安装Setuptools——它将简化安装和使用Python第三方库的流程。

Setuptools + Pip
----------------

Setuptools是一款非常重要的Python第三方工具，它是标准包自带的distutils工具的增强版。一旦安装Setuptools后，
就可以通过一行指令下载和安装任何可获取到的Python应用包，还可以轻松地将这种网络安装的方式加入到自己开发
的Python应用中。

通过运行Python脚本 `ez_setup.py <https://bootstrap.pypa.io/ez_setup.py>`_ 获取最新
Windows版本的Setuptools。

安装完后就可以使用 **easy_install** 命令，但由于该命令已经被大多数人弃用，我们将安装替代它的 **pip** 命令。
Pip支持包的卸载，而且与easy_install不同，它一直处于维护下。

通过运行Python脚本 `get-pip.py <https://raw.github.com/pypa/pip/master/contrib/get-pip.py>`_ 可安装pip


虚拟环境
--------------------

虚拟环境工具(通常是指“virturalenv”)通过为不同项目创建专属的Python虚拟环境，以实现其依赖的库独立保存在不同的路径。
这解决了“项目X依赖包版本1.x，但项目Y依赖包版本为4.x”的难题, 并且维持全局的site-packages目录干净、易管理。 

举个例子，通过这个工具可以实现依赖Django 1.10的项目与依赖Django 1.8的项目共存。

进一步了解与使用请参考文档 :ref:`Virtual Environments <virtualenvironments-ref>` 。

--------------------------------

该页是 `另一份指南 <http://www.stuartellis.eu/articles/python-development-windows/>`_ 的混合版本，可通过同一份许可获取。

