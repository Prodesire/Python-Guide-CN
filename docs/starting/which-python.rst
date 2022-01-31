
#####################################
选择一个 Python 解释器（3 vs 2）
#####################################

.. image:: https://farm5.staticflickr.com/4265/34484834733_5b80f65ab1_k_d.jpg

.. _which-python:

***************************
Python的现状 (3 vs 2)
***************************

当选择Python解释器的时候，一个首先要面对的问题是：“我应该选择Python 2还是Python 3？” 答案并不像人们想象的那么明显。


现状的基本要点如下：

1. 如今大部分生产应用使用 Python 3。
2. Python 3 已准备好用于生产应用的部署。
3. Python 2.7 已在 2020 年 1 月终止维护 [#pep373_eol]_。
4. “Python” 涵盖了 Python 3 和 Python 2。


***************
建议
***************


.. note:: 使用 **Python 3** 是 *高度* 优先于 Python 2。如果您发现自己 *仍然* 在生产环境中使用 Python 2，
 请考虑升级您的应用程序和基础设施。如果您正在使用 Python 3，恭喜您 —— 您确实有很好的品味。
 —*Kenneth Reitz*

那我直言不讳：

- 将 Python 3 用于新的 Python 应用程序。
- 如果您是第一次学习 Python，熟悉 Python 2.7 将是非常有用的，但学习 Python 3 更有用。
- 两者都学。它们都是 “Python”。


******************
所以.... 3？
******************

如果您想选择一种Python的解释器，您又不是固执己见的人，我推荐您用最新的Python 3.x，
因为每个版本都带来了新的改进了的标准库模块、安全性以及bug修复。进步就是进步。

鉴于此，如果您有一个强有力的理由只用Python 2，比如Python 3 没有足够能替代的Python 2
的特有库，或者您（像我）非常喜爱而且受Python 2启发。

`延伸阅读 <http://wiki.python.org/moin/Python2orPython3>`_

写 `能够同时兼容Python 2.6，2.7，和Python 3的代码 <https://docs.python.org/3/howto/pyporting.html>`_ 是可能的。
这包括从简单到困难的各种难度，取决于您所写软件的类型；如果您是初学者，其实有更重要的东西要操心。


***************
实现
***************

当人们谈论起 *Python*，他们不仅是在说语言本身，还包括其CPython实现。 
*Python* 实际上是一个可以用许多不同的方式来实现的语言规范。

CPython
-------

`CPython <http://www.python.org>`_ 是Python的参考实现，用C编写。它把Python代码编译成
中间态的字节码，然后由虚拟机解释。CPython为Python包和C扩展模块提供了最大限度的兼容。

如果您正在写开源的Python代码，并希望有尽可能广泛的用户，用CPython是最好的。使用依赖C扩展的包，CPython是您唯一的选择。

所有版本的Python语言都用C实现，因为CPython是参考实现。

PyPy
----

`PyPy <http://pypy.org/>`_ 是用RPython实现的解释器。RPython是Python的子集，
具有静态类型。这个解释器的特点是即时编译，支持多重后端（C, CLI, JVM）。

PyPy旨在提高性能，同时保持最大兼容性（参考CPython的实现）。

如果您正在寻找提高您的Python代码性能的方法，值得试一试PyPy。在一套的基准测试下，
它目前比CPython的速度快超过5倍 。

PyPy支持Python 2.7。PyPy3 [#pypy_ver]_，发布的Beta版，支持Python 3。

Jython
------

`Jython <http://www.jython.org/>`_ 是一个将Python代码编译成Java字节码的实现，
运行在JVM (Java Virtual Machine) 上。另外，它可以像是用Python模块一样，导入
并使用任何Java类。

如果您需要与现有的Java代码库对接或者基于其他原因需要为JVM编写Python代码，那么
Jython是最好的选择。

Jython现在支持到Python 2.7 [#jython_ver]_ 。 IronPython 3 [#iron_ver3]_ 正在开发中，但截止到 2020 年 9 月尚未准备好。

IronPython
----------

`IronPython <http://ironpython.net/>`_ 是一个针对 .NET 框架的Python实现。它
可以用Python和.NET framework的库，也能将Python代码暴露给给.NET框架中的其他语言。

`Python Tools for Visual Studio <http://ironpython.net/tools/>`_ 直接集成了
IronPython到Visual Studio开发环境中，使之成为Windows开发者的理想选择。

IronPython支持Python 2.7 [#iron_ver]_。

Python.Net
----------

`Python for .NET <http://pythonnet.github.io/>`_ 是一个近乎无缝集成的，
提供给本机已安装的Python .NET公共语言运行时（CLR）包。它采取与IronPython
（见上文）相反的方法，与其说是竞争，不如说是互补。

Python.Net与Mono相结合使用，通过.NET框架，能使Python在非windows系统上（如OS X和Linux）完成操作。它可以在除外IronPython的环境中无冲突运行。

Python.Net兼容Python 2.7和3.5-3.8 [#pythonnet_ver1]_ 。


.. [#pypy_ver] https://pypy.org/compat.html

.. [#jython_ver] https://hg.python.org/jython/file/412a8f9445f7/NEWS

.. [#iron_ver] https://ironpython.net/download/

.. [#iron_ver3] https://github.com/IronLanguages/ironpython3

.. [#pythonnet_ver1] https://pythonnet.github.io/

.. [#pep373_eol] https://www.python.org/dev/peps/pep-0373/#id2
