
####
JSON
####

.. image:: https://farm5.staticflickr.com/4174/33928819683_97b5c6a184_k_d.jpg

`json <https://docs.python.org/3/library/json.html>`_ 库可以自字符串或文件中解析JSON。
该库解析JSON后将其转为Python字典或者列表。它也可以转换Python字典或列表为JSON字符串。


************
解析JSON
************

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

您可以把下面这个对象转为JSON：

.. code-block:: python

    d = {
        'first_name': 'Guido',
        'second_name': 'Rossum',
        'titles': ['BDFL', 'Developer'],
    }

    print(json.dumps(d))
    '{"first_name": "Guido", "last_name": "Rossum", "titles": ["BDFL", "Developer"]}'
