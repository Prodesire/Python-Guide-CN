
#############
文档
#############

.. image:: https://farm5.staticflickr.com/4279/35620636012_f66aa88f93_k_d.jpg

可读性是Python开发者需关注的重点，这包括项目和代码文档的可读性。遵循一些
简单的最佳实践能够帮助您和其他人节省很多时间。


*********************
项目文档
*********************

根目录下的 :file:`README` 文件应该告诉用户和维护者关于项目的基本信息。它应该是
原始文本，用一些非常容易阅读的标记，比如 :ref:`reStructuredText-ref` 或 Markdown。
它应该包含几行内容用来解释项目或者库的目的（假设用户不用知道任何关于该项目的事），
软件主要源的URL，以及一些基本的信用信息。此文件是代码阅读者的主要入口。

:file:`INSTALL` 文件对Python来说并不必要。安装指令通常少至一条命令，比如说
``pip install module`` 或 ``python setup.py install`` ，这被添加到 :file:`README`
文件中。

:file:`LICENSE` 文件应该 *总是* 存在的，而且应该指定向公众开放的软件许可。

:file:`TODO` 文件或者位于 :file:`README` 中的 ``TODO`` 区域应该列出代码的开发计划。

:file:`CHANGELOG` 文件或者位于 :file:`README` 中的 ``CHANGELOG`` 区域应该呈现对
代码库的最新修改的简短概述。


*********************
项目发布
*********************

根据项目，您的文档中可能包含下列部分或所有的内容：

- 一份 *介绍* 应该用一两个极其简化的用例，来非常简短地概述该产品
  能够用来做什么。这是您的项目的30秒的自我陈述（thirty-second pitch）。

- 一份 *教程* 应该展示一些主要的用例，它要有更多细节。读者将会跟着一步步搭建
  工作原型。

- 一份 *API 参考* 通常从代码（参见 :ref:`docstrings <docstring-ref>`）中产生。
  它会列出所有的可供公共访问的接口、参数和返回值。

- *开发人员文档* 适用于潜在贡献者。这可以包括项目的代码惯例和通用设计策略。

.. _sphinx-ref:

Sphinx
~~~~~~

Sphinx_ 无疑是最流行的Python文档工具。**请使用它吧。** 它能把 :ref:`restructuredtext-ref`
标记语言转换为广泛的输出格式，包括HTML、LaTeX(可打印PDF版本)、手册页和纯文本。

`Read The Docs`_ 是一个 *超棒的* 并且 *免费的* 文档托管，可以托管您的 Sphinx_ 文档。
请使用它。您可以为它配置提交钩子到您的源库中，这样文档的重新构建将会自动进行。

运行时，Sphinx_将导入您的代码，并使用Python的内省功能，它将提取所有函数，方法和类签名。
它还将提取附带的文档字符串，并将其全部编译成结构良好且易于阅读的文档。

.. note::

    Sphinx因API生成而著名，但它也适用于普通的项目文档。本指南使用 Sphinx_ 进行构建，
    并托管在 `Read The Docs`_ 上。

.. _Sphinx: https://www.sphinx-doc.org
.. _Read The Docs: http://readthedocs.org

.. _restructuredtext-ref:

reStructuredText
~~~~~~~~~~~~~~~~

大多数Python文档是用 reStructuredText_ 编写的。它和Markdown类似，但内建了所有可选扩展。

`reStructuredText Primer`_ 和 `reStructuredText Quick Reference`_ 应该会帮助
您熟悉它的语法。

.. _reStructuredText: http://docutils.sourceforge.net/rst.html
.. _reStructuredText Primer: https://www.sphinx-doc.org/en/master/usage/restructuredtext/basics.html
.. _reStructuredText Quick Reference: http://docutils.sourceforge.net/docs/user/rst/quickref.html


*************************
代码文档建议
*************************

注释能使代码清晰，将其加入到代码中是为了理解代码起来更容易。在Python中，注释以一个hash（数字符号）（“#”）开始。

.. _docstring-ref:

在Python中， *文档字符串* 用来描述模块、类和函数：

.. code-block:: python

    def square_and_rooter(x):
        """返回自己乘以自己的平方根。"""
        ...

一般来说，要遵循 :pep:`8#comments` （"Python风格指南"）的注释部分。
更多关于文档字符串的内容可以在 :pep:`0257#specification` （文档字符串约定指引） 上找到。

注释代码块
~~~~~~~~~~~~~~~~~~~~~~~~~~~

*不要使用三引号去注释代码*。 这不是好的实践，因为面向行的命令行工具，
比如说grep，不会知道注释过的代码是没有激活的。对每一个注释行，使用带有
合适缩进的井号会更好。您的编辑器可能很容易做到这一点，并能切换注释/取消注释。

文档字符串和魔法
~~~~~~~~~~~~~~~~~~~~

一些工具使用文档字符串来嵌入不止是文档的行为，
比如说单元测试逻辑。这些可能不错，但是简单地“保持文档就是文档”您永远都不会错。

像 Sphinx_ 这样的工具会将您的文档字符串解析为reStructuredText，并以HTML格式正确呈现。
这使得在示例代码片段中嵌入项目的文档非常简单。

此外， Doctest_ 将读取所有内嵌的看起来像Python命令行输入（以“>>>”为前缀）的文档字符串，
并运行，以检查命令输出是否匹配其下行内容。这允许开发人员在源码中嵌入真实的示例和函数的用法。
此外，它还能确保代码被测试和工作。

::
    
    def my_function(a, b):
        """
        >>> my_function(2, 3)
        6
        >>> my_function('a', 3)
        'aaa'
        """
        return a * b

.. _Doctest: https://docs.python.org/3/library/doctest.html

文档字符串 vs 块注释
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

这些不可互换。对于函数或类，开头的注释区是程序员的注解。而文档字符串
描述了函数或类的 *操作* ：

.. code-block:: python

    # 由于某种原因这个函数减慢程序执行。
    def square_and_rooter(x):
        """返回自己乘以自己的平方根。"""
	...

与块注释不同，文档字符串内置于Python语言本身。与被优化掉的注释相比较，
这意味着您可以使用Python强大的内省功能以在运行时获得文档字符串。
对于几乎每个Python对象，可以通过其 `__doc__` 属性或使用内置的“help()”函数访问文档字符串。

块注释通常用于解释一段代码是 *做什么* ，或是算法的细节。而文档字符串
更适合于向其他用户（或是写完代码6个月内的您）解释您代码中的特定功能是 *如何* 使用，
或是方法、类和模块的作用。

编写文档字符串
~~~~~~~~~~~~~~~~~~

取决于函数、方法或类的复杂度，使用单行文档字符串可能十分合适。
以下通常用于非常明显的情况，例如::

    def add（a，b）：
        """两个数字相加，并返回结果。"""
        return a + b

文档字符串应该以易于理解的方式描述函数。对于简单的例子，如简单的函数和类，
简单地将函数的签名（即`add(a, b) -> result`）嵌入到文档字符串中是不必要的。
这是因为使用Python的“inspect”模块可以很容易地找到这些信息。
此外，通过阅读源代码也可以很容易地获得。

然而，在更大或更复杂的项目中，提供相关功能的更多信息是个好主意，包括它是做什么的，
所抛的任何异常，返回的内容或参数的相关细节。

对于更详细的代码文档，用于Numpy项目的风格较为流行，通常称为 `Numpy style`_ 文档字符串。
虽然它之前的例子可能会占用更多的行，但它允许开发人员包含方法、函数或类的更多信息。 ::

    def random_number_generator（arg1，arg2）：
        """
        摘要行。

        扩展功能描述。

        参数
        ----------
        arg1：int
            arg1的描述
        arg2：str
            arg2的描述

        返回
        -------
        int
            返回值说明

        """
        return 42

`sphinx.ext.napoleon`_ 插件可以让Sphinx解析这种风格的文档字符串，
使您可以轻松地将NumPy风格的文档输入到项目中。

最后，编写文档字符串的风格并没那么重要，它们的目的是为任何可能需要阅读或更改代码的人提供文档。
只要它是正确的，可以理解的，切中相关点，那么它就完成了所设计的工作。


要进一步阅读docstrings，请随时参见 :pep:`257`

.. _thomas-cokelaer.info: http://thomas-cokelaer.info/tutorials/sphinx/docstring_python.html
.. _sphinx.ext.napoleon: https://sphinxcontrib-napoleon.readthedocs.io/
.. _`NumPy style`: http://sphinxcontrib-napoleon.readthedocs.io/en/latest/example_numpy.html


***********
其他工具
***********

您可能在其他场景看到过这些。使用 :ref:`sphinx-ref`。
 
Pycco_
    Pycco是一个 “文学编程风格的文档生成器”，它是node.js Docco_ 的
    移植版本。它将代码生成为一个并排的HTML代码和文档。

.. _Pycco: https://pycco-docs.github.io/pycco/
.. _Docco: http://jashkenas.github.com/docco

Ronn_
    Ronn用来构建Unix手册。它将人可读的文本文件转换成用于终端显示的roff文件,
    以及用于web的HTML文件。

.. _Ronn: https://github.com/rtomayko/ronn

Epydoc_
    Epydoc已经中断开发。使用 :ref:`sphinx-ref` 来替代。

.. _Epydoc: http://epydoc.sourceforge.net

MkDocs_
    MkDocs是一个快速简单的静态网站生成器，它适合于构建使用Markdown的项目文档。

.. _MkDocs: http://www.mkdocs.org/
