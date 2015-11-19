.. _install-linux:

在Linux上安装Python
==========================

最新版本的CentOS, Fedora, Redhat企业版(RHEL)和Ubuntu **自带 Python 2.7**。

想要获取已安装的Python版本号，可以通过终端运行命令：

.. code-block:: console

    $ python --version

部分旧版本的RHEL和CentOS系统自带Python 2.4，该版本已不被目前的Python应用接受。幸运的是，
`Extra Packages for Enterprise Linux` (epel, 企业版Linux的额外软件包)基于Fedora的版本提供高质量
的附加软件包，该仓库包含与系统自带的Python 2.4共同安装好的Python 2.6。

.. _Extra Packages for Enterprise Linux: http://fedoraproject.org/wiki/EPEL

你不必安装和配置即可直接使用Python进行开发。话虽如此，我还是强烈建议各位，在正式开始Python应用
开发前，安装接下来教程中所介绍的工具和库。特别应该安装Setuptools和pip，它们将简化安装和使用
Python第三方库的流程。

Setuptools & Pip
----------------

`setuptools <https://pypi.python.org/pypi/setuptools>`_ 和 `pip <https://pip.pypa.io/en/stable/>`_
是最重要的两个Python第三方软件包。一旦安装了它们，就可以通过一条指令下载、安装和卸载可获取到的
Python应用包，还可以轻松地将这种网络安装的方式加入到自己开发的Python应用中。

Python 2.7.9 以及之后版本(Python2 系列)，和Python 3.4以及之后版本均默认包含pip。

运行以下命令行代码检查pip是否已经安装：

.. code-block:: console

    $ command -v pip

`参考官方pip安装指南 <https://pip.pypa.io/en/latest/installing/>`_ 获取pip工具，并自动安装最新版本的setuptools。

Virtual Environments
--------------------

虚拟环境工具(virturalenv)通过为不同项目创建专属的Python虚拟环境，以实现其依赖的库独立保存在不同的路径。
这解决了“项目X依赖包版本1.x，但项目Y依赖包版本为4.x”的难题, 并且维持全局的site-packages目录干净、易管理。 

举个例子，通过这个工具可以实现依赖Django 1.3的项目与依赖Django 1.0的项目共存。

进一步了解与使用请参考文档 `Virtual Environments <http://github.com/kennethreitz/python-guide/blob/master/docs/dev/virtualenvs.rst>`_ 。

也可使用 :ref:`virtualenvwrapper <virtualenvwrapper-ref>` 更轻松地管理你的虚拟环境。

--------------------------------

该页是 `另一份指南 <http://www.stuartellis.eu/articles/python-development-windows/>`_ 的混合版本，可通过同一份许可获取。

