==================
数据序列化
==================

.. image:: https://farm3.staticflickr.com/2927/33467946364_3e59bd376a_k_d.jpg

什么是数据序列化？
---------------------------

数据序列化是将结构化数据转换成允许以共享或存储的格式，可恢复其原始结构的概念。
在某些情况下，数据序列化的第二个目的是将要序列化数据的大小最小化，从而使磁盘空间
或带宽要求最小化。

Pickle
------

Python原生的数据序列化模块称为 `Pickle <https://docs.python.org/2/library/pickle.html>`_ 。

例子如下：

.. code-block:: python
       
        import pickle
        
        #Here's an example dict
        grades = { 'Alice': 89, 'Bob': 72, 'Charles': 87 }
      
        #Use dumps to convert the object to a serialized string
        serial_grades = pickle.dumps( grades )
       
        #Use loads to de-serialize an object 
        received_grades = pickle.loads( serial_grades )

Protobuf
--------

如果您正在寻找支持多种语言的序列化模块，那么Google的 `Protobuf 
<https://developers.google.com/protocol-buffers>`_ 库就是一个选择。
