.. _freezing-your-code-ref:

==================
Freezing你的代码
==================


'冻结'（Freeze） 你的代码是指分发给最终用户一个打包了Python解释器的可执行版本。

像 'Dropbox', BitTorrent 客户端， 'Eve Online' 以及 '文明4' 都是这样的。

进行这种分发的一个好处是你的用户不需要之前安装过所要求版本的Python。在Windows上，
甚至一些Linus分发版与OSX版本，正确的Python版本并不总是安装过的。

这样的一个劣势是你的分发版将增大大约2MB。另一个问题在于你的应用并不能接收对于该版本
Python的任何安全更新除非你冻结一个新的版本并让你的用户下载它。

Freezing的多种方式
------------------------

:ref: `打包你的代码<packaging-your-code-ref>` 是指把你的库或工具分发给其他开发者。

在Linux 一个冻结的待选物是 :ref:`创建一个Linux分发
包 <packaging-for-linux-distributions-ref> (e.g.对于Debian或Ubuntu是 .deb文件，
而对于Red Hat 与SuSE是.rpm文件)`

.. todo:: 完善 "冻结你的代码" 部分（stub）。


比较
----------

各解决方案的平台/特性支持性

=========== ======= ===== ==== ======== ======= ============= ============== ==== =====================
Solution    Windows Linux OS X Python 3 License One-file mode Zipfile import Eggs pkg_resources support
=========== ======= ===== ==== ======== ======= ============= ============== ==== =====================
bbFreeze    yes     yes   yes  no       MIT     no            yes            yes  yes
py2exe      yes     no    no   yes      MIT     yes           yes            no   no
pyInstaller yes     yes   yes  yes      GPL     yes           no             yes  no
cx_Freeze   yes     yes   yes  yes      PSF     no            yes            yes  no
py2app      no      no    yes  yes      MIT     no            yes            yes  yes
=========== ======= ===== ==== ======== ======= ============= ============== ==== =====================

    
.. note::
    从Linux到Windows的冻结只有PyInstaller支持，参见
    <http://stackoverflow.com/questions/2950971/cross-compiling-a-python-script-on-linux-into-a-windows-executable#comment11890276_2951046>`_.

.. note::
    所有解决方案需要目前机器上安装了MS Visual C++ dll。除了py2app以外。
    只有Pyinstaller创建了可以自足运行的exe文件，其绑定了dll，当传递 :option:`--onefile` to :file:`Configure.py`.

Windows
-------

bbFreeze
~~~~~~~~

前置要求是安装 :ref:`Python, Setuptools 以及 pywin32 的依赖项 <install-windows>`.

.. todo:: 补充更多简单的生成 .exe的步骤。 


py2exe
~~~~~~

    
前置要求是安装 :ref:`Python on Windows <install-windows>`.

1. 下载并且安装 http://sourceforge.net/projects/py2exe/files/py2exe/

2. 编写 :file:`setup.py` (`配置选项清单 <http://www.py2exe.org/index.cgi/ListOfOptions>`_):

.. code-block:: python

    from distutils.core import setup
    import py2exe

    setup(
        windows=[{'script': 'foobar.py'}],
    )


3. (可选) `包含图标 <http://www.py2exe.org/index.cgi/CustomIcons>`_

4. (可选) `单文件模式 <http://stackoverflow.com/questions/112698/py2exe-generate-single-executable-file#113014>`_

5. 生成 :file: `.exe` 到 :file:`dist` 目录:

.. code-block:: console

   $ python setup.py py2exe

6.提供Microsoft Visual C 运行时DLL。两个选项: `在目标机器全局安装dll <https://www.microsoft.com/en-us/download/details.aspx?id=29>`_ 或者 `与.exe一起分发dll <http://www.py2exe.org/index.cgi/Tutorial#Step52>`_.

PyInstaller
~~~~~~~~~~~

前置是安装 :ref:`Python, Setuptools 以及pywin32 依赖项 <install-windows>`.

- `更多的简单教程 <http://bojan-komazec.blogspot.com/2011/08/how-to-create-windows-executable-from.html>`_
- `手册 <http://www.pyinstaller.org/export/d3398dd79b68901ae1edd761f3fe0f4ff19cfb1a/project/doc/Manual.html?format=raw>`_


OS X
----


py2app
~~~~~~

PyInstaller
~~~~~~~~~~~


Linux
-----


bbFreeze
~~~~~~~~

PyInstaller
~~~~~~~~~~~
