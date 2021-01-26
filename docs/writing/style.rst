.. _code_style:


##########
代码风格
##########

.. image:: https://farm5.staticflickr.com/4223/33907150054_5ee79e8940_k_d.jpg

如果您问Python程序员最喜欢Python的什么，他们总会说是Python的高可读性。
事实上，高度的可读性是Python语言的设计核心。这基于这样的事实：代码的
阅读比编写更加频繁。

Python代码具有高可读性的其中一个原因是它的相对完整的代码风格指引和 “Pythonic” 
的习语。

当一位富有经验的Python开发者（Pythonista）指出某段代码并不 “Pythonic”时，
通常意味着这些代码并没有遵循通用的指导方针，也没有用最佳的（最可读的）方式
来表达意图。

在某些边缘情况下，Python代码中并没有大家都认同的表达意图的最佳方式，但这些情况
都很少见。


****************
一般概念
****************

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

    if <complex comparison> and <other complex comparison>:
        # do something

**优雅**

.. code-block:: python

    print 'one'
    print 'two'

    if x == 1:
        print 'one'

    cond1 = <complex comparison>
    cond2 = <other complex comparison>
    if cond1 and cond2:
        # do something

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
   位置参数的签名能够更好的表达，该函数可以被定义成 ``*args`` 的结构。在这个函数体中， 
   ``args`` 是一个元组，它包含所有剩余的位置参数。举个例子， 我们可以用任何容器作为参数去
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

和 *任意参数列表* 中所需注意的一样，相似的原因是：这些强大的技术是用在被证明确实
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
您施展几乎任何形式的技巧。比如说，它能够做以下每件事：


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

如果您在面对第二种情况时不想抛出异常，返回一个值（比如说None或False）来表明
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


******************
习语（Idiom）
******************

编程习语，说得简单些，就是写代码的 *方式*。编程习语的概念在 `c2 <http://c2.
com/cgi/wiki?ProgrammingIdiom>`_ 和 `Stack Overflow <http://stackoverflow.
com/questions/302459/what-is-a-programming-idiom>`_ 上有充足的讨论。

采用习语的Python代码通常被称为 *Pythonic*。

尽管通常有一种 --- 而且最好只有一种 --- 明显的方式去写得Pythonic；对Python
初学者来说，写出习语式的Python代码的 *方式* 并不明显。所以，好的习语必须
有意识地获取。

如下有一些常见的Python习语：

.. _unpacking-ref:

解包（Unpacking）
~~~~~~~~~~~~~~~~~~~~~~~~~~~

如果您知道一个列表或者元组的长度，您可以将其解包并为它的元素取名。比如，
``enumerate()`` 会对list中的每个项提供包含两个元素的元组：

.. code-block:: python

    for index, item in enumerate(some_list):
        # 使用index和item做一些工作

您也能通过这种方式交换变量：

.. code-block:: python

    a, b = b, a

嵌套解包也能工作：

.. code-block:: python

   a, (b, c) = 1, (2, 3)

在Python 3中，扩展解包的新方法在 :pep:`3132` 有介绍：

.. code-block:: python

   a, *rest = [1, 2, 3]
   # a = 1, rest = [2, 3]
   a, *middle, c = [1, 2, 3, 4]
   # a = 1, middle = [2, 3], c = 4

创建一个被忽略的变量
~~~~~~~~~~~~~~~~~~~~~~~~~~

如果您需要赋值（比如，在 :ref:`unpacking-ref` ）但不需要这个变量，请使用
``__``:

.. code-block:: python

    filename = 'foobar.txt'
    basename, __, ext = filename.rpartition('.')

.. note::

   许多Python风格指南建议使用单下划线的 "``_``" 而不是这里推荐的双下划线 "``__``" 来
   指示废弃变量。问题是， "``_``" 常用在作为 :func:`~gettext.gettext` 函数
   的别名，也被用在交互式命令行中记录最后一次操作的值。相反，使用双下划线
   十分清晰和方便，而且能够消除使用其他这些用例所带来的意外干扰的风险。

创建一个含N个对象的列表
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

使用Python列表中的 ``*`` 操作符：

.. code-block:: python

    four_nones = [None] * 4

创建一个含N个列表的列表
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

因为列表是可变的，所以 ``*`` 操作符（如上）将会创建一个包含N个且指向 *同一个* 
列表的列表，这可能不是您想用的。取而代之，请使用列表解析：

.. code-block:: python

    four_lists = [[] for __ in xrange(4)]

注意：在 Python 3 中使用 range() 而不是 xrange()

根据列表来创建字符串
~~~~~~~~~~~~~~~~~~~~~~~~~~~

创建字符串的一个常见习语是在空的字符串上使用 :py:meth:`str.join` 。

.. code-block:: python

    letters = ['s', 'p', 'a', 'm']
    word = ''.join(letters)

这会将 *word* 变量赋值为 'spam'。这个习语可以用在列表和元组中。

在集合体（collection）中查找一个项
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

有时我们需要在集合体中查找。让我们看看这两个选择：列表和集合（set）。

用如下代码举个例子：

.. code-block:: python

    s = set(['s', 'p', 'a', 'm'])
    l = ['s', 'p', 'a', 'm']

    def lookup_set(s):
        return 's' in s

    def lookup_list(l):
        return 's' in l

即使两个函数看起来完全一样，但因为 *查找集合* 是利用了Python中的集合是可哈希的
特性，两者的查询性能是非常不同的。为了判断一个项是否在列表中，Python将会查看
每个项直到它找到匹配的项。这是耗时的，尤其是对长列表而言。另一方面，在集合中，
项的哈希值将会告诉Python在集合的哪里去查找匹配的项。结果是，即使集合很大，查询
的速度也很快。在字典中查询也是同样的原理。想了解更多内容，请见
`StackOverflow <https://stackoverflow.com/questions/513882/python-list-vs-dict-for-look-up-table>`_ 。想了解在每种数据结构上的多种常见操作的花费时间的详细内容，
请见 `此页面 <https://wiki.python.org/moin/TimeComplexity?>`_。

因为这些性能上的差异，在下列场合在使用集合或者字典而不是列表，通常会是个好主意：

* 集合体中包含大量的项

* 您将在集合体中重复地查找项

* 您没有重复的项

对于小的集合体，或者您不会频繁查找的集合体，建立哈希带来的额外时间和内存的
开销经常会大过改进搜索速度所节省的时间。


*************
Python之禅
*************

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
    不要包容所有错误，除非您确定需要这样做（精准地捕获异常，不写 except:pass 风格的代码）
    当存在多种可能，不要尝试去猜测
    而是尽量找一种，最好是唯一一种明显的解决方案（如果不确定，就用穷举法）
    虽然这并不容易，因为您不是 Python 之父（这里的 Dutch 是指 Guido ）
    做也许好过不做，但不假思索就动手还不如不做（动手之前要细思量）
    如果您无法向人描述您的方案，那肯定不是一个好方案；反之亦然（方案测评标准）
    命名空间是一种绝妙的理念，我们应当多加利用（倡导与号召）

想要了解一些Python优雅风格的例子，请见 `这些来自于Python用户的幻灯片 
<https://github.com/hblanks/zen-of-python-by-example>`_.



*****
PEP 8
*****

:pep:`8` 是Python事实上的代码风格指南，我们可以在 `pep8.org <http://pep8.org/>`_
上获得高质量的、易读的PEP 8版本。

强烈推荐阅读这部分。整个Python社区都尽力遵循本文档中规定的准则。一些项目可能受其影响，
而其他项目可能 `修改其建议 <http://docs.python-equests.org/en/master/dev/contributing/kenneth-reitz-s-code-style>`_。

也就是说，让您的 Python 代码遵循 PEP 8 通常是个好主意，这也有助于在与其他开发人员
一起工作时使代码更加具有可持续性。命令行程序 pycodestyle `<https://github.com/PyCQA/pycodestyle>`_ 
（以前叫做``pep8``），可以检查代码一致性。在您的终端上运行以下命令来安装它：

.. code-block:: console

    $ pip install pycodestyle

然后，对一个文件或者一系列的文件运行它，来获得任何违规行为的报告。

.. code-block:: console

    $ pycodestyle optparse.py
    optparse.py:69:11: E401 multiple imports on one line
    optparse.py:77:1: E302 expected 2 blank lines, found 1
    optparse.py:88:5: E301 expected 1 blank line, found 0
    optparse.py:222:34: W602 deprecated form of raising exception
    optparse.py:347:31: E211 whitespace before '('
    optparse.py:357:17: E201 whitespace after '{'
    optparse.py:472:29: E221 multiple spaces before operator
    optparse.py:544:21: W601 .has_key() is deprecated, use 'in'

程序 `autopep8 <https://pypi.org/project/autopep8/>`_ 能自动将代码格式化
成 PEP 8 风格。用以下指令安装此程序：

.. code-block:: console

    $ pip install autopep8

用以下指令格式化一个文件：

.. code-block:: console

    $ autopep8 --in-place optparse.py

不包含 ``--in-place`` 标志将会使得程序直接将更改的代码输出到控制台，以供审查。
``--aggressive`` 标志则会执行更多实质性的变化，而且可以多次使用以达到更佳的效果。


***********
约定
***********

这里有一些您应该遵循的约定，以让您的代码更加易读。

检查变量是否等于常量
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

您不需要明确地比较一个值是True，或者None，或者0 - 您可以仅仅把它放在if语句中。
参阅 `真值测试 <http://docs.python.org/library/stdtypes.html#truth-value-testing>`_ 来了解什么被认为是false。


**糟糕**:

.. code-block:: python

    if attr == True:
        print 'True!'

    if attr == None:
        print 'attr is None!'

**优雅**:

.. code-block:: python

    # 检查值
    if attr:
        print 'attr is truthy!'

    # 或者做相反的检查
    if not attr:
        print 'attr is falsey!'

    # or, since None is considered false, explicitly check for it
    if attr is None:
        print 'attr is None!'

访问字典元素
~~~~~~~~~~~~~~~~~~~~~~~~~~~

不要使用 :py:meth:`dict.has_key` 方法。取而代之，使用 ``x in d`` 语法，或者
将一个默认参数传递给 :py:meth:`dict.get`。

**糟糕**:

.. code-block:: python

    d = {'hello': 'world'}
    if d.has_key('hello'):
        print d['hello']    # 打印 'world'
    else:
        print 'default_value'

**优雅**:

.. code-block:: python

    d = {'hello': 'world'}

    print d.get('hello', 'default_value') # 打印 'world'
    print d.get('thingy', 'default_value') # 打印 'default_value'

    # Or:
    if 'hello' in d:
        print d['hello']

维护列表的捷径
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

`列表推导
<http://docs.python.org/tutorial/datastructures.html#list-comprehensions>`_
提供了一个强大的而又简洁的方式来处理列表。

`生成器表达式
<http://docs.python.org/tutorial/classes.html#generator-expressions>`_
遵循和列表推导几乎相同的语法，但是返回生成器而非列表。

创建一个新的列表需要更多的工作，也需要使用更多的内存。如果你只是遍历这个列表，更好地方式是使用迭代器。

**糟糕**:

.. code-block:: python

    # 不必要地在内存中分配了包含所有对象（gpa, name）的列表
    valedictorian = max([(student.gpa, student.name) for student in graduates])

**优雅**:

.. code-block:: python

    valedictorian = max((student.gpa, student.name) for student in graduates)

当你确实想要创建新的列表时，比如要多次使用结果，那么就使用列表推导。

如果你的逻辑太过复杂，无法用简短的列表推导或者生成器来简洁地表达，请考虑使用生成器函数而非返回一个列表。

**Good**:

.. code-block:: python

    def make_batches(items, batch_size):
        """
        >>> list(make_batches([1, 2, 3, 4, 5], batch_size=3))
        [[1, 2, 3], [4, 5]]
        """
        current_batch = []
        for item in items:
            current_batch.append(item)
            if len(current_batch) == batch_size:
                yield current_batch
                current_batch = []
        yield current_batch

永远不要为了列表推导的副作用而使用它。

**糟糕**:

.. code-block:: python

    [print(x) for x in sequence]

**优雅**:

.. code-block:: python

    for x in sequence:
        print(x) 


过滤列表
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

**糟糕**:

在迭代列表的过程中，永远不要从列表中移除元素。

.. code-block:: python

    # 过滤大于 4 的元素
    a = [3, 4, 5]
    for i in a:
        if i > 4:
            a.remove(i)

不要在列表中多次遍历。

.. code-block:: python

    while i in a:
        a.remove(i)

**优雅**:

使用列表推导，或生成器表达式。

.. code-block:: python

    # 推导创建了一个新的列表对象
    filtered_values = [value for value in sequence if value != x]

    # 生成器不会创建新的列表
    filtered_values = (value for value in sequence if value != x)

修改原始列表可能产生的副作用
::::::::::::::::::::::::::::::::::::::::::::::::::::

如果有其他变量引用原始列表，则修改它可能会有风险。但如果你真的想这样做，你可以使用 *切片赋值（slice assignment）* 。

.. code-block:: python

    # 修改原始列表的内容
    sequence[::] = [value for value in sequence if value != x]

在列表中修改值
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

**糟糕**:

请记住，赋值永远不会创建新对象。如果两个或多个变量引用相同的列表，则修改其中一个变量意味着将修改所有变量。

.. code-block:: python

    # 所有的列表成员都加 3
    a = [3, 4, 5]
    b = a                     # a 和 b 都指向一个列表独享
    
    for i in range(len(a)):
        a[i] += 3             # b[i] 也改变了

**优雅**:

创建一个新的列表对象并保留原始列表对象会更安全。

.. code-block:: python

    a = [3, 4, 5]
    b = a
    
    # 给变量 "a" 赋值新的列表，而不改变 "b"
    a = [i + 3 for i in a]

使用 :py:func:`enumerate` 获得列表中的当前位置的计数。

.. code-block:: python

    a = [3, 4, 5]
    for i, item in enumerate(a):
        print i, item
    # 打印
    # 0 3
    # 1 4
    # 2 5

使用 :py:func:`enumerate` 函数比手动维护计数有更好的可读性。而且，它对迭代器
进行了更好的优化。

读取文件
~~~~~~~~~~~~~~~~

使用 ``with open`` 语法来读取文件。它将会为您自动关闭文件。

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

``with`` 语句会更好，因为它能确保您总是关闭文件，即使是在 ``with`` 的区块中
抛出一个异常。

行的延续
~~~~~~~~~~~~~~~~~~

当一个代码逻辑行的长度超过可接受的限度时，您需要将之分为多个物理行。如果行的结尾
是一个反斜杠（\），Python解释器会把这些连续行拼接在一起。这在某些情况下很有帮助，
但我们总是应该避免使用，因为它的脆弱性：如果在行的结尾，在反斜杠后加了空格，这会
破坏代码，而且可能有意想不到的结果。

一个更好的解决方案是在元素周围使用括号。左边以一个未闭合的括号开头，Python
解释器会把行的结尾和下一行连接起来直到遇到闭合的括号。同样的行为适用中括号
和大括号。

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

尽管如此，通常情况下，必须去分割一个长逻辑行意味着您同时想做太多的事，这
可能影响可读性。
