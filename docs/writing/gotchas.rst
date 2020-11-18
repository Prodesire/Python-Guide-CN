
##############
常见陷阱
##############

.. image:: https://farm5.staticflickr.com/4163/34435688380_b5a740762b_k_d.jpg

大多数情况下，Python的目标是成为一门简洁和一致的语言，同时避免意外情况。
然而，有些情况可能会使新人困惑。

其中一些情况是有意为之的，但可能有潜在的风险。而另一些可以说是语言的缺陷。
总的来说，下面是一些乍看起来很取巧的行为，不过只要您注意了强调的事项，
这些行为通常是可取的。

.. _default_args:


*************************
可变默认参数
*************************

看起来，*最* 让Python程序员感到惊奇的是Python对函数定义中可变默认参数的处理。

您所写的
~~~~~~~~~~~~~~

.. code-block:: python

    def append_to(element, to=[]):
        to.append(element)
        return to

您所期望的
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. code-block:: python

    my_list = append_to(12)
    print(my_list)

    my_other_list = append_to(42)
    print(my_other_list)

每次调用函数时，如果不提供第二个参数，就会创建一个新的列表，所以结果应是这样的：

    [12]
    [42]

而事实是
~~~~~~~~~~~~~~~~

.. testoutput::

    [12]
    [12, 42]

当函数被定义时，一个新的列表就被创建 *一次* ，而且同一个列表在每次成功的调用中都被使用。

当函数被定义时，Python的默认参数就被创建 *一次*，而不是每次调用函数的时候创建。
这意味着，如果您使用一个可变默认参数并改变了它，您 *将会* 在未来所有对此函数的
调用中改变这个对象。

您应该做的
~~~~~~~~~~~~~~~~~~~~~~~~~~

在每次函数调用中，通过使用指示没有提供参数的默认参数（:py:data:`None` 通常是
个好选择），来创建一个新的对象。

.. code-block:: python

    def append_to(element, to=None):
        if to is None:
            to = []
        to.append(element)
        return to

别忘了，您在把 *列表* 对象作为第二个参数传入。

什么情况下陷阱不是陷阱
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

有时您可以专门“利用”（或者说特地使用）这种行为来维护函数调用间的状态。这通常用于
编写缓存函数。


****************************
延迟绑定闭包
****************************

另一个常见的困惑是Python在闭包(或在周围全局作用域（surrounding global scope）)中
绑定变量的方式。

您所写的
~~~~~~~~~~~~~~

.. testcode::

    def create_multipliers():
        return [lambda x : i * x for i in range(5)]

您所期望的
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. testcode::

    for multiplier in create_multipliers():
        print(multiplier(2))

一个包含五个函数的列表，每个函数有它们自己的封闭变量 ``i`` 乘以它们的参数，得到::

    0
    2
    4
    6
    8

而事实是
~~~~~~~~~~~~~~~~

.. testoutput::

    8
    8
    8
    8
    8

五个函数被创建了，它们全都用4乘以 ``x`` 。

Python的闭包是 *迟绑定* 。
这意味着闭包中用到的变量的值，是在内部函数被调用时查询得到的。

这里，不论 *任何* 返回的函数是如何被调用的， ``i`` 的值是调用时在周围作用域中查询到的。
接着，循环完成， ``i`` 的值最终变成了4。

关于这个陷阱有一个普遍严重的误解，它被认为是和Python的 
:ref:`lambdas <python:lambda>` 有关。 由 ``lambda`` 表达式创建的函数并没什么特别，
而且事实上，同样的问题也出现在使用普通的 ``定义`` 上：

.. code-block:: python

    def create_multipliers():
        multipliers = []

        for i in range(5):
            def multiplier(x):
                return i * x
            multipliers.append(multiplier)

        return multipliers

您应该做的
~~~~~~~~~~~~~~~~~~~~~~~~~~

最一般的解决方案可以说是有点取巧（hack）。由于Python拥有在前文提到的为函数默认参数
赋值的行为（参见 :ref:`default_args` ）,您可以创建一个立即绑定参数的闭包,像下面这样：

.. code-block:: python

    def create_multipliers():
        return [lambda x, i=i : i * x for i in range(5)]

或者，您可以使用 functools.partial 函数：

.. code-block:: python

    from functools import partial
    from operator import mul

    def create_multipliers():
        return [partial(mul, i) for i in range(5)]

什么情况下陷阱不是陷阱
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

有时您就想要闭包有如此表现，迟绑定在很多情况下是不错的。不幸的是，循环创建
独特的函数是一种会使它们出差错的情况。


*********************************
字节码（.pyc）文件无处不在！
*********************************

默认情况下，当使用文件执行Python代码时，Python解释器会自动将该文件的字节码版本写入磁盘。
比如， ``module.pyc``。

这些“.pyc”文件不应该加入到您的源代码仓库。

理论上，出于性能原因，此行为默认为开启。 没有这些字节码文件，Python会在每次加载文件时
重新生成字节码。

禁用字节码（.pyc）文件
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

幸运的是，生成字节码的过程非常快，在开发代码时不需要担心。

那些文件很讨厌，所以让我们摆脱他们吧！

::

    $ export PYTHONDONTWRITEBYTECODE=1

使用 ``$PYTHONDONTWRITEBYTECODE`` 环境变量，Python则不会把这些文件写入磁盘，
您的开发环境将会保持良好和干净。

我建议在您的 ``~/.profile`` 里设置这个环境变量。

删除字节码（.pyc）文件
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

以下是删除所有已存在的字节码文件的好方法::

    $ find . -type f -name "*.py[co]" -delete -or -type d -name "__pycache__" -delete

从项目根目录运行，所有 ``.pyc`` 文件会嗖地一下消失， 好多了~

.. _version_control_ignores:

版本控制忽略
~~~~~~~~~~~~~~~~~~~~~~~

如果由于性能原因仍然需要 ``.pyc`` 文件，您可以随时将它们添加到版本控制存储库的忽略文件中。
流行的版本控制系统能够使用文件中定义的通配符来应用特殊规则。

一份忽略文件将确保匹配的文件未被检入存储库。
Git_ 使用 ``.gitignore``，而 Mercurial_ 使用 ``.hgignore``。

.. _Git: https://git-scm.com/
.. _Mercurial: https://www.mercurial-scm.org/

至少您的忽略文件应该是这样的。

::

    syntax:glob   # .gitignore 文件不需要这行
    *.py[cod]     # 将匹配 .pyc、.pyo 和 .pyd文件
    __pycache__/  # 排除整个文件夹

您可能希望根据需要添加更多文件和目录。下次提交到存储库时，这些文件将不被包括。
