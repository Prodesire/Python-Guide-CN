
#####################
日志（Logging）
#####################

.. image:: https://farm5.staticflickr.com/4246/35254379756_c9fe23f843_k_d.jpg

`日志 <https://docs.python.org/2/library/logging.html#module-logging>`_ 
模块自2.3版本开始便是Python标准库的一部分。它被简洁的描述在 :pep:`282`。
众所周知，除了 `基础日志指南`_ 部分，该文档并不容易阅读。

`loguru <https://github.com/Delgan/loguru>`_ 作为替代方案，
提供了像使用 ``print`` 语句一样简单的日志打印方法。

日志的两个目的：

- **诊断日志**  记录与应用程序操作相关的日志。例如，用户遇到的报错信息，
  可通过搜索诊断日志获得上下文信息。
- **审计日志**  为商业分析而记录的日志。从审计日志中，可提取用户的交易信息，
  并结合其他用户资料构成用户报告或者用来优化商业目标。

**************************
... 或者打印?
**************************

当需要在命令行应用中显示帮助文档时， ``打印`` 是一个相对于日志更好的选择。
而在其他时候，日志总能优于 ``打印`` ，理由如下：

- 日志事件产生的 `日志记录`_ ，包含清晰可用的诊断信息，如文件名称、路径、函数名和行号等。
- 包含日志模块的应用，默认可通过根记录器对应用的日志流进行访问，除非您将日志过滤了。
- 可通过 :meth:`logging.Logger.setLevel` 方法有选择地记录日志，
  或可通过设置 :attr:`logging.Logger.disabled` 属性为 ``True`` 来禁用。


**************************
库中的日志
**************************

`日志指南`_ 中含 `库日志配置`_ 的说明。由于是 *用户* ，而非库来指明如何响应日志事件，
因此这里有一个值得反复说明的忠告：

.. note::
    强烈建议不要向您的库日志中加入除NullHandler外的其它处理程序。

在库中，声明日志的最佳方式是通过 ``__name__`` 全局变量： :mod:`logging` 
模块通过点(dot)运算符创建层级排列的日志，因此，用 ``__name__`` 可以避免名字冲突。

以下是一个来自 `requests 资源`_ 的最佳实践的例子 —— 把它放置在您的 ``__init__.py`` 文件中

.. code-block:: python

    import logging
    logging.getLogger(__name__).addHandler(logging.NullHandler())


**************************
应用程序中的日志
**************************

应用程序开发的权威指南， `应用的12要素 <https://12factor.net>`_ ，也在其中一节描述了 
`日志最佳实践 <https://12factor.net/logs>`_ 。它特别强调将日志视为事件流，
并将其发送至由应用环境所处理的标准输出中。


配置日志至少有以下三种方式：

- 使用INI格式文件：
    - **优点**: 使用 :func:`logging.config.listen` 函数监听socket，可在运行过程中更新配置
    - **缺点**: 通过源码控制日志配置较少（ *例如* 子类化定制的过滤器或记录器）。
- 使用字典或JSON格式文件：
    - **优点**: 除了可在运行时动态更新，在Python 2.6之后，还可通过 :mod:`json` 
      模块从其它文件中导入配置。
    - **缺点**: 很难通过源码控制日志配置。
- 使用源码：
    - **优点**: 对配置绝对的控制。
    - **缺点**: 对配置的更改需要对源码进行修改。


通过INI文件进行配置的例子
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

我们假设文件名为 ``logging_config.ini`` 。关于文件格式的更多细节，请参见 
`日志指南`_ 中的 `日志配置`_ 部分。

.. code-block:: ini

    [loggers]
    keys=root

    [handlers]
    keys=stream_handler

    [formatters]
    keys=formatter

    [logger_root]
    level=DEBUG
    handlers=stream_handler

    [handler_stream_handler]
    class=StreamHandler
    level=DEBUG
    formatter=formatter
    args=(sys.stderr,)

    [formatter_formatter]
    format=%(asctime)s %(name)-12s %(levelname)-8s %(message)s


然后在源码中调用 :meth:`logging.config.fileConfig` 方法：

.. code-block:: python

    import logging
    from logging.config import fileConfig

    fileConfig('logging_config.ini')
    logger = logging.getLogger()
    logger.debug('often makes a very good meal of %s', 'visiting tourists')


通过字典进行配置的例子
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Python 2.7中，您可以使用字典实现详细配置。:pep:`391` 包含了一系列字典配置的强制和
非强制的元素。

.. code-block:: python

    import logging
    from logging.config import dictConfig

    logging_config = dict(
        version = 1,
        formatters = {
            'f': {'format':
                  '%(asctime)s %(name)-12s %(levelname)-8s %(message)s'}
            },
        handlers = {
            'h': {'class': 'logging.StreamHandler',
                  'formatter': 'f',
                  'level': logging.DEBUG}
            },
        root = {
            'handlers': ['h'],
            'level': logging.DEBUG,
            },
    )

    dictConfig(logging_config)

    logger = logging.getLogger()
    logger.debug('often makes a very good meal of %s', 'visiting tourists')


通过源码直接配置的例子
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. code-block:: python

    import logging

    logger = logging.getLogger()
    handler = logging.StreamHandler()
    formatter = logging.Formatter(
            '%(asctime)s %(name)-12s %(levelname)-8s %(message)s')
    handler.setFormatter(formatter)
    logger.addHandler(handler)
    logger.setLevel(logging.DEBUG)

    logger.debug('often makes a very good meal of %s', 'visiting tourists')


.. _基础日志指南: http://docs.python.org/3/howto/logging.html#logging-basic-tutorial
.. _日志配置: https://docs.python.org/3/howto/logging.html#configuring-logging
.. _日志指南: http://docs.python.org/3/howto/logging.html
.. _库日志配置: https://docs.python.org/3/howto/logging.html#configuring-logging-for-a-library
.. _日志记录: https://docs.python.org/3/library/logging.html#logrecord-attributes
.. _requests 资源: https://github.com/kennethreitz/requests
