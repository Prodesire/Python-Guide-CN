您的开发环境
============================

.. image:: /_static/photos/33175624924_7febc46cc4_k_d.jpg


文本编辑器
::::::::::::

任何能够编辑普通文本的编辑器都能够用来编写Python代码，然后，使用一个更加强大的编辑器可能
使您的生活变得容易点。


Vim
---

Vim是一个使用键盘快捷键而不是菜单或图标来编辑的文本编辑器。有许多增强Vim编辑器中
Python开发环境的插件和设置。如果您只开发Python，使用缩进和换行均符合 :pep:`8` 
要求的默认设置是一个好的开始。在您的home目录中，打开 :file:`.vimrc` 文件，
添加下面这些内容::

    set textwidth=79  " lines longer than 79 columns will be broken
    set shiftwidth=4  " operation >> indents 4 columns; << unindents 4 columns
    set tabstop=4     " a hard TAB displays as 4 columns
    set expandtab     " insert spaces when hitting TABs
    set softtabstop=4 " insert/delete 4 spaces when hitting a TAB/BACKSPACE
    set shiftround    " round indent to multiple of 'shiftwidth'
    set autoindent    " align the new line indent with the previous line

基于上述设置，新行会在超过79个字符被添加，tab键则会自动转换为4个空格。如果您还使用
Vim编辑其他语言，有一个叫做 indent_ 的便捷插件可以让这个设置只为Python源文件服务。

还有一个方便的语法插件叫做 syntax_ ，改进了Vim 6.1中的语法文件。

这些插件使您拥有一个基本的环境进行Python开发。要最有效的使用Vim，您应该时常检查代码的
语法错误和是否符合PEP8。幸运的是， pycodestyle_ 和 Pyflakes_ 将会帮您做这些。
如果您的Vim是用 ``+python`` 编译的，您也可以在编辑器中使用一些非常有用的插件来做这些检查。

对于PEP8检查和pyflakes，您可以安装 vim-flake8_ 。然后您就可以在Vim中把 ``Flake8`` 
映射到任何热键或您想要的行为上。这个插件将会在屏幕下方显示出错误，并且提供一个简单的
方式跳转到相关行。在保存文件的时候调用这个功能会是非常方便的。要这么做，
就把下面一行加入到您的 :file:`.vimrc`::

    autocmd BufWritePost *.py call Flake8()

如果您已经在使用 syntastic_ ，您可以设置它来运行Pyflakes，并在quickfix窗口中显示错误
和警告。一个这样做并还会在状态栏中显示状态和警告信息的样例是::

    set statusline+=%#warningmsg#
    set statusline+=%{SyntasticStatuslineFlag()}
    set statusline+=%*
    let g:syntastic_auto_loc_list=1
    let g:syntastic_loc_list_height=5


Python-mode
^^^^^^^^^^^

Python-mode_ 是一个在Vim中使用Python的综合解决方案。
它拥有：

- 任意组合的异步Python代码检查（ ``pylint`` 、 ``pyflakes`` 、 ``pycodestyle`` 、 ``mccabe``）
- 使用Rope进行代码重构和补全
- Python快速折叠
- 支持virtualenv
- 搜索Python文档，运行Python代码
- 自动修复 pycodestyle_ 错误

以及其他更多。

SuperTab
^^^^^^^^

SuperTab_ 是一个小的Vim插件，通过使用 ``<Tab>`` 或任何其他定制的按键，
能够使代码补全变得更方便。

.. _indent: http://www.vim.org/scripts/script.php?script_id=974
.. _syntax: http://www.vim.org/scripts/script.php?script_id=790
.. _Pyflakes: http://pypi.python.org/pypi/pyflakes/
.. _pycodestyle: https://pypi.org/project/pycodestyle/
.. _syntastic: https://github.com/vim-syntastic/syntastic
.. _Python-mode: https://github.com/python-mode/python-mode
.. _SuperTab: http://www.vim.org/scripts/script.php?script_id=1643
.. _vim-flake8: https://github.com/nvie/vim-flake8

Emacs
-----

Emacs是另一个强大的文本编辑器。它是完全可编程的（Lisp），但要正确的工作要花些功夫。
如果您已经是一名Emacs的用户了，在EmacsWiki上的 `Python Programming in Emacs`_ 
将会是好的开始。

1. Emacs 本身支持Python模式。

.. _Python Programming in Emacs: https://www.emacswiki.org/emacs/PythonProgrammingInEmacs

TextMate
--------

`TextMate <http://macromates.com/>`_ 将苹果操作系统技术带入了文本编辑器的世界。
通过桥接Unix和GUI，TextMate将两者中最好的部分带给了脚本专家和新手用户。

Sublime Text
------------

`Sublime Text <http://www.sublimetext.com/>`_ 是一款高级的，用来编写代码、标记和
文章的文本编辑器。您将会爱上漂亮的用户界面、非凡的特性和惊人的表现。

Sublime Text对编写Python代码支持极佳，而且它使用Python写其插件API。它也拥有大量
各式各样的插件， `其中一些 <https://github.com/SublimeLinter/SublimeLinter>`_ 
允许编辑器内的PEP8检查和代码提示。

Atom
----

`Atom <https://atom.io/>`_ 是一款21世纪的可删减的（hackable）文本编辑器。它基于我们
所喜欢的编辑器的任何优秀特性，并构建于atom-shell上。

Atom是web原生的（HTML、CSS、JS），专注于模块化的设计和简单的插件开发。它自带本地包管理
和大量的包。Python开发所推荐的插件是 `Linter <https://github.com/steelbrain/linter>`_ 
和 `linter-flake8 <https://github.com/AtomLinter/linter-flake8>`_ 的组合。

Python (on Visual Studio Code)
------------------------------

`Python for Visual Studio Code <https://marketplace.visualstudio.com/items?itemName=ms-python.python>`_ 是 `Visual Studio Code <https://code.visualstudio.com>`_ 的扩展。
它是一个免费、轻量级的开源编辑器，支持 Mac、Windows 和 Linux。
使用 Node.js 和 Python 等开源技术构建，具有 Intellisense（自动完成）、本地和远程调试、linting 等引人注目的功能。

MIT 许可。

IDEs
::::

PyCharm / IntelliJ IDEA
-----------------------

`PyCharm <http://www.jetbrains.com/pycharm/>`_ 由JetBrains公司开发，此公司还以
IntelliJ IDEA闻名。它们都共享着相同的基础代码，PyCharm中大多数特性能通过免费的 
`Python 插件 <https://plugins.jetbrains.com/plugin/?idea&pluginId=631>`_ 
带入到IntelliJ中。PyCharm有两个版本：专业版（Professional Edition）（30天试用）和
拥有相对少特性的社区版（Community Edition）（Apache 2.0 License）。

Python （在 Visual Studio Code 中）
-----------------------------------------

`用于Visual Studio的Python <https://marketplace.visualstudio.com/items?itemName=ms-python.python>`_ 
是一款用于 `Visual Studio Code IDE <https://code.visualstudio.com>`_ 的扩展。
它是一个免费的、轻量的、开源的IDE，支持Mac、Windows和Linux。它以诸如Node.js和Python等
开源技术构建，具有如Intellisense（自动补全）、本地和远程调试、linting（代码检查）等
引人注目的特性。

MIT 许可证。

Enthought Canopy
----------------
`Enthought Canopy <https://www.enthought.com/product/canopy/>`_ 是一款专门面向科学家
和工程师的Python IDE，它预装了为数据分析而用的库。

Eclipse
-------

Eclipse中进行Python开发最流行的插件是Aptana的 `PyDev <https://pydev.org>`_ 。


Komodo IDE
----------

`Komodo IDE <https://www.activestate.com/komodo-ide>`_ 由ActiveState开发，并且是
在Windows、Mac和Linux平台上的商业IDE。


Spyder
------

`Spyder <https://github.com/spyder-ide/spyder>`_ 是一款专门面向和Python科学库
（即 `SciPy <https://www.scipy.org/>`_ ）打交道的IDE。它集成了 pyflakes_ 、 
`pylint <https://www.logilab.org/857>`_ 和 `rope <https://github.com/python-rope/rope>`_ 。

Spyder是开源的（免费的），提供了代码补全、语法高亮、类和函数浏览器，以及对象检查的功能。


WingIDE
-------

`WingIDE <http://wingware.com/>`_ 是一个专门面向Python的IDE。它能运行在Linux、Windows
和Mac（作为一款X11应用程序，会使某些Mac用户遇到困难）上。

WingIDE提供了代码补全、语法高亮、源代码浏览器、图形化调试器的功能，还支持版本控制系统。


NINJA-IDE
---------

`NINJA-IDE <http://www.ninja-ide.org/>`_ （来自递归缩写："Ninja-IDE Is Not Just Another IDE"）
是一款跨平台的IDE，特别设计成构建Python应用，并能运行于Linux/X11、Mac OS X和
Windows桌面操作系统上。从网上可以下载到这些平台的安装包。

NINJA-IDE是一款开源软件（GPLv3许可），是使用Python和Qt开发。在 `GitHub <https://github.com/ninja-ide>`_ 
能下载到源文件。


Eric (The Eric Python IDE)
--------------------------

`Eric <http://eric-ide.python-projects.org/>`_ 是一款功能齐全的Python IDE，
提供源代码自动补全、语法高亮、对版本控制系统的支持、对Python 3的支持、集成的web浏览器、
Python Shell、集成的调试器和灵活的插件系统等功能。它基于Qt GUI工具集，使用Python编写，
集成了Scintilla编辑器控制。Eric是一款超过10年活跃开发的开源软件工程（GPLv3许可）。

Mu
--

`Mu <https://codewith.mu/>`_ 是一个极简的 Python IDE，它可以在本地运行 Python 3 代码，也可以将代码部署到 BBC micro:bit
和运行 CircuitPython 的 Adafruit 板上。

Mu 为初学者设计，包含一个 Python 3 解释器，易于安装在 Windows、OS/X 和 Linux 上，还能在 Raspberry Pi 上很好地运行。

gitter 上有一个 Mu 活跃的支持社区。


解释器工具
:::::::::::::::::


虚拟环境
--------------------

虚拟环境提供了隔离项目包依赖的强大方式。这意味着您无须再系统范围内安装Python工程特定的包，
因此就能避免潜在的版本冲突。

To start using and see more information:
`Virtual Environments <https://github.com/kennethreitz/python-guide/blob/master/docs/dev/virtualenvs.rst>`_ docs.
开始使用和查阅更多信息：请参阅 `Virtual Environments <http://github.com/kennethreitz/python-guide/blob/master/docs/dev/virtualenvs.rst>`_ 文档。


pyenv
-----

`pyenv <https://github.com/pyenv/pyenv>`_ 是一个允许多个Python解释器版本同时安装
于一台机器的工具。这解决了不同的项目需要不同版本的Python的问题。比如，为了兼容性，
可以很容易地为一个项目安装Python 2.7，而继续使用Python 3.4作为默认的编辑器。
pyenv不止限于CPython版本——它还能安装PyPy、Anaconda、miniconda、stackless、Jython
和IronPython解释器。

pyenv的工作原理是在一个叫做 ``shims`` 目录中创建Python解释器（以及其他工具像
``pip`` 和 ``2to3`` 等）的假版本。当系统寻找名为 ``python`` 的应用时，
它会先在 ``shims`` 目录中查找，并使用那个假版本，然后会传递命令到pyenv中。
pyenv基于环境变量、 ``.python-version`` 文件和全局默认设置的信息就知道该运行
哪个版本的Python。

pyenv不是管理虚拟环境的工具，但是有一个叫做 `pyenv-virtualenv <https://github.com/pyenv/pyenv-virtualenv>`_ 
的插件可以自动化不同环境的创建，而且也能够使用现有的pyenv工具，基于环境变量或者 
``.python-version`` 文件，来切换不同的环境。

其他工具
:::::::::::

IDLE
----

:ref:`IDLE <python:idle>` 是一个集成的开发环境，它是Python标准发行的一部分。
它完全由Python编写，并使用Tkinter GUI工具集。尽管IDLE不适用于作为成熟的Python开发工具，
但它对尝试小的Python代码和对Python不同特性的实验非常有帮助。

它提供以下特性：

* Python Shell窗口（解释器）
* 多窗口文本编辑器，支持彩色化Python代码
* 最小的调试工具


IPython
-------

`IPython <http://ipython.org/>`_ 提供一个丰富的工具集来帮助您最大限度地和Python交互。
它主要的组件有：

* 强大的Python shell（终端和基于Qt）
* 一个基于网络的笔记本，拥有相同的核心特性，但是支持富媒体、文本、代码、数学表达式和内联绘图
* 支持交互式的数据可视化和GUI工具集的使用
* 灵活、嵌入的解释器载入到您的工程工程中
* 支持高级可交互的并行计算的工具

.. code-block:: console

    $ pip install ipython

下载和安装带有所有可选依赖（notebook、qtconsol、tests和其他功能）的IPython

.. code-block:: console

    $ pip install ipython[all]

BPython
-------

`bpython <https://bpython-interpreter.org/>`_ 在类Unix操作系统中可替代Python解释器的接口。
它有以下特性：

* 内联的语法高亮
* 行内输入时的自动补全建议
* 任何Python函数的期望参数列表
* 从内存中pop出代码的最后一行并重新运行（re-evaluate）的“倒带”功能
* 将输入的代码发送到pastebin
* 将输入的代码保存到一个文件中
* 自动缩进
* 支持Python 3

.. code-block:: console

    $ pip install bpython

ptpython
--------

`ptpython <https://github.com/prompt-toolkit/ptpython/>`_ 是一个构建在 
`prompt_toolkit <https://github.com/prompt-toolkit/python-prompt-toolkit>`_ 
库顶部的REPL。它被视作是 BPython_ 的替代。特性包括：

* 语法高亮
* 自动补全
* 多行编辑
* Emacs和Vim模式
* 代码中嵌入的REPL
* 语法校验
* Tab页
* 通过安装Ipython ``pip install ipython`` 并运行 ``ptipython`` ，支持集成 IPython_ 的 shell

.. code-block:: console

    $ pip install ptpython
