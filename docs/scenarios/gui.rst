
################
GUI应用
################

.. image:: https://farm5.staticflickr.com/4250/33907143624_cd621b535c_k_d.jpg

以下GUI应用按字母顺序排列。


*******
Camelot
*******

除了Python、SQLAlchemy和Qt之外，`Camelot <http://www.python-camelot.com>`_ 
提供构建应用的组件。它的灵感取决于Django的管理接口。

如下是主要的信息资源网站: http://www.python-camelot.com
，邮件列表网站： http://groups.google.com/forum/#!forum/project-camelot 。


*****
Cocoa
*****

.. note:: Cocoa框架仅在OS X中可用。如果您正在写一个跨平台的应用，不要选用这个!


***
GTk
***

.. note:: PyGTK提供GTK+工具包的Python绑定。但是，它已被PyGObject取代。 PyGTK不应该用于新项目，现有项目应该移植到PyGObject。


********************
PyGObject aka (PyGi)
********************

`PyGObject <https://wiki.gnome.org/Projects/PyGObject>`_ 提供了Python绑定，可以访问整个GNOME软件平台。
它完全兼容GTK+ 3。使用“Python GTK+ 3 教程”（https://python-gtk-3-tutorial.readthedocs.io/en/latest/>`_）
来开始学习。

`API 参考 <http://lazka.github.io/pgi-docs/>`_


****
Kivy
****

`Kivy <http://kivy.org>`_ 是一个Python库，该库用于开发多点触控的媒体应用。
当代码需要重复利用并且可部署时，它能够实现快速简单的交互设计，并且加速成形。

Kivy使用Python编写，并且基于OpenGL，除此，它支持不同的输入设备，
例如鼠标、双鼠标、WiiMote、WM_TOUCH、HIDtouch和苹果的产品等等。

Kivy由社区积极开发，并且免费使用。它适用于所有主要的平台（Linux，OS X, Windows, Android）

如下是主要的信息资源网站： http://kivy.org


******
PyObjC
******

.. note:: 仅在OS X中可用。如果您正在写一个跨平台的应用，不要选用这个。


******
PySide
******

PySide是跨平台的Qt GUI工具包的Python绑定。
它的包名取决于主要的 Qt 版本（`PySide` 用于 Qt4，`PySide2` 用于 Qt5，`PySide6` 用于 Qt6）。
这组绑定由 `Qt 公司 <https://qt.io>`_ 开发。

.. code-block:: console

  $ pip install pyside6

https://pyside.org


****
PyQt
****

.. note:: 如果软件不能完全遵循GPL，那么就需要商业许可证。

PyQt提供Qt框架的Python绑定（见如下）

http://www.riverbankcomputing.co.uk/software/pyqt/download


***************************************
Pyjs Desktop (formerly Pyjamas Desktop)
***************************************

Pyjs Desktop 是一个用于桌面和跨平台框架的应用程序小部件集。
它允许完全相同的 Python Web 应用程序源代码作为独立的桌面应用程序来执行。

`PyjamasDesktop的Python维基百科 <http://wiki.python.org/moin/PyjamasDesktop>`_.

主要的网址: `pyjs <http://pyjs.org/>`_。


**
Qt
**

`Qt <http://qt-project.org/>`_ 是跨平台应用框架，它被广泛用于借GUI开发软件，但是也可用于非GUI应用。


***********
PySimpleGUI 
***********

`PySimpleGUI <https://pysimplegui.readthedocs.io/>`_ 是 Tkinter 一层包装。
使用 PySimpleGUI 实现自定义 GUI 所需的代码量要比使用 Tkinter 直接编写相同的 GUI 要少得多。
使用 Tkinter 作为底层是因为它与其他 GUI 框架相比，能运行在更多的平台上。

.. code-block:: console 

  $ pip install pysimplegui

PySimpleGUI 完全包含在一个 PySimpleGUI.py 文件中。
如果 pip 安装不可用，将 PySimpleGUI.py 粘贴到项目文件夹中以便引用，即可。


****
Toga
****

`Toga <https://toga.readthedocs.io/en/latest/>`_ 是一个原生Python和操作系统的
跨平台GUI工具包。Toga由一个具有共享接口的基础组件库组成，以简化与平台无关的GUI开发。

Toga适用于Mac OS、Windows、Linux（GTK）以及Android和iOS等移动平台。


**
Tk
**

Tkinter是Tcl/Tk上的面向对象层。 **它的优势是包括Python标准库，能够使编程更加方便，兼容性更强。**

不管是Tk还是Tkinter，在大多数Unix平台，以及Windows和Macintosh系统都可用。
从8.0发布版本开始，Tk在所有平台上使本身的样式和感觉更赞。

在 `TkDocs <http://www.tkdocs.com/tutorial/index.html>`_ 中有一个非常好的多语言Tk教程，
所有例子使用Python。更多信息可以看 `Python 维基百科 <http://wiki.python.org/moin/TkInter>`_.


********
wxPython
********

wxPython是Python语言编写的GUI工具包。Python编写人员能够使简单容易地使用健壮，高功能的图形用户接口编程。
把流行的wxWidgets包在跨平台GUI库中，从而作为Python的扩展模块，这用C++编写。

**安装（稳定版）wxPython可以去如下网址**
https://www.wxpython.org/pages/downloads/ ，并且下载适用于当前操作系统的安装包。
