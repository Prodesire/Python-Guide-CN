.. _freezing-your-code-ref:


##############################
冻结（freezing）您的代码
##############################

.. image:: https://farm5.staticflickr.com/4227/33907151034_e0a9e53402_k_d.jpg

“冻结”您的代码是指创建单个可执行文件，以分发给包含所有程序代码以及Python解释器的终端用户。

像“Dropbox”、“星战前夜”、“文明4”和“BitTorrent 客户端”都是如此。

进行这种分发的好处是您的用户不需要安装好所要求版本的Python（或其他）就可以运行您的应用程序。
在Windows上，甚至许多Linux发行版和OS X，特定的Python版本并不总是安装好的。

此外，终端用户软件应始终是可执行的格式。 以 ``.py`` 结尾的文件适用于软件工程师和系统管理员。

冻结的一个缺点是它会增加大约2-12MB的发行大小。另外，如果修补了Python的安全漏洞，
您将负责分发更新版本的应用程序。


************************
冻结的多种方式
************************

:ref:`打包您的代码<packaging-your-code-ref>` 是指把您的库或工具分发给其他开发者。

在Linux 一个冻结的待选物是 :ref:`创建一个Linux分发包 <packaging-for-linux-distributions-ref>`
（比如，对于 Debian 或 Ubuntu 是 .deb文件，而对于 Red Hat 与 SuSE 是 .rpm 文件）

.. todo:: 完善 "冻结您的代码" 部分（stub）。


************************
比较冻结工具
************************

写于2019年10月5日

各解决方案的平台/特性支持性

=========== ======= ===== ==== ======== ======= ============= ============== ==== ===================== =====================
Solution    Windows Linux OS X Python 3 License One-file mode Zipfile import Eggs pkg_resources support Latest release date
=========== ======= ===== ==== ======== ======= ============= ============== ==== ===================== =====================
bbFreeze    yes     yes   yes  no       MIT     no            yes            yes  yes                   Jan 20, 2014
py2exe      yes     no    no   yes      MIT     yes           yes            no   no                    Oct 21, 2014
pyInstaller yes     yes   yes  yes      GPL     yes           no             yes  no                    Jul 9, 2019
cx_Freeze   yes     yes   yes  yes      PSF     no            yes            yes  no                    Aug 29, 2019
py2app      no      no    yes  yes      MIT     no            yes            yes  yes                   Mar 25, 2019
=========== ======= ===== ==== ======== ======= ============= ============== ==== ===================== =====================

    
.. note::
    从Linux到Windows的冻结只有PyInstaller支持，
    `其余的 <https://stackoverflow.com/questions/2950971/cross-compiling-a-python-script-on-linux-into-a-windows-executable#comment11890276_2951046>`_。

.. note::
    所有解决方案，除了py2app以外，需要在目标机器上安装了Microsoft Visual C++ dll。
    只有PyInstaller可通过传递 ``--onefile`` 到 :file:`Configure.py` 中，
    创建绑定了合适dll、可以自运行的exe文件。

*******
Windows
*******

bbFreeze
~~~~~~~~

前置要求是安装 :ref:`Python, Setuptools 以及 pywin32 的依赖项 <install-windows>`。

.. todo:: 补充更多简单的生成 .exe的步骤。 

1. 安装 :code:`bbfreeze`:

.. code-block:: console
    
    $ pip install bbfreeze
    
2. 编写最基本的 :file:`bb_setup.py`

.. code-block:: python

    from bbfreeze import Freezer
    
    freezer = Freezer(distdir='dist')
    freezer.addScript('foobar.py', gui_only=True)
    freezer()
    
.. note::
    
    这将适用于最基本的文件脚本。 要进行更高级的冻结，您必须提供包含和排除类似路径
    
    .. code-block:: python
    
        freezer = Freezer(distdir='dist', includes=['my_code'], excludes=['docs'])

3. (可选) 包含图标

.. code-block:: python
    
    freezer.setIcon('my_awesome_icon.ico')
    
4. 为冻结器（freezer）提供Microsoft Visual C运行时DLL。 将Microsoft Visual Studio 路径
附加您的 :code:`sys.path` 中是可以的，但我发现在脚本所在同一文件夹中放 :file:`msvcp90.dll`  
则更加容易。

5. 冻结！

.. code-block:: console
    
    $ python bb_setup.py

py2exe
~~~~~~

    
前置要求是安装了 :ref:`Python on Windows <install-windows>`。py2exe 的最后一个版本是从2014年开始的，且没有处于积极的开发中。

1. 下载并且安装 http://sourceforge.net/projects/py2exe/files/py2exe/

2. 编写 :file:`setup.py` (`配置选项清单 <http://www.py2exe.org/index.cgi/ListOfOptions>`_):

.. code-block:: python

    from distutils.core import setup
    import py2exe

    setup(
        windows=[{'script': 'foobar.py'}],
    )


3. (可选) `包含图标 <http://www.py2exe.org/index.cgi/CustomIcons>`_

4. (可选) `单文件模式 <https://stackoverflow.com/questions/112698/py2exe-generate-single-executable-file#113014>`_

5. 生成 :file: `.exe` 到 :file:`dist` 目录:

.. code-block:: console

   $ python setup.py py2exe

6.提供Microsoft Visual C 运行时DLL。两个选项: `在目标机器全局安装dll <https://www.microsoft.com/en-us/download/details.aspx?id=29>`_ 或者 `与.exe一起分发dll <http://www.py2exe.org/index.cgi/Tutorial#Step52>`_。

PyInstaller
~~~~~~~~~~~

前置是安装 :ref:`Python, Setuptools 以及pywin32 依赖项 <install-windows>`.

- `更多的简单教程 <http://bojan-komazec.blogspot.com/2011/08/how-to-create-windows-executable-from.html>`_
- `手册 <https://pyinstaller.readthedocs.io/en/stable/>`_


****
OS X
****


py2app
~~~~~~

PyInstaller
~~~~~~~~~~~

PyInstaller可用于在Mac OS X 10.6（Snow Leopard）或更新版本上构建Unix可执行文件和
窗口应用程序。

要安装PyInstaller, 使用pip:

.. code-block:: console

 $ pip install pyinstaller

要创建标准的Unix可执行文件, 使用 :code:`script.py` ：

.. code-block:: console

 $ pyinstaller script.py

这会创建，

- :code:`script.spec` 文件, 类似于 :code:`make` 文件
- :code:`build` 文件夹, 存放日志文件
- :code:`dist` 文件夹, 存放主要的可执行文件 :code:`script` ，和一些依赖的Python库

:code:`script.py` 会把全部内容放在同一个文件夹中。PyInstaller将所有 :code:`script.py` 
用到的Python库放到 :code:`dist` 文件夹中。所以在分发可执行文件时，会分发整个 :code:`dist` 
文件夹。

:code:`script.spec` 文件可以编辑成 `自定义构建 <http://pythonhosted.org/PyInstaller/#spec-file-operation>`_ ，
比如可以：

- 将数据文件与可执行文件绑定在一起
- 包含PyInstaller无法自动推断的运行时库（ :code:`.dll` 或 :code:`.so` 文件）
- 将Python运行时选项添加到可执行文件中

现在：代码 :code:`script.spec` 可以用 :code:`pyinstaller` （而不是再次使用 
:code:`script.py` ）运行。

.. code-block:: console

  $ pyinstaller script.spec

要创建独立的OS X窗口应用程序，请使用 :code:`--windowed` 选项：

.. code-block:: console

 $ pyinstaller --windowed script.spec


这将在 :code:`dist` 文件夹中创建一个代码 :code:`script.app` 。请确保在Python代码中
使用GUI软件包，例如 `PyQt <https://riverbankcomputing.com/software/pyqt/intro>`_ 或
`PySide <http://wiki.qt.io/About-PySide>`_，来控制应用程序的图形部分。

:code:`script.spec` 有几个与Mac OS X应用程序捆绑有关的 `选项 
<http://pythonhosted.org/PyInstaller/spec-files.html#spec-file-options-for-a-mac-os-x-bundle>`_ 。 
例如，要指定应用程序的图标，请使用 :code:`icon=\path\to\icon.icns` 选项。

*****
Linux
*****


bbFreeze
~~~~~~~~
.. warning:: bbFreeze 仅在 Python 2.x 环境下工作, 根据以前的维护者的说法已不再进行维护。 如果您对此感兴趣请查看 `这里 <https://github.com/schmir/bbfreeze>`_。

bbFreeze可以与所有已安装Python以及pip2和/或easy_install的发行版一起使用。

对于pip2，请按以下内容进行：

.. code-block:: console

  $ pip2 install bbfreeze

而对于 easy_install，则:

.. code-block:: console

  $ easy_install bbfreeze

安装好bbFreeze后，您就可以冻结应用程序了。

假设您有一个脚本，例如“hello.py”和名为“module.py”的模块，并且您在里面使用了一个函数。
不费吹灰之力，您就可以通过冻结脚本的主要入口来冻结整个内容：

.. code-block:: console

  $ bbfreeze script.py

这样，它就会创建一个名为dist/的文件夹，其中包含脚本的可执行文件以及Python脚本中使用的库所需.so（共享对象）文件。

或者，您可以创建一个用于执行冻结的脚本。 冻结器的API可从以下库中获得：

.. code-block:: python

   from bbfreeze import Freezer

   freezer = Freezer(distdir='dist')
   freezer.addScript('script.py', gui_only=True) # 为使用GUI包的应用开启参数 gui_only
   freezer()

PyInstaller
~~~~~~~~~~~
PyInstaller在Linux上的安装方式与在OS X中类似，参见OS X章节中的对应部分。

不要忘记安装如Python和pip等依赖项。
