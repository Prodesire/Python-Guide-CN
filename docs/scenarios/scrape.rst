HTML 抓取
=============

网页抓取
------------

Web站点使用HTML描述，这意味着每个web页面是一个结构化的文档。有时从中
获取数据同时保持它的结构是有用的。web站点不是总是提供它们的数据以
容易处理的格式，如``csv`` 或者 ``json``.

这正是web抓取的出场时机。web抓取是使用计算机程序将web页面数据进行收集
并整理成所需格式并同时保持其结构的过程。

lxml和Requests
-----------------

`lxml <http://lxml.de/>`_ 是一个漂亮的扩展库，用来快速解析XML以及HTML文档
即使所处理的标签非常混乱。我们也将使用 `Requests <http://docs.python-requests.org/en/latest/>`_ 
模块取代内建的urllib2模块因为其速度更快而且可读性更好。你可以安装着两个通过使用 ``pip install lxml`` 
与 ``pip install requests`` 命令。

让我们以下面的导入开始：

.. code-block:: python

    from lxml import html
    import requests

下一步我们将使用 ``requests.get`` 来从web页面中收集我们的数据，解析它
通过使用 ``html`` 模块保存结果到 ``tree`` 中。

.. code-block:: python

    page = requests.get('http://econpy.pythonanywhere.com/ex/001.html')
    tree = html.fromstring(page.text)

``tree`` 现在包含了整个HTML文件到一个优雅的树结构中，我们可以使用两种
方法访问：XPath以及CSS选择器。在这个例子中，我们将选择前者。

XPath是一种在结构化文档（如HTML或XML）中定位信息的方法。一个不错的关于
XPath的介绍参见 `W3Schools <http://www.w3schools.com/xpath/default.asp>`_ .

有很多工具可以获取一个元素的XPath，如Firefox的FireBug或者chrome的
Inspector. 如果你正在使用Chrome，你可以右键元素，选择 'Inspect element'，
高亮这段代码，再次右击并且选择 'Copy XPath'.

在进行一次快速分析后，我们看到所需数据在页面的两个元素里，一个是
一个div，其具有title 'buyer-name' 另一个是一个span 其具有class 'item-price':

.. code-block:: html

    <div title="buyer-name">Carson Busses</div>
    <span class="item-price">$29.95</span>

知道这个后我们可以创建完美的XPath查询并且使用lxml ``xpath`` 函数
像这样：

.. code-block:: python

    #This will create a list of buyers:
    buyers = tree.xpath('//div[@title="buyer-name"]/text()')
    #This will create a list of prices
    prices = tree.xpath('//span[@class="item-price"]/text()')

让我们看看我们得到了什么：

.. code-block:: python

    print 'Buyers: ', buyers
    print 'Prices: ', prices

::

    Buyers:  ['Carson Busses', 'Earl E. Byrd', 'Patty Cakes',
    'Derri Anne Connecticut', 'Moe Dess', 'Leda Doggslife', 'Dan Druff',
    'Al Fresco', 'Ido Hoe', 'Howie Kisses', 'Len Lease', 'Phil Meup',
    'Ira Pent', 'Ben D. Rules', 'Ave Sectomy', 'Gary Shattire',
    'Bobbi Soks', 'Sheila Takya', 'Rose Tattoo', 'Moe Tell']

    Prices:  ['$29.95', '$8.37', '$15.26', '$19.25', '$19.25',
    '$13.99', '$31.57', '$8.49', '$14.47', '$15.86', '$11.11',
    '$15.98', '$16.27', '$7.50', '$50.85', '$14.26', '$5.68',
    '$15.00', '$114.07', '$10.09']

恭喜！我们已经成功抓取了所有我们想要的数据从一个web页面中通过使用
lxml与Requests.我们将它们以列表的形式存在内存中。现在我们可以对它做
所有酷酷的事情了：我们可以分析它通过Python或者我们可以保存它为一个
文件并在分享出去。

可以考虑一些更酷的事情，如修改这个脚本来获取这个例子数据集中其余
页面的数据，或者通过多线程化提升这个应用的速度。
