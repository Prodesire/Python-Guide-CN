
#################
测试您的代码
#################

.. image:: https://farm5.staticflickr.com/4166/34435687940_8f73fc1fa6_k_d.jpg

测试您的代码非常重要。

常常将测试代码和运行代码一起写是一种非常好的习惯。
聪明地使用这种方法将会帮助您更加精确地定义代码的含义，并且代码的耦合性更低。

测试的通用规则：

- 测试单元应该集中于小部分的功能，并且证明它是对的。

- 每个测试单元必须完全独立。他们都能够单独运行，也可以在测试套件中运行，而不用考虑被调用的顺序。
  这个规则意味着每次测试应该加载全新的数据集，测试后再做一些清理。
  这通常由 :meth:`setUp()` 和 :meth:`tearDown()` 方法处理。 

- 尽量使测试单元快速运行。如果一个单独的测试单元需要较长的时间去运行，开发进度将会延迟，
  测试将无法按照需要的频率运行。有时候，因为测试单元需要复杂的数据结构，
  并且当它运行时每次都要加载，所以其运行时间较长。把运行吃力的测试单元放在单独的测试组件中由调度任务运行，
  并且按照需要运行其它测试单元。

- 学习使用工具，学习如何运行一个单独的测试用例。然后，当在一个模块中开发了一个功能时，
  经常运行这个功能的测试用例，理想情况下，一切都将自动。

- 在编码环节前后，要常常运行完整的测试组件。只有这样，您才会坚信没有破坏其他代码的功能。

- 通过钩子（hook）实现一旦把代码放入分享仓库中，
  立刻运行所有的测试单元，这是个好办法。

- 如果您在开发期间不得不打断自己的工作，写一个被打断的单元测试，它关于下一步要开发的东西。
  当回到工作时，您将更快地回到原先被打断的地方，并且步入正轨。

- 当您调试代码的时候，首先需要写一个精确定位bug的测试单元。尽管这样做很难，
  但是捕捉bug的单元测试在项目中很重要。

- 测试函数使用长且描述性的名字。这边的样式指导与运行代码有点不一样，运行代码更倾向于使用短的名字，
  而测试函数不会直接被调用。在运行代码中，square()或者甚至sqr()这样的命名都是可以的，
  但是在测试代码中，您应该这样取名test_square_of_number_2()，test_square_negative_number()。
  函数名在测试单元失败时会显示，应该尽可能具有描述性。

- 当发生了一些问题，或者不得不改变时，如果代码中有一套不错的测试单元，
  维护将很大一部分依靠测试组件解决问题，或者修改确定的行为。因此测试代码应该尽可能多读，
  甚至多于运行代码。目的不明确的测试单元在这种情况下没有多少用处。

- 测试代码的另外一个用处是作为新开发人员的入门介绍。当有人需要基于现有的代码库工作时，
  运行并且阅读相关的测试代码是最好的做法。他们会或者应该发现大多数困难出现的热点，以及边界的情况。
  如果他们必须添加一些功能，第一步应该是添加一个测试，以确保新的功能不是一个尚未插入到界面的工作路径。


**********
基本
**********


单元测试
--------

:mod:`unittest` 包括Python标准库中自带的测试模块。任何一个使用过Junit，nUnit,或CppUnit工具的人对它的API都会比较熟悉。

创建测试用例通过继承 :class:`unittest.TestCase` 来实现.

.. code-block:: python

    import unittest

    def fun(x):
        return x + 1

    class MyTest(unittest.TestCase):
        def test(self):
            self.assertEqual(fun(3), 4)

截至Python 2.7，单元测试也包括自己的发现机制。

    `在标准库文档中单元测试 <http://docs.python.org/library/unittest.html>`_


文档测试
--------------

 :mod:`doctest` 模块查找docstrings中看起来像交互式Python会话的零碎文本，执行那些会话以证实工作正常。

doctest模块的用例相比之前的单元测试有所不同：它们通常不是很详细，并且不会用特别的用例或者处理模糊的回归bug。作为模块和其部件主要用例的表述性文档，doctest模块非常有用。

函数中的一个简单的doctest:

.. code-block:: python

    def square(x):
        """返回 x 的平方。

        >>> square(2)
        4
        >>> square(-2)
        4
        """

        return x * x

    if __name__ == '__main__':
        import doctest
        doctest.testmod()

当使用 ``python module.py`` 这样的命令行运行这个模块时，doctest将会运行，并会在结果不和文档字符串的描述一致时报错。


*****
工具
*****


py.test
-------

相比于Python标准的单元测试模块,py.test是一个没有模板的选择。

.. code-block:: console

    $ pip install pytest

尽管这个测试工具功能完备，并且可扩展，但是它语法很简单。创建一个测试组件和写一个带有诸多函数的模块一样容易：

.. code-block:: python

    # content of test_sample.py
    def func(x):
        return x + 1

    def test_answer():
        assert func(3) == 5

运行命令py.test

.. code-block:: console

    $ py.test
    =========================== test session starts ============================
    platform darwin -- Python 2.7.1 -- pytest-2.2.1
    collecting ... collected 1 items

    test_sample.py F

    ================================= FAILURES =================================
    _______________________________ test_answer ________________________________

        def test_answer():
    >       assert func(3) == 5
    E       assert 4 == 5
    E        +  where 4 = func(3)

    test_sample.py:5: AssertionError
    ========================= 1 failed in 0.02 seconds =========================

要比单元测试模型中相同功能所要求的工作量少得多。

    `py.test <https://docs.pytest.org/en/latest/>`_


Hypothesis
----------

Hypothesis 让您编写被示例源码参数化的测试的库。它会生成简单易懂的例子，使您的测试失败，
让您花更少的力气找到更多的错误。

.. code-block:: console

    $ pip install hypothesis

例如，测试浮动列表要尝试很多例子，但是会报告每个错误的最小例子（区分异常类型和位置）：

.. code-block:: python

    @given(lists(floats(allow_nan=False, allow_infinity=False), min_size=1))
    def test_mean(xs):
        mean = sum(xs) / len(xs)
        assert min(xs) <= mean(xs) <= max(xs)

.. code-block:: none

    Falsifying example: test_mean(
        xs=[1.7976321109618856e+308, 6.102390043022755e+303]
    )

Hypothesis 是实用的，也是非常强大的，能经常会找出被其他所有形式的测试所遗漏的错误。
它能与py.test很好地集成，在简单和高级场景中都非常注重可用性。

    `hypothesis <https://hypothesis.readthedocs.io/en/latest/>`_


tox
---

tox是自动化测试管理和针对多种解释器配置测试工具。

.. code-block:: console

    $ pip install tox

tox允许通过简单的初始化样式配置文件，配置复杂的多参数测试矩阵。

    `tox <https://tox.readthedocs.io/en/latest/>`_


mock
----

:mod:`unittest.mock` 是Python中用于测试的一个库。在Python3.3版本中，标准库中就有。
`标准库 <https://docs.python.org/dev/library/unittest.mock>`_.

对于Python早期版本，如下操作：

.. code-block:: console

    $ pip install mock

在测试环境下，使用mock对象能够替换部分系统，并且对它们如何被使用做了声明。
例如，您可以对一个方法打猴子补丁：



.. code-block:: python

    from mock import MagicMock
    thing = ProductionClass()
    thing.method = MagicMock(return_value=3)
    thing.method(3, 4, 5, key='value')

    thing.method.assert_called_with(3, 4, 5, key='value')

在测试环境下，对于模型中的mock类或对象，使用补丁修饰器。在下面这个例子中，一直返回相同结果的外部查询系统使用mock替换（但仅用在测试期间）。

.. code-block:: python

    def mock_search(self):
        class MockSearchQuerySet(SearchQuerySet):
            def __iter__(self):
                return iter(["foo", "bar", "baz"])
        return MockSearchQuerySet()

    # SearchForm here refers to the imported class reference in myapp,
    # not where the SearchForm class itself is imported from
    @mock.patch('myapp.SearchForm.search', mock_search)
    def test_new_watchlist_activities(self):
        # get_search_results runs a search and iterates over the result
        self.assertEqual(len(myapp.get_search_results(q="fish")), 3)

mock有许多其它方法，您可以配置它，并且控制它的动作。

    `mock <http://www.voidspace.org.uk/python/mock/>`_

