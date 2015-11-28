JSON
====

`json <https://docs.python.org/2/library/json.html>`_ 库可以自字符串或文件中解析JSON。
该库解析JSON后将其转为Python字典或者列表。它也可以转换Python字典或列表为JSON字符串。

解析JSON
------------

创建下面包含JSON数据的字符串

.. code-block:: python

    json_string = '{"first_name": "Guido", "last_name":"Rossum"}'

它可以被这样解析：

.. code-block:: python

    import json
    parsed_json = json.loads(json_string)

然后它可以像一个常规的字典那样使用:

.. code-block:: python

    print(parsed_json['first_name'])
    "Guido"

你可以把下面这个对象转为JSON：

.. code-block:: python

    d = {
        'first_name': 'Guido',
        'second_name': 'Rossum',
        'titles': ['BDFL', 'Developer'],
    }

    print(json.dumps(d))
    '{"first_name": "Guido", "last_name": "Rossum", "titles": ["BDFL", "Developer"]}'


simplejson
----------

JSON库是Python2.6版中加入的。如果你使用更早版本的Python，
可以通过PyPI获取 `simplejson <https://simplejson.readthedocs.org/en/latest/>`_ 库。

simplejson类似json标准库，它使得使用老版本Python的开发者们可以使用json库中的最新特性。

如果json库不可用，你可以将simplejson取别名为json来使用：

.. code-block:: python
    
    import simplejson as json

在将simplejson当成json导入后，上面的例子会像你在使用标准json库一样正常运行。