
#############################
Web 应用 & 框架
#############################

.. image:: /_static/photos/34309496175_b82d104282_k_d.jpg

Python作为一门强大的脚本语言，能够适应快速原型和较大项目的制作，
它被广泛用于web应用程序的开发中。


*******
Context
*******

WSGI
----

Web服务网关接口（Web Server Gateway Interface，简称“WSGI”）是一种在Web服务器
和Python Web应用程序或框架之间的标准接口。通过标准化Web服务器和Python web应用程序
或框架之间的行为和通信，WSGI使得编写可移植的的Python web代码变为可能，使其能够部署在任何 
:ref:` 符合WSGI的web服务器 <wsgi-servers-ref>` 上。WSGI记录在 :pep:`3333`。


*******
框架
*******

广义地说，Web框架包含一系列库和一个主要的处理器（handler），这样您就能够构建自己的代码来实现Web应用
（比如说一个交互式的网站）。大多数web框架包含模式和工具，至少实现以下功能：

URL路由（URL Routing）
  将输入的HTTP请求匹配到特定的Python代码用来调用

请求和响应对象（Request and Response Objects）
  封装来自或发送给用户浏览器的信息

模板引擎（Template Engine）
  能够将实现应用的Python代码逻辑和其要产生输出的HTML（或其他）分离开

Web服务器开发（Development Web Server）
  在开发机上运行HTTP服务器，从而快速开发；当文件更新时自动更新服务端代码。


Django
------

`Django <https://www.djangoproject.com>`_ 是一个功能齐备的web应用框架。它是创建面向内容网站的极佳选择。
通过提供众多工具和模式，Django使得快速构建复杂的、有数据库支持的web应用成为可能，
同时鼓励使用它作为编写代码的最佳实践。

Django拥有非常庞大和活跃的社区。此外，许多预构建的 `可重用模块 <https://djangopackages.com/>`_ 
可以原样合并到新工程中，或者定制成符合需求的样子。

在 `美国 <https://djangocon.us>`_ 、 `欧洲 <https://djangocon.eu>`_ 和 
`Australia <https://djangocon.com.au>`_ 均有每年度的Django会议。

如今大部分新的Python web应用都是用Django构建的。


Flask
-----

`Flask <http://flask.pocoo.org/>`_ 是一款针对Python的“微型框架”，它是构建更小应用、API和web服务的极佳选择。
使用Flask构建应用，除了一些函数附上路由，它和写标准Python模块很相似。它真的很赞。

Flask不会提供一切您可能需要的内容，而是实现了web应用框架中最常用的核心组件，比如说URL路由、请求和响应对象和模板等。

作为Flask的用户，由您来决定选择和集成其他您可能用到的组件。比如说数据库访问或者表单生成和验证就不是Flask内置的功能。

这挺好的，因为很多web应用并不需要这些特性。
对于那些需要的，有许多可用的 `扩展 <http://flask.pocoo.org/extensions/>`_ 或许符合您的需求。

Flask是任何不适用Django的Python web应用的默认选择。


Falcon
------

当您的目标是构建快速、可扩展的REST风格API微服务时， `Falcon <https://falconframework.org/>`_ 是个不错的选择。

这是一个可靠的、高性能的Python Web框架，用于构建大规模应用后端和微服务。Falcon鼓励REST架构风格的
URI到资源的映射，以花费尽可能少的精力同时又保持高效。

Falcon重点关注四个方面：速度、可靠性、灵活性和可调试性。它通过"响应者（responder）"
（诸如 ``on_get()``、 ``on_put()`` 等）来实现HTTP。这些响应者接收直接的请求，以及响应对象。


Tornado
-------
`Tornado <http://www.tornadoweb.org/>`_ 是一个面向Python的异步web框架，它有自己的事件。
这就使得它，举个例子，可以原生地支持WebSockets。编写良好的Tornado应用具有卓越的性能特性。

除非您认为自己需要它，我并不建议您使用Tornado。


Pyramid
-------

`Pyramid <https://trypyramid.com/>`_ 是一个非常灵活的框架，重点关注模块化。 它内置少量库（“电池”），
并鼓励用户扩展其基本功能。它提供一组cookiecutter模板，帮助用户生成新项目。Pyramid驱动了Python基础架构中
最重要部分之一—— `PyPI <https://pypi.org/>`_。

Pyramid不像Django和Flask，并没有庞大的用户基数。它一个有能力的框架，但如今新Python web 应用程序
并没有十分青睐它。

Masonite
--------

`Masonite <https://docs.masoniteproject.com>`_ 是一个现代的，以开发人员为中心的“功能齐备”的网络框架。

Masonite 框架遵循 MVC（Model-View-Controller，模型-视图-控制器）架构模式，受到 Rails 和 Laravel 等框架的极大启发，
因此如果您是从 Ruby 或 PHP 背景来到 Python，那么您将感到宾至如归！

Masonite 提供了许多开箱即用的功能，包括一个功能强大的具有自动解析依赖注入IOC容器、craft 命令行工具和 Active Record 模式的 Orator ORM。

Masonite 非常适合初学者或经验丰富的开发人员。从安装到部署都相当快速和容易。只需尝试一次，你就会爱上它。

FastAPI
-------

`FastAPI <https://fastapi.tiangolo.com>`_ 是一个使用 Python 3.6+ 版本来构建API的现代化 Web 框架。

由于它是基于 `Starlette <https://www.starlette.io>`_ 和 `Pydantic <https://pydantic-docs.helpmanual.io>`_，
具有非常高的性能。

FastAPI 利用函数参数中标准的 Python 类型声明来声明请求参数和实体、执行数据转换（序列化、分析）、数据验证，
以及使用 ** OpenAPI 3 **（包括 ** JSON Schema **）自动生成 API 文档。

它包括用于安全性和身份验证的工具和实用程序（包括带有JWT令牌的OAuth2）、依赖注入系统、交互式 API 文档生成器以及其他功能。


***********
Web 服务端
***********

.. _nginx-ref:

Nginx
-----

`Nginx <http://nginx.org/>`_ （发音为 "engine-x"）是一个web服务器，并是HTTP、SMTP和其他协议的反向代理。
它由其高性能、相对简洁以及对众多应用服务器（比如WSGI服务器）兼容而著名。它也拥有便利的特性，
比如负载均衡、基本的认证、流等。Nginx被设计为承载高负载的网站，并逐渐变得广为流行。


.. _wsgi-servers-ref:


************
WSGI 服务器
************

独立WSGI服务器相比传统web服务器，使用更少的资源，并提供最高的性能 [1]_。

.. _gunicorn-ref:

Gunicorn
--------

`Gunicorn <https://gunicorn.org/>`_ （Green Unicorn，绿色独角兽）是一个纯Python WSGI服务器，
用来支持Python应用。不像其他Python web服务器，它有周全的用户界面，十分易于使用和配置。

Gunicorn具有合理的默认配置。 然而，其他一些像uWSGI这样的服务器相较而言过于可定制化，因此更加难以高效使用。

Gunicorn是如今新Python web应用程序的推荐选择。


Waitress
--------

`Waitress <https://waitress.readthedocs.io>`_ 是一个纯Python WSGI服务器，声称具备“非常可接受的性能”。
它的文档不是很详细，但它确实提供了一些很好的而Gunicorn没有的功能（例如HTTP请求缓冲）。

Waitress在Python Web开发社区中越来越受欢迎。

.. _uwsgi-ref:

uWSGI
-----

`uWSGI <https://uwsgi-docs.readthedocs.io>`_ 用来构建全栈式的主机服务。除了进程管理、进程监控和其他功能外，
uWSGI也能作为一个应用服务器，适用于多种编程语言和协议 - 包括Python和WSIG。
uWSGI既能当作独立的web路由器来运行，也能运行在一个完整web服务器（比如Nginx或Apache）之后。
对于后者，web服务器可以基于 `uwsgi 协议 <https://uwsgi-docs.readthedocs.io/en/latest/Protocol.html>`_ 
配置uWSGI和应用的操作。uWSGI的web服务器支持允许动态配置Python、传递环境变量以及进一步优化。
要看更多细节，请看 `uWSGI 魔法变量 <https://uwsgi-docs.readthedocs.io/en/latest/Vars.html>`_。

除非您认为自己需要它，我并不建议您使用uWSGI。

.. _server-best-practices-ref:


*********************
服务端最佳实践
*********************

如今，自承载Python应用的主体托管于WSGI服务器（比如说 :ref:`Gunicorn <gunicorn-ref>`）
或是直接或间接在轻量级web服务器（比如说 :ref:`nginx <nginx-ref>`）之后。

WSGI服务器为Python应用服务，它能更好的处理诸如静态文件服务、请求路由、DDoS保护和基本认证的任务。

*******
Hosting
*******

平台即服务（Platform-as-a-Service，PaaS）是一种云计算基础设施类型，抽象和管理基础设施、路由和网络应用的扩展。
使用PaaS时，应用开发者只需关注编写应用代码，而无须关心配置细节。

Heroku
------

`Heroku <https://www.heroku.com/python>`_ 为Python 2.7-3.5 应用程序提供一流的支持。

Heroku 支持所有类型的Python web应用、服务器和框架。在Heroku上可以免费开发应用程序。
 一旦您的应用程序准备好面向生产环境，您可以升级到Hobby或专业应用。

Heroku 维护了使用Python和Heroku交互的 `详细文章 <https://devcenter.heroku.com/categories/python-support>`_，
同时也有 `手把手指导 <https://devcenter.heroku.com/articles/getting-started-with-python>`_ 
来告诉您如何建立第一个应用。

Heroku是如今部署Python Web应用程序的推荐PaaS。


**********
模板
**********

多数WSGI应用响应HTTP请求，从而服务于HTML或其他标记语言中的内容。关注点分离的概念建议我们使用模板，
而不是直接由Python生成文本内容。模板引擎管理一系列的模板文件，其系统的层次性和包容性避免了不必要的重复。
模板引擎负责渲染（产生）实际内容，用由应用生成的动态内容填充静态内容。

由于模板文件有时是由设计师或者前端开发者编写，处理不断增长的复杂度会变得困难。

一些通用的良好实践应用到了部分应用中，情景包括传递动态内容到模板引擎和模板自身中。

- 模板文件只应传递需要渲染的动态内容。避免传递附加的“以防万一”的内容：
  需要时添加遗漏的变量比移除可能不用的变量要来的容易。

- 许多模板引擎允许在模板中编写复杂语句或者赋值，也有许多允许一些Python代码
  在模板中等价编写。这种便利会导致复杂度不可控地增加，也使得查找bug变得更加
  困难。

- 我们常常需要混合JavaScript模板和HTML模板。一种聪明的做法是孤立出HTML
  模板传递部分变量内容到JavaScript代码中的部分。



Jinja2
------
`Jinja2 <http://jinja.pocoo.org/>`_ 是一个很受欢迎的模板引擎。

它使用基于文本的模板语言，因此可以用于生成任何类型的标记，而不仅仅是HTML。 
它允许自定义过滤器，标签，测试和全局变量。 它具有Django模板系统的许多改进。

这里有一些在Jinja2中重要的HTML标签：

.. code-block:: html

    {# 这是注释 #}

    {# 下一个标签是输出变量： #}
    {{title}}

    {# 区块标签，能通过继承其他html代码来替换区块内容 #}
    {% block head %}
    <h1>This is the head!</h1>
    {% endblock %}

    {# 数组迭代输出 #}
    {% for item in list %}
    <li>{{ item }}</li>
    {% endfor %}


下面列举的内容是一个使用Tornado的站点的例子。Tornado用起来并没那么复杂。

.. code-block:: python

    # 导入 Jinja2
    from jinja2 import Environment, FileSystemLoader

    # 导入 Tornado
    import tornado.ioloop
    import tornado.web

    # 载入模板文件 templates/site.html
    TEMPLATE_FILE = "site.html"
    templateLoader = FileSystemLoader( searchpath="templates/" )
    templateEnv = Environment( loader=templateLoader )
    template = templateEnv.get_template(TEMPLATE_FILE)

    # 包含著名电影的list
    movie_list = [[1,"The Hitchhiker's Guide to the Galaxy"],[2,"Back to future"],[3,"Matrix"]]

    # template.render() 返回包含渲染后html的字符串
    html_output = template.render(list=movie_list,
                            title="Here is my favorite movie list")

    # 主页的handler
    class MainHandler(tornado.web.RequestHandler):
        def get(self):
            # Returns rendered template string to the browser request
            self.write(html_output)

    # 将handler赋给服务器root (127.0.0.1:PORT/)
    application = tornado.web.Application([
        (r"/", MainHandler),
    ])
    PORT=8884
    if __name__ == "__main__":
        # Setup the server
        application.listen(PORT)
        tornado.ioloop.IOLoop.instance().start()

:file:`base.html` 文件能够作为所有站点页面的基础，下面是实现的例子。

.. code-block:: html

    <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN">
    <html lang="en">
    <html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <link rel="stylesheet" href="style.css" />
        <title>{{title}} - My Webpage</title>
    </head>
    <body>
    <div id="content">
        {# 下一行内容将会在site.html模板中被添加。 #}
        {% block content %}{% endblock %}
    </div>
    <div id="footer">
        {% block footer %}
        &copy; Copyright 2013 by <a href="http://domain.invalid/">you</a>.
        {% endblock %}
    </div>
    </body>


接下来是我们的site页面（:file:`site.html`），它由Python app载入，并扩展了 :file:`base.html`。
下面的内容区块会自动填充到 :file:`base.html` 页面的相关区块中。

.. code-block:: html

    {% extends "base.html" %}
    {% block content %}
        <p class="important">
        <div id="content">
            <h2>{{title}}</h2>
            <p>{{ list_title }}</p>
            <ul>
                 {% for item in list %}
                 <li>{{ item[0]}} :  {{ item[1]}}</li>
                 {% endfor %}
            </ul>
        </div>
        </p>
    {% endblock %}


Jinja2是新Python Web应用程序的推荐模板库。

Chameleon
---------
`Chameleon <https://chameleon.readthedocs.io/>`_ 页面模板是使用 
`模板属性语言（Template Attribute Language, TAL） <https://en.wikipedia.org/wiki/Template_Attribute_Language>`_、 
`TAL表达语法（TAL Expression Syntax,TALES） <https://chameleon.readthedocs.io/en/latest/reference.html#expressions-tales>`_ 和 
`宏扩展TAL（Macro Expansion TAL, Metal） <https://chameleon.readthedocs.io/en/latest/reference.html#macros-metal>`_ 
语法的HTML/XML模板引擎实现。

Chameleon在Python2.5及以上版本（包括3.x和PyPy）都是可用的，并常被 `Pyramid Framework <https://trypyramid.com>`_ 使用。

页面模板是在文档结构中添加特定元素属性和文本标记。使用一系列简单语言概念，您能够控制文档流程、元素重复、文本替换和翻译。
由于使用了基于属性的语法，未渲染的页面模板是合法的HTML，它可以在浏览器中查看，甚至能够在WYSIWYG编辑器中编辑。
这使得设计者和原型构建者之间在浏览器是中静态文件上的往复合作变得更加简单。

从下面的例子中能很快学到基本的TAL语言的用法：

.. code-block:: html

  <html>
    <body>
    <h1>Hello, <span tal:replace="context.name">World</span>!</h1>
      <table>
        <tr tal:repeat="row 'apple', 'banana', 'pineapple'">
          <td tal:repeat="col 'juice', 'muffin', 'pie'">
             <span tal:replace="row.capitalize()" /> <span tal:replace="col" />
          </td>
        </tr>
      </table>
    </body>
  </html>
  

用作文本插入的 `<span tal:replace="expression" />` 形式非常常见。如果在未渲染的模板中并不要求严格的合法性，
您可以取而代之地使用更加简洁和可读的语法，它使用 `${expression}` 的形式，就像下面这样：

.. code-block:: html

  <html>
    <body>
      <h1>Hello, ${world}!</h1>
      <table>
        <tr tal:repeat="row 'apple', 'banana', 'pineapple'">
          <td tal:repeat="col 'juice', 'muffin', 'pie'">
             ${row.capitalize()} ${col}
          </td>
        </tr>
      </table>
    </body>
  </html>
  

但是请记住，全部的 `<span tal:replace="expression">Default Text</span>` 
语法也允许在未渲染的模板中有默认内容。

在来自Pyramid的世界中，Chameleon不被广泛使用。

Mako
----

`Mako <http://www.makotemplates.org/>`_ 是一种模板语言，为了最大的性能，它编译为了Python。
它的语法和API借鉴了其他模板语言，如Django和Jinja2中最好的部分。它
是包括 `Pylons 和 Pyramid <http://www.pylonsproject.org/>`_ 在内的web框架所使用的默认模板语言。

Mako的一个模板例子如下：

.. code-block:: mako

    <%inherit file="base.html"/>
    <%
        rows = [[v for v in range(0,10)] for row in range(0,10)]
    %>
    <table>
        % for row in rows:
            ${makerow(row)}
        % endfor
    </table>

    <%def name="makerow(row)">
        <tr>
        % for name in row:
            <td>${name}</td>\
        % endfor
        </tr>
    </%def>

要渲染一个非常基本的模板，您可以像下面这么做：

.. code-block:: python

    from mako.template import Template
    print(Template("hello ${data}!").render(data="world"))

Mako在Python web社区中受到重视。

.. rubric:: References

.. [1] `mod_python 项目现在正式终结 <http://blog.dscpl.com.au/2010/06/modpython-project-is-now-officially.html>`_
.. [2] `mod_wsgi vs mod_python <http://modpython.org/pipermail/mod_python/2007-July/024080.html>`_
.. [3] `Python WSGI 服务器基准测试 <http://nichol.as/benchmark-of-python-web-servers>`_
