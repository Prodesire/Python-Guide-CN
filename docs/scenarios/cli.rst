命令行应用
=========================

.. image:: https://farm5.staticflickr.com/4272/34435690330_11930b5987_k_d.jpg

.. note::
    想了解关于编写测试的建议，请查阅 :doc:`/writing/tests`。

命令行应用，也被称为 `控制台应用 <http://en.wikipedia.org/wiki/Console_application>`_
是面向如 `shell <http://en.wikipedia.org/wiki/Shell_(computing)>`_ 之类文本接口的计算机程序。
命令行应用通常接收一些输入作为参数，这些参数（arguments）通常被称为参数（parameters）或子命令
，而选项（options）则被称为flags或switches。


一些流行的命令行应用包括：

* `Grep <http://en.wikipedia.org/wiki/Grep>`_ - 一个纯文本数据搜索工具
* `curl <http://curl.haxx.se/>`_ - 基于URL语法的数据传输工具
* `httpie <https://github.com/jakubroztocil/httpie>`_ - 一个用户友好的命令行HTTP客户端，可以代替cURL
* `git <http://git-scm.com/>`_ - 一个分布式版本控制系统
* `mercurial <https://www.mercurial-scm.org/>`_ - 一个主体是Python的分布式版本控制系统

Clint
-----

`clint <https://pypi.python.org/pypi/clint/>`_ 是一个Python模块，它包含了很多
对命令行应用开发有用的工具。它支持诸如CLI着色以及缩进，简洁而强大的列打印，
基于进度条的迭代以及参数控制的特性。

Click
-----

`click <http://click.pocoo.org/>`_ 是一个以尽可能少的代码，用组合方式创建命令行接口的Python包。
命令行接口创建工具（“Command-line Interface Creation Kit”, Click）高度可配置，但也有开箱即用的默认值设置。

docopt
------

`docopt <http://docopt.org/>`_ 是一个轻量级，高度Pythonic风格的包，它支持
简单而直觉地创建命令行接口，它是通过解析POSIX-style的用法指示文本实现的。

Plac
------

`Plac <https://pypi.python.org/pypi/plac>`_ Python标准库 
`argparse <http://docs.python.org/2/library/argparse.html>`_ 的简单封装，
它隐藏了大量声明接口的细节：参数解析器是被推断的，其优于写命令明确处理。
这个模块的面向是不想太复杂的用户，程序员，系统管理员，科学家以及只是想
写个只运行一次的脚本的人们，使用这个命令行接口的理由是它可以快速实现并且简单。

Cliff
------

`Cliff <http://docs.openstack.org/developer/cliff/>`_  是一个建立命令行程序的框架。
它使用setuptools入口点（entry points）来提供子命令，输出格式化，以及其他的扩展。这个框架
可以用来创建多层命令程序，如subversion与git，其主程序要进行一些简单的参数解析然后调用
一个子命令干活。

Cement
------

`Cement <http://builtoncement.com/>`_ 是一个高级的CLI应用程序框架。
其目标是为简单和复杂的命令行应用程序引入标准和功能完整的平台，并支持快速开发需求，而不会牺牲质量。
Cement是灵活的，它的用例范围涵盖了从微框架的简单到巨型框架的复杂。