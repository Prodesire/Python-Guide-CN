
#########
数据库
#########

.. image:: https://farm5.staticflickr.com/4225/33907152464_a99fdcc8de_k_d.jpg


******
DB-API
******

Python数据库API（DB-API）定义了一个Python数据库访问模块的标准接口。它的文档在 :pep:`249` 可以查看。
几乎所有Python数据库模块，诸如 `sqlite3`、 `psycopg` 以及 `mysql-python` 都遵循这个接口。


关于如何与遵守这一接口的模块交互的教程可以在这里找到：
`这里 <http://halfcooked.com/presentations/osdc2006/python_databases.html>`__  以及
`这里 <http://web.archive.org/web/20120815130844/http://www.amk.ca/python/writing/DB-API.html>`__ 。



**********
SQLAlchemy
**********

`SQLAlchemy <http://www.sqlalchemy.org/>`_ 是一个流行的数据库工具。不像很多
数据库库，它不仅提供一个ORM层，而且还有一个通用API来编写避免SQL的数据库无关代码。

.. code-block:: console

    $ pip install sqlalchemy


*******
Records
*******

`Records <https://github.com/kennethreitz/records>`_ 是极简SQL库，旨在将原始SQL查询发送到各种数据库。 
数据可以以编程方式使用，也可以导出到一些有用的数据格式。

.. code-block:: console

    $ pip install records

还包括用于导出SQL数据的命令行工具。


******
PugSQL
******

`PugSQL <https://pugsql.org>`_ 是一个简单的用于组织和使用参数化手写SQL的Python接口，。
它是一个低保真哲学的反ORM，但仍在Python中提供了一个简洁的接口。

.. code-block:: console

    $ pip install pugsql


**********
Django ORM
**********

Django ORM 是 `Django <https://www.djangoproject.com>`_ 用来进行数据库访问的接口。

它的思想建立在 `models <https://docs.djangoproject.com/en/dev/#the-model-layer>`_ ，
之上。这是一个致力于简化Python中数据操作的抽象层。

基础：

- 每个model是django.db.models.Model的子类
- model的每个属性表示数据库的域（field）
- Django给您一个自动生成的数据库访问API，参见
  `Making queries <https://docs.djangoproject.com/en/dev/topics/db/queries/>`__


******
peewee
******

`peewee <http://docs.peewee-orm.com/en/latest/>`_ 是另一个ORM，它致力于轻量级和支持Python2.6+与3.2+默认支持的
SQLite、MySQL以及PostgreSQL。 `model layer <https://peewee.readthedocs.io/en/latest/peewee/quickstart.html#model-definition>`_
与Django ORM类似并且它拥有 `SQL-like methods <https://peewee.readthedocs.io/en/latest/peewee/quickstart.html#retrieving-data>`_
来查询数据。除了将SQLite、MySQL以及PostgreSQL变为开箱即用，还有进一步的扩展功能可以在这里找到：
`collection of add-ons <https://peewee.readthedocs.io/en/latest/peewee/playhouse.html#playhouse>`_。


*******
PonyORM
*******

`PonyORM <http://ponyorm.com/>`_ 是一个ORM，它使用与众不同的方法查询数据库，有别于
使用类似SQL的语言或者布尔表达式，它使用Python的生成器达到目的。而且还有一个图形化
schema编辑器生成PonyORM实体。它支持Python2.6+与3.3+并且可以连接SQLite、MySQL、PostgreSQL与Oracle。


*********
SQLObject
*********

`SQLObject <http://www.sqlobject.org/>`_ 是另一个ORM。它支持广泛的数据库，常见的
MySQL、PostgreSQL以及SQLite与更多的特别系统如SAP DB、SyBase与MSSQL。它只支持Python 2


.. There's no official information on this on their page, this information was gathered by looking at their source code
