

#############
文档
#############

.. image:: https://farm5.staticflickr.com/4178/33928823133_2f3d32cf32_k_d.jpg

**********************
官方文档
**********************

Python语言和库的官方文档能够在这里找到：

    - `Python 2.x <https://docs.python.org/2/>`_
    - `Python 3.x <https://docs.python.org/3/>`_


**********************
Read the Docs
**********************

Read the Docs是一个流行的社区项目，存放着开源软件的文档。它拥有很多Python模块，优秀且流行。

    `Read the Docs <https://readthedocs.org/>`_


*****
pydoc
*****

:program:`pydoc` 是一个在您安装Python时跟着安装的工具。它允许您在shell中快速检索和查找文档。比如，如果您需要对 :mod:`time` 模块的进行快速回顾，查看文档就是像下面这么简单：

    .. code-block:: console

       $ pydoc time

上面的命令和打开Python REPL然后运行下面指令是基本等价的：

    .. code-block:: pycon

       >>> help(time)
