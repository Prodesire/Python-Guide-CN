阅读好的代码
==================

设计Python的核心理念是创建可读性代码。这种设计的目的非常简单：Python编写者的首要事情是阅读好的代码。

成为优秀Python编写者的秘诀是去阅读，理解和领会好的代码。

良好的代码需要遵循
:ref:`代码风格` 中概述的指南,尽可能向读者表述简洁清楚。


以下是推荐阅读的Python项目。每个项目都是Python代码的典范。

- `Howdoi <https://github.com/gleitz/howdoi>`_
  Howdoi是代码搜寻工具，使用Python编写。

- `Flask <https://github.com/mitsuhiko/flask>`_
  Flask是基于Werkzeug和Jinja2，使用Python的微框架。它能够快速启动，并且开发意图良好。


- `Diamond <https://github.com/python-diamond/Diamond>`_
  Diamond是python的守护进程，它收集指标，并且将他们发布至Graphite或其它后端。
  它能够收集cpu,内存，网络，i/o，负载和硬盘指标。除此，它拥有实现自定义收集器的API，该API几乎能
  从任何资源中获取指标。

- `Werkzeug <https://github.com/mitsuhiko/werkzeug>`_
  Werkzeug起初只是一个WSGI应用多种工具的集成，现在它已经变成非常重要的WSGI实用模型。
  它包括强大的调试器，功能齐全的请求和响应对象，处理entity tags的HTTP工具，缓存控制标头，HTTP数据，cookie处理，文件上传，强大的URL路由系统和一些社区提供的插件模块。

- `Requests <https://github.com/kennethreitz/requests>`_
  Requests是Apache2许可的HTTP库，使用Python编写。

- `Tablib <https://github.com/kennethreitz/tablib>`_
  Tablib是无格式的表格数据集库，使用Python编写。

.. todo:: 内嵌和解释Python代码阅读的YouTube视频：http://www.youtube.com/watch?v=Jc8M9-LoEuo 这可能要求安装插件Sphinx。https://bitbucket.org/birkenfeld/sphinx-contrib/src/a09f29fc16970f34350ca36ac7f229e00b1b1674/youtube?at=default

.. todo:: 包括每个列出项目中典型代码的例子。解释为什么它是非常优秀的代码，举出较复杂的例子。

.. todo:: 解释快速识别数据结构，算法，并确定代码内容的技术。
