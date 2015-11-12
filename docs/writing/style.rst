.. _code_style:

代码风格
==========

如果你问Python程序员最喜欢Python的什么，他们总会说是Python的高可读性。
事实上，高度的可读性是Python语言的设计核心。这基于这样的事实：代码的
阅读比编写更加频繁。

Python代码易读和易懂的其中一个原因是它的相对完整的代码风格指引和 “Pythonic” 
的风格。

此外，当一位富有经验的Python开发者（Pythonista）指出某段代码并不 “Pythonic”，
这通常意味着这些代码并没有遵循通用的指导方针，也没有用最佳的（最可读的）方式
来表达意图。

在某些边缘情况下，Python代码中并没有大家都认同的表达意图的最佳方式，但这些情况
都很少见。

一般概念
----------------

明确的代码
~~~~~~~~~~~~~

在存在各种黑魔法的Python中，我们提倡最明确和直接的编码方式。

**糟糕**

.. code-block:: python

    def make_complex(*args):
        x, y = args
        return dict(**locals())

**优雅**

.. code-block:: python

    def make_complex(x, y):
        return {'x': x, 'y': y}

在上述优雅的代码中，x和y以明确的字典形式返回给调用者。开发者在使用
这个函数的时候通过阅读第一和最后一行，能够正确地知道该做什么。而在
糟糕的例子中则没有那么明确。

每行一个声明
~~~~~~~~~~~~~~~~~~~~~~

复合语句（比如说列表推导）因其简洁和表达性受到推崇，但在同一行代码中写
两条独立的语句是糟糕的。

**糟糕**

.. code-block:: python

    print 'one'; print 'two'

    if x == 1: print 'one'

    if <复杂的比较> and <其他复杂的比较>:
        # 做一些工作

**优雅**

.. code-block:: python

    print 'one'
    print 'two'

    if x == 1:
        print 'one'

    cond1 = <复杂的比较>
    cond2 = <其他复杂的比较>
    if cond1 and cond2:
        # 做一些工作

函数参数
~~~~~~~~~~~~~~~~~~

将参数传递给函数有四种不同的方式：

1. **位置参数** 是强制的，且没有默认值。 它们是最简单的参数形式，而且能被用在
   一些这样的函数参数中：它们是函数意义的完整部分，其顺序是自然的。比如说：对
   函数的使用者而言，记住 ``send(message, recipient)`` 或 ``point(x, y)`` 需要
   两个参数以及它们的参数顺序并不困难。

在这两种情况下，当调用函数的时候可以使用参数名称，也可以改变参数的顺序，比如说
``send(recipient='World', message='Hello')`` 和 ``point(y=2, x=1)``。但和 ``send(
'Hello', 'World')`` 和 ``point(1, 2)`` 比起来，这降低了可读性，而且带来了
不必要的冗长。

2. **关键字参数** 是非强制的，且有默认值。它们经常被用在传递给函数的可选参数中。
   当一个函数有超过两个或三个位置参数时，函数签名会变得难以记忆，使用带有默认参数
   的关键字参数将会带来帮助。比如，一个更完整的 ``send`` 函数可以被定义为
   ``send(message, to, cc=None, bcc=None)``。这里的 ``cc`` 和 ``bcc`` 是可选的，
   当没有传递给它们其他值的时候，它们的值就是None。

Python中有多种方式调用带关键字参数的函数。比如说，我们可以按定义中的参数顺序而无需
明确的命名参数来调用函数，就像 ``send('Hello', 'World', 'Cthulhu', 'God')`` 是将密件
发送给上帝。我们也可以使用命名参数而无需遵循参数顺序来调用函数，就像 
``send('Hello again', 'World', bcc='God', cc='Cthulhu')`` 。如果没有任何强有力的理由
不去遵循最接近函数定义的语法：``send('Hello', 'World', cc='Cthulhu', bcc='God')`` 那么
这两种方式都应该是要极力避免的。

作为附注，请遵循 `YAGNI <http://en.wikipedia.org/wiki/You_ain't_gonna_need_it>`_ 原则。
通常，移除一个用作“以防万一”但却看起来从未使用的可选参数（以及它在函数中的逻辑），比
添加一个所需的新的可选参数和它的逻辑要来的困难。

3. **任意参数列表** 是第三种给函数传参的方式。如果函数的目的通过带有数目可扩展的
   位置参数的签名能够更好的表达，该函数可以被定义成 ``*args``的结构。在这个函数体中， 
   ``args``是一个元组，它包含所有剩余的位置参数。举个例子， 我们可以用任何容器作为参数去
   调用 ``send(message, *args)`` ，比如 ``send('Hello', 'God', 'Mom', 'Cthulhu')``。
   在此函数体中， ``args`` 相当于 ``('God','Mom', 'Cthulhu')``。

尽管如此，这种结构有一些缺点，使用时应该予以注意。如果一个函数接受的参数列表具有
相同的性质，通常把它定义成一个参数，这个参数是一个列表或者其他任何序列会更清晰。
在这里，如果 ``send`` 参数有多个容器（recipients），将之定义成 ``send(message, recipients)``
会更明确，调用它时就使用 ``send('Hello', ['God', 'Mom', 'Cthulhu'])``。这样的话，
函数的使用者可以事先将容器列表维护成列表（list）形式，这为传递各种不能被转变成
其他序列的序列（包括迭代器）带来了可能。


4. **任意关键字参数字典** 是最后一种给函数传参的方式。如果函数要求一系列待定的
   命名参数，我们可以使用 ``**kwargs`` 的结构。在函数体中， ``kwargs`` 是一个
   字典，它包含所有传递给函数但没有被其他关键字参数捕捉的命名参数。

和 *任意参数列表*中所需注意的一样，相似的原因是：这些强大的技术是用在被证明确实
需要用到它们的时候，它们不应该被用在能用更简单和更明确的结构，来足够表达函数意图
的情况中。

编写函数的时候采用何种参数形式，是用位置参数，还是可选关键字参数，是否使用形如任意参数
的高级技术，这些都由程序员自己决定。如果能明智地遵循上述建议，就可能且非常享受地写出
这样的Python函数：

* 易读（名字和参数无需解释）

* 易改（添加新的关键字参数不会破坏代码的其他部分）

避免魔法方法
~~~~~~~~~~~~~~~~~~~~~~

Python 对骇客来说是一个强有力的工具，它拥有非常丰富的钩子（hook）和工具，允许
你施展几乎任何形式的技巧。比如说，它能够做以下每件事：


* 改变对象创建和实例化的方式

* 改变Python解释器导入模块的方式

* 甚至可能（如果需要的话也是被推荐的）在Python中嵌入C程序

尽管如此，所有的这些选择都有许多缺点。使用更加直接的方式来达成目标通常是更好的
方法。它们最主要的缺点是可读性不高。许多代码分析工具，比如说 pylint 或者 
pyflakes，将无法解析这种“魔法”代码。

我们认为Python开发者应该知道这些近乎无限的可能性，因为它为我们灌输了没有不可能
完成的任务的信心。然而，知道如何，尤其是何时 **不能** 使用它们是非常重要的。

就像一位功夫大师，一个Pythonista知道如何用一个手指杀死对方，但从不会那么去做。

我们都是负责任的用户
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

如前所述，Python允许很多技巧，其中一些具有潜在的危险。一个好的例子是：任何客户端
代码能够重写一个对象的属性和方法（Python中没有 “private” 关键字）。这种哲学
是在说：“我们都是负责任的用户”，它和高度防御性的语言（如Java，拥有很多机制来预防
错误的使用）有着非常大的不同。

这并不意味着，比如说，Python中没有属性是私有的，也不意味着没有合适的封装方法。
与其依赖在开发者的代码之间树立起的一道道隔墙，Python社区更愿意依靠一组约定，来
表明这些元素不应该被直接访问。

私有属性的主要约定和实现细节是在所有的“内部”变量前加一个下划线。如果客户端代码
打破了这条规则并访问了带有下划线的变量，那么因内部代码的改变而出现的任何不当的行为或问题，都是客户端代码的责任。

鼓励“慷慨地”使用此约定：任何不开放给客户端代码使用的方法或属性，应该有一个下划线
前缀。这将保证更好的职责划分以及更容易对已有代码进行修改。将一个私有属性公开化
总是可能的，但是把一个公共属性私有化可能是一个更难的选择。

返回值
~~~~~~~~~~~~~~~~

当一个函数变得复杂，在函数体中使用多返回值的语句并不少见。然而，为了保持函数
的明确意图以及一个可持续的可读水平，更建议在函数体中避免使用返回多个有意义的值。

在函数中返回结果主要有两种情况：函数正常运行并返回它的结果，以及错误的情况，要么
因为一个错误的输入参数，要么因为其他导致函数无法完成计算或任务的原因。

如果你在面对第二种情况时不想抛出异常，返回一个值（比如说None或False）来表明
函数无法正确运行，可能是需要的。在这种情况下，越早返回所发现的不正确上下文越好。
这将帮助扁平化函数的结构：在“因为错误而返回”的语句后的所有代码能够假定条件满足
接下来的函数主要结果的运算。有多个这样的返回结果通常是需要的。

尽管如此，当一个函数在其正常过程中有多个主要出口点时，它会变得难以调试和返回其
结果，所以保持单个出口点可能会更好。这也将有助于提取某些代码路径，而且多个出口点
很有可能意味着这里需要重构。

.. code-block:: python

   def complex_function(a, b, c):
       if not a:
           return None  # 抛出一个异常可能会更好
       if not b:
           return None  # 抛出一个异常可能会更好
       
       # 一些复杂的代码试着用a,b,c来计算x 
       # 如果成功了，抵制住返回x的诱惑
       if not x:
           # 一些关于x的计算的Plan-B
       return x  # 返回值x只有一个出口点有利于维护代码

行话
------

A programming idiom, put simply, is a *way* to write code. The notion of
programming idioms is discussed amply at `c2 <http://c2.com/cgi/wiki?ProgrammingIdiom>`_
and at `Stack Overflow <http://stackoverflow.com/questions/302459/what-is-a-programming-idiom>`_.

Idiomatic Python code is often referred to as being *Pythonic*.

Although there usually is one --- and preferably only one --- obvious way to do
it; *the* way to write idiomatic Python code can be non-obvious to Python
beginners. So, 优雅 idioms must be consciously acquired.

Some common Python idioms follow:

.. _unpacking-ref:

Unpacking
~~~~~~~~~

If you know the length of a list or tuple, you can assign names to its
elements with unpacking. For example, since ``enumerate()`` will provide
a tuple of two elements for each item in list:

.. code-block:: python

    for index, item in enumerate(some_list):
        # 做一些工作 with index and item

You can use this to swap variables as well:

.. code-block:: python

    a, b = b, a

Nested unpacking works too:

.. code-block:: python

   a, (b, c) = 1, (2, 3)

In Python 3, a new method of extended unpacking was introduced by
:pep:`3132`:

.. code-block:: python

   a, *rest = [1, 2, 3]
   # a = 1, rest = [2, 3]
   a, *middle, c = [1, 2, 3, 4]
   # a = 1, middle = [2, 3], c = 4

Create an ignored variable
~~~~~~~~~~~~~~~~~~~~~~~~~~

If you need to assign something (for instance, in :ref:`unpacking-ref`) but
will not need that variable, use ``__``:

.. code-block:: python

    filename = 'foobar.txt'
    basename, __, ext = filename.rpartition('.')

.. note::

   Many Python style guides recommend the use of a single underscore "``_``"
   for throwaway variables rather than the double underscore "``__``"
   recommended here. The issue is that "``_``" is commonly used as an alias
   for the :func:`~gettext.gettext` function, and is also used at the
   interactive prompt to hold the value of the last operation. Using a
   double underscore instead is just as clear and almost as convenient,
   and eliminates the risk of accidentally interfering with either of
   these other use cases.

Create a length-N list of the same thing
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Use the Python list ``*`` operator:

.. code-block:: python

    four_nones = [None] * 4

Create a length-N list of lists
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Because lists are mutable, the ``*`` operator (as above) will create a list
of N references to the `same` list, which is not likely what you want.
Instead, use a list comprehension:

.. code-block:: python

    four_lists = [[] for __ in xrange(4)]

Create a string from a list
~~~~~~~~~~~~~~~~~~~~~~~~~~~

A common idiom for creating strings is to use :py:meth:`str.join` on an empty
string.

.. code-block:: python

    letters = ['s', 'p', 'a', 'm']
    word = ''.join(letters)

This will set the value of the variable *word* to 'spam'. This idiom can be
applied to lists and tuples.

Searching for an item in a collection
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Sometimes we need to search through a collection of things. Let's look at two
options: lists and sets.

Take the following code for example:

.. code-block:: python

    s = set(['s', 'p', 'a', 'm'])
    l = ['s', 'p', 'a', 'm']

    def lookup_set(s):
        return 's' in s

    def lookup_list(l):
        return 's' in l

Even though both functions look identical, because *lookup_set* is utilizing
the fact that sets in Python are hashtables, the lookup performance
between the two is very different. To determine whether an item is in a list,
Python will have to go through each item until it finds a matching item. 
This is time consuming, especially for long lists. In a set, on the other
hand, the hash of the item will tell Python where in the set to look for
a matching item. As a result, the search can be done quickly, even if the
set is large. Searching in dictionaries works the same way. For 
more information see this
`StackOverflow <http://stackoverflow.com/questions/513882/python-list-vs-dict-for-look-up-table>`_
page. For detailed information on the amount of time various common operations
take on each of these data structures, see 
`this page <https://wiki.python.org/moin/TimeComplexity?>`_.

Because of these differences in performance, it is often a 优雅 idea to use 
sets or dictionaries instead of lists in cases where: 

* The collection will contain a large number of items

* You will be repeatedly searching for items in the collection

* You do not have duplicate items. 

For small collections, or collections which you will not frequently be 
searching through, the additional time and memory required to set up the 
hashtable will often be greater than the time saved by the improved search 
speed.


Python之禅
-------------

又名 :pep:`20`, Python设计的指导原则。

.. code-block:: pycon

    >>> import this
    The Zen of Python, by Tim Peters

    Beautiful is better than ugly.
    Explicit is better than implicit.
    Simple is better than complex.
    Complex is better than complicated.
    Flat is better than nested.
    Sparse is better than dense.
    Readability counts.
    Special cases aren't special enough to break the rules.
    Although practicality beats purity.
    Errors should never pass silently.
    Unless explicitly silenced.
    In the face of ambiguity, refuse the temptation to guess.
    There should be one-- and preferably only one --obvious way to do it.
    Although that way may not be obvious at first unless you're Dutch.
    Now is better than never.
    Although never is often better than *right* now.
    If the implementation is hard to explain, it's a bad idea.
    If the implementation is easy to explain, it may be a good idea.
    Namespaces are one honking great idea -- let's do more of those!

    Python之禅 by Tim Peters
 
    优美胜于丑陋（Python以编写优美的代码为目标）
    明了胜于晦涩（优美的代码应当是明了的，命名规范，风格相似）
    简洁胜于复杂（优美的代码应当是简洁的，不要有复杂的内部实现）
    复杂胜于凌乱（如果复杂不可避免，那代码间也不能有难懂的关系，要保持接口简洁）
    扁平胜于嵌套（优美的代码应当是扁平的，不能有太多的嵌套）
    间隔胜于紧凑（优美的代码有适当的间隔，不要奢望一行代码解决问题）
    可读性很重要（优美的代码是可读的）
    即便假借特例的实用性之名，也不可违背这些规则（这些规则至高无上）
    不要包容所有错误，除非你确定需要这样做（精准地捕获异常，不写 except:pass 风格的代码）
    当存在多种可能，不要尝试去猜测
    而是尽量找一种，最好是唯一一种明显的解决方案（如果不确定，就用穷举法）
    虽然这并不容易，因为你不是 Python 之父（这里的 Dutch 是指 Guido ）
    做也许好过不做，但不假思索就动手还不如不做（动手之前要细思量）
    如果你无法向人描述你的方案，那肯定不是一个好方案；反之亦然（方案测评标准）
    命名空间是一种绝妙的理念，我们应当多加利用（倡导与号召）

想要了解一些Python优雅风格的例子，请见 `这些来自于Python用户的幻灯片 
<http://artifex.org/~hblanks/talks/2011/pep20_by_example.pdf>`_.

PEP 8
-----

:pep:`8` is the de-facto code style guide for Python.

Conforming your Python code to PEP 8 is generally a 优雅 idea and helps make
code more consistent when working on projects with other developers. There
is a command-line program, `pep8 <https://github.com/jcrocholl/pep8>`_,
that can check your code for conformance. Install it by running the following
command in your terminal:


.. code-block:: console

    $ pip install pep8


Then run it on a file or series of files to get a report of any violations.

.. code-block:: console

    $ pep8 optparse.py
    optparse.py:69:11: E401 multiple imports on one line
    optparse.py:77:1: E302 expected 2 blank lines, found 1
    optparse.py:88:5: E301 expected 1 blank line, found 0
    optparse.py:222:34: W602 deprecated form of raising exception
    optparse.py:347:31: E211 whitespace before '('
    optparse.py:357:17: E201 whitespace after '{'
    optparse.py:472:29: E221 multiple spaces before operator
    optparse.py:544:21: W601 .has_key() is deprecated, use 'in'

The program `autopep8 <https://pypi.python.org/pypi/autopep8/>`_ can be used to
automatically reformat code in the PEP 8 style. Install the program with:

.. code-block:: console

    $ pip install autopep8

Use it to format a file in-place with:

.. code-block:: console

    $ autopep8 --in-place optparse.py

Excluding the ``--in-place`` flag will cause the program to output the modified
code directly to the console for review. The ``--aggressive`` flag will perform
more substantial changes and can be applied multiple times for greater effect.

约定
----------------

Here are some conventions you should follow to make your code easier to read.

Check if variable equals a constant
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

You don't need to explicitly compare a value to True, or None, or 0 - you can
just add it to the if statement. See `Truth Value Testing
<http://docs.python.org/library/stdtypes.html#truth-value-testing>`_ for a
list of what is considered false.

**糟糕**:

.. code-block:: python

    if attr == True:
        print 'True!'

    if attr == None:
        print 'attr is None!'

**优雅**:

.. code-block:: python

    # Just check the value
    if attr:
        print 'attr is truthy!'

    # or check for the opposite
    if not attr:
        print 'attr is falsey!'

    # or, since None is considered false, explicitly check for it
    if attr is None:
        print 'attr is None!'

Access a Dictionary Element
~~~~~~~~~~~~~~~~~~~~~~~~~~~

Don't use the :py:meth:`dict.has_key` method. Instead, use ``x in d`` syntax,
or pass a default argument to :py:meth:`dict.get`.

**糟糕**:

.. code-block:: python

    d = {'hello': 'world'}
    if d.has_key('hello'):
        print d['hello']    # prints 'world'
    else:
        print 'default_value'

**优雅**:

.. code-block:: python

    d = {'hello': 'world'}

    print d.get('hello', 'default_value') # prints 'world'
    print d.get('thingy', 'default_value') # prints 'default_value'

    # Or:
    if 'hello' in d:
        print d['hello']

Short Ways to Manipulate Lists
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

`List comprehensions
<http://docs.python.org/tutorial/datastructures.html#list-comprehensions>`_
provide a powerful, concise way to work with lists. Also, the :py:func:`map` and
:py:func:`filter` functions can perform operations on lists using a different,
more concise syntax.

**糟糕**:

.. code-block:: python

    # Filter elements greater than 4
    a = [3, 4, 5]
    b = []
    for i in a:
        if i > 4:
            b.append(i)

**优雅**:

.. code-block:: python

    a = [3, 4, 5]
    b = [i for i in a if i > 4]
    # Or:
    b = filter(lambda x: x > 4, a)

**糟糕**:

.. code-block:: python

    # Add three to all list members.
    a = [3, 4, 5]
    for i in range(len(a)):
        a[i] += 3

**优雅**:

.. code-block:: python

    a = [3, 4, 5]
    a = [i + 3 for i in a]
    # Or:
    a = map(lambda i: i + 3, a)

Use :py:func:`enumerate` keep a count of your place in the list.

.. code-block:: python

    a = [3, 4, 5]
    for i, item in enumerate(a):
        print i, item
    # prints
    # 0 3
    # 1 4
    # 2 5

The :py:func:`enumerate` function has better readability than handling a
counter manually. Moreover, it is better optimized for iterators.

Read From a File
~~~~~~~~~~~~~~~~

Use the ``with open`` syntax to read from files. This will automatically close
files for you.

**糟糕**:

.. code-block:: python

    f = open('file.txt')
    a = f.read()
    print a
    f.close()

**优雅**:

.. code-block:: python

    with open('file.txt') as f:
        for line in f:
            print line

The ``with`` statement is better because it will ensure you always close the
file, even if an exception is raised inside the ``with`` block.

Line Continuations
~~~~~~~~~~~~~~~~~~

When a logical line of code is longer than the accepted limit, you need to
split it over multiple physical lines. The Python interpreter will join
consecutive lines if the last character of the line is a backslash. This is
helpful in some cases, but should usually be avoided because of its fragility:
a white space added to the end of the line, after the backslash, will break the
code and may have unexpected results.

A better solution is to use parentheses around your elements. Left with an
unclosed parenthesis on an end-of-line the Python interpreter will join the
next line until the parentheses are closed. The same behavior holds for curly
and square braces.

**糟糕**:

.. code-block:: python

    my_very_big_string = """For a long time I used to go to bed early. Sometimes, \
        when I had put out my candle, my eyes would close so quickly that I had not even \
        time to say “I’m going to sleep.”"""

    from some.deep.module.inside.a.module import a_nice_function, another_nice_function, \
        yet_another_nice_function

**优雅**:

.. code-block:: python

    my_very_big_string = (
        "For a long time I used to go to bed early. Sometimes, "
        "when I had put out my candle, my eyes would close so quickly "
        "that I had not even time to say “I’m going to sleep.”"
    )

    from some.deep.module.inside.a.module import (
        a_nice_function, another_nice_function, yet_another_nice_function)

However, more often than not, having to split a long logical line is a sign that
you are trying to do too many things at the same time, which may hinder
readability.
