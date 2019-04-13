
###########
XML解析
###########

.. image:: /_static/photos/33888714601_a1f7d020a2_k_d.jpg

********
untangle
********

`untangle <https://github.com/stchris/untangle>`_ 库可以将XML文档映射为一个Python
对象，该对象于其结构中包含了原文档的节点与属性信息。

作为例子，一个像这样的XML文件：

.. code-block:: xml

    <?xml version="1.0"?>
    <root>
        <child name="child1">
    </root>

可以被这样载入：

.. code-block:: python

    import untangle
    obj = untangle.parse('path/to/file.xml')


然后您可以像这样获取child元素名称：

.. code-block:: python

    obj.root.child['name']

untangle也支持从字符串或URL中载入XML。

*********
xmltodict
*********

`xmltodict <https://github.com/martinblech/xmltodict>`_ 是另一个简易的库，
它致力于将XML变得像JSON。

对于一个像这样的XML文件：

.. code-block:: xml

    <mydocument has="an attribute">
      <and>
        <many>elements</many>
        <many>more elements</many>
      </and>
      <plus a="complex">
        element as well
      </plus>
    </mydocument>

可以装载进一个Python字典里，像这样：

.. code-block:: python

    import xmltodict

    with open('path/to/file.xml') as fd:
        doc = xmltodict.parse(fd.read())

您可以访问元素，属性以及值，像这样：

.. code-block:: python

    doc['mydocument']['@has'] # == u'an attribute'
    doc['mydocument']['and']['many'] # == [u'elements', u'more elements']
    doc['mydocument']['plus']['@a'] # == u'complex'
    doc['mydocument']['plus']['#text'] # == u'element as well'

xmltodict 也有unparse函数让您可以转回XML。该函数有一个streaming模式适合用来
处理不能放入内存的文件，它还支持命名空间。
