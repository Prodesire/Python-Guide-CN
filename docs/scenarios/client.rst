网络应用
====================



HTTP
::::

超文本传输协议(HTTP)是为分布式的、协同的多媒体信息系统而设计的应用协议，是万维网数据传输的基础。

Requests
--------

Python的urllib2标准模块涵盖了所需的大多数HTTP功能，但它的API却是支离破碎的。它构建在一个和现今完全不同的时期——以及为了一个不一样的网络。一个简单的任务便需要耗费它大量的工作(即使重写函数也无济于事)。

Requests将所有Python HTTP相关的功能剥离了出来，并与网络服务无缝衔接。Requests无需再在URL中添加查询语句或格式编码的POST数据。而集成在Requests中urllib3，则实现了持久连接和HTTP连接池的完全自动化。

- `文档 <http://docs.python-requests.org/en/latest/index.html>`_
- `PyPi <http://pypi.python.org/pypi/requests>`_
- `GitHub <https://github.com/kennethreitz/requests>`_


分布式系统
::::::::::::::::::::


ZeroMQ
------

ØMQ(也被称作ZeroMQ, 0MQ 或 ZMQ)是一种高性能异步消息传递库，旨在应用于可扩展分布的或并发的应用。它提供一个消息队列，但与面向消息的中间件不同，ØMQ系统可在不依赖专用消息代理的情况下运行。ØMQ旨在设计成为类似于socket风格的API。

RabbitMQ
--------

RabbitMQ是一种使用了高级消息队列协议(AMQP)的开源消息代理软件。RabbitMQ服务由Erlang编程语言写成，并构建在开放电信平台框架上，应用于集群和故障转移。与该代理交互的客户端库支持所有主流编程语言。

- `主页 <http://www.rabbitmq.com/>`_
- `GitHub组织 <https://github.com/rabbitmq?page=1>`_
