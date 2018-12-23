
##################
数据序列化
##################

.. image:: /_static/photos/33467946364_3e59bd376a_k_d.jpg


***************************
什么是数据序列化？
***************************

数据序列化是指将结构化数据转换成允许以共享或存储的格式，并能恢复成原始结构。
在某些情况下，数据序列化的第二个目的是减少数据大小，从而减小对磁盘和带宽的要求。

********************
Flat vs. Nested data
********************

在开始序列化数据之前，确定或决定在数据序列化期间如何结构化数据（扁平或嵌套）是非常重要的。
以下示例中显示了两种风格的差异。

扁平风格:

.. code-block:: python

    { "Type" : "A", "field1": "value1", "field2": "value2", "field3": "value3" }


嵌套风格:

.. code-block:: python

    {"A"
        { "field1": "value1", "field2": "value2", "field3": "value3" } }

阅读两种风格的更多内容，请见如下讨论：
`Python mailing list <https://mail.python.org/pipermail/python-list/2010-October/590762.html>`__,
`IETF mailing list <https://www.ietf.org/mail-archive/web/json/current/msg03739.html>`__ and
`in stackexchange <https://softwareengineering.stackexchange.com/questions/350623/flat-or-nested-json-for-hierarchal-data>`__.

****************
序列化文本
****************

=======================
简单文件（扁平数据）
=======================

如果要序列化的数据位于文件中，并包含扁平数据，则Python提供了两种序列化数据的方法。

repr
----

Python 中的 repr 方法接收单个对象参数，返回输入的可打印形式：

.. code-block:: python

    # 扁平文本作为输入
    a =  { "Type" : "A", "field1": "value1", "field2": "value2", "field3": "value3" }

    # 相同的输入可以读取自文件
    a = open('/tmp/file.py', 'r')

    # 返回输入的可打印形式
    # 输出也能够写入文件
    print(repr(a))

    # 使用repr将内容写入文件
    with open('/tmp/file.py') as f:f.write(repr(a))


ast.literal_eval
----------------

literal_eval 方法安全地解析Python数据类型表达式并求值。其支持的数据类型有：字符串、数字、元组、列表、字典、布尔和None。

.. code-block:: python

    with open('/tmp/file.py', 'r') as f: inp = ast.literal_eval(f.read())

====================
CSV 文件 (扁平数据)
====================

Python 中的 CSV 模块实现了读取和写入CSV形式的表格数据的类。

读取的简单例子：

.. code-block:: python

        # 从文件中读取CSV数据
        import csv
        with open('/tmp/file.csv', newline='') as f:
            reader = csv.reader(f)
            for row in reader:
                print(row)

写入的简单例子：

.. code-block:: python

        # 将CSV数据写入文件
        import csv
        with open('/temp/file.csv', 'w', newline='') as f:
            writer = csv.writer(f)
            writer.writerows(iterable)


该模块的内容、函数和例子可以在
`Python 文档中 <https://docs.python.org/3/library/csv.html>`__ 查阅。

==================
YAML (嵌套数据)
==================

Python 中有许多第三方库用来解析和读取/写入 YAML 文件，例子如下：

.. code-block:: python

        # 使用load方法从文件中读取 YAML 内容
        import yaml
        with open('/tmp/file.yaml', 'r', newline='') as f:
            try:
                print(yaml.load(f))
            except yaml.YAMLError as ymlexcp:
                print(ymlexcp)

第三方库的文档可以在
`PyYAML 文档 <https://pyyaml.org/wiki/PyYAMLDocumentation>`__ 中查阅。

=======================
JSON 文件 (嵌套数据)
=======================

Python 的 JSON 模块可以用来读取和写入 JSON 模块。示例如下：

读取：

.. code-block:: python

        # 从文件中读取 JSON 内容
        import json
        with open('/tmp/file.json', 'r') as f:
            data = json.load(f)

写入：

.. code-block:: python

        # 使用 dump 方法将 JSON 内容写入文件
        import json
        with open('/tmp/file.json', 'w') as f:
            json.dump(data, f, sort_keys=True)

=================
XML (嵌套数据)
=================

Python 中 XML 的解析可以使用 `xml` 库。

示例：

.. code-block:: python

        # 从文件中读取 XML 内容
        import xml.etree.ElementTree as ET
        tree = ET.parse('country_data.xml')
        root = tree.getroot()

使用 `xml.dom` 和 `xml.sax` 包的更多文档可以在
`Python XML 库文档 <https://docs.python.org/3/library/xml.html>`__ 中找到。

*******
二进制
*******

=======================
NumPy Array (扁平数据)
=======================

Python 的 NumPy 数组可以将数据序列化成字节形式，或从字节形式的数据反序列化。

示例：

.. code-block:: python

    import NumPy as np

    # 将 NumPy 数组转换为字节形式
    byte_output = np.array([ [1, 2, 3], [4, 5, 6], [7, 8, 9] ]).tobytes()

    # 将字节形式转换回 NumPy 数组
    array_format = np.frombuffer(byte_output)

=======================
Pickle (扁平数据)
=======================

Python原生的数据序列化模块称为 `Pickle <https://docs.python.org/2/library/pickle.html>`_ 。

示例：

.. code-block:: python
       
    import pickle
    
    # 示例字典
    grades = { 'Alice': 89, 'Bob': 72, 'Charles': 87 }
      
    # 使用 dumps 将对象转换为序列化字符串
    serial_grades = pickle.dumps( grades )
       
    # 使用 loads 反序列化为对象
    received_grades = pickle.loads( serial_grades )


********
Protobuf
********

如果您正在寻找支持多种语言的序列化模块，那么Google的 `Protobuf 
<https://developers.google.com/protocol-buffers>`_ 库就是一个选择。
