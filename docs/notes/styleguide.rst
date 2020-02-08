.. _guide-style-guide:

#####################
风格指南指引
#####################

.. image:: https://farm4.staticflickr.com/3684/33573755856_7f43d43adf_k_d.jpg

所有文档都有一致的格式，以帮助更好地理解文档。为了使指导更容易消化，所有贡献都应适应风格指南的规则。

本指南以 :ref:`restructuredtext-ref` 形式编写。

.. note:: 本指南部分内容可能尚未符合本指南指引。欢迎更新这些部分以保持同步。

.. note:: 在任何一个渲染后的HTML页面，您可以点击“查看源码（Show Source）”来看作者是如何排版的。

*********
关联
*********

尽量保持任何贡献与 :ref:`本指南目的 <about-ref>` 相关。

* 避免在主题中包含太多与Python开发并不直接相关的信息。
* 如果其他资源已存在，最好以链接的形式来展示。确保描述出您所链接的内容和原因。
* `Cite <https://www.sphinx-doc.org/en/master/usage/restructuredtext/basics.html#citations>`_
  引用在需要的地方。
* 如果某主题并不与Python直接相关，但是和Python之间的关联又很有用（比如Git、GitHub、数据库等），以链接的形式引用这些资源，并描述为什么它对Python有用。
* 如果疑问，就去询问。

********
标题
********

使用下列风格作为标题。

章节标题：

.. code-block:: rest

    #########
    章节 1
    #########

页面标题： 

.. code-block:: rest

    *******************
    时间是种幻觉
    *******************

小节标题:

.. code-block:: rest

    午餐时间加倍
     ===================

次小节标题:

.. code-block:: rest

    非常深
    ---------


*****
换行
*****

每78个字符进行文字换行。必要时可以超过78个字符，尤其是那种换行使得源内容更难阅读的情况。

使用标准的美式英语，而非英式英语。

`序列逗号（serial comma） <https://en.wikipedia.org/wiki/Serial_comma>`_ 
（也称为Oxford comma，牛津逗号）的使用是100%没有选择的。 任何尝试以缺少的连续逗号提交内容
将导致该项目的永久性移除，因为完全缺乏品味。

流放？ 您在开玩笑吗？ 希望我们永远不必找出来。


*************
代码例子
*************

所有代码示例要在70个字符进行换行，以避免出现水平滚动条。

命令行例子：

.. code-block:: rest

    .. code-block:: console

        $ run command --help
        $ ls ..

Unix 控制台用例中，确保每行前面包含了 ``$`` 前缀。

Windows 控制台用例中，使用 ``doscon`` 或 ``powershell`` 而非 ``console``，并且去掉 ``$`` 前缀。

Python解释器例子：

.. code-block:: rest

    Label the example::

    .. code-block:: python

        >>> import this

Python 例子：

.. code-block:: rest

    Descriptive title::

    .. code-block:: python

        def get_answer():
            return 42

******************
外部链接
******************

* 链接时最好使用众所周知的主题（比如一些合适的名词）：

  .. code-block:: rest

      Sphinx_ 通常用来文档化Python。

      .. _Sphinx: https://www.sphinx-doc.org

* 最好使用带有内联链接的描述性标签，而不是单纯的链接:

  .. code-block:: rest

      阅读 `Sphinx 教程 <https://www.sphinx-doc.org/en/master/usage/quickstart.html>`_

* 避免使用诸如“点击这里”、“这个”等标签。最好使用描述性标签（值得搜索引擎优化，SEO worthy）。

********************************
指向指南内部章节的链接
********************************

要交叉引用本文档的其他部分，使用 `:ref:
<https://www.sphinx-doc.org/en/master/usage/restructuredtext/roles.html#role-ref>`_ 关键字和标签。

要使引用标签更加清晰和独特，通常加上一个 ``-ref`` 后缀：

.. code-block:: rest

    .. _some-section-ref:

    Some Section
    ------------


******************
注意和警告
******************

使用适当的 `警告指示 <https://www.sphinx-doc.org/en/master/usage/restructuredtext/basics.html#directives>`_ 来说明注意内容。

注意:

.. code-block:: rest

    .. note::
        The Hitchhiker’s Guide to the Galaxy has a few things to say
        on the subject of towels. A towel, it says, is about the most
        massively useful thing an interstellar hitch hiker can have.

警告:

.. code-block:: rest

    .. warning:: DON'T PANIC

***************
要做的事
***************

请用 `todo 指示 <https://www.sphinx-doc.org/en/master/usage/extensions/todo.html>`_ 来标记本指南中任何未完成的部分。避免使 :ref:`todo-list-ref` 混乱，为未完的文档或者大量未完的小节使用单独的 ``todo``。

.. code-block:: rest

    .. todo::
        Learn the Ultimate Answer to the Ultimate Question
        of Life, The Universe, and Everything
