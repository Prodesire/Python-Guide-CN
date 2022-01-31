
#########################
命令行应用
#########################

.. image:: https://farm5.staticflickr.com/4272/34435690330_11930b5987_k_d.jpg

.. note::
    想了解关于编写测试的建议，请查阅 :doc:`/writing/tests`。

命令行应用，也被称为 `控制台应用 <http://en.wikipedia.org/wiki/Console_application>`_
是面向如 `shell <http://en.wikipedia.org/wiki/Shell_(computing)>`_ 之类文本接口的计算机程序。
命令行应用通常接收一些输入作为参数，这些参数（arguments）通常被称为参数（parameters）或子命令
，而选项（options）则被称为flags或switches。


一些流行的命令行应用包括：

* `grep <http://en.wikipedia.org/wiki/grep>`_ - 一个纯文本数据搜索工具
* `curl <http://curl.haxx.se/>`_ - 基于URL语法的数据传输工具
* `httpie <https://github.com/jakubroztocil/httpie>`_ - 一个用户友好的命令行HTTP客户端，可以代替cURL
* `Git <http://git-scm.com/>`_ - 一个分布式版本控制系统
* `Mercurial <https://www.mercurial-scm.org/>`_ - 一个主体是Python的分布式版本控制系统


*****
Click
*****

`click <https://click.palletsprojects.com>`_ 是一个以尽可能少的代码，用组合方式创建命令行接口的Python包。
命令行接口创建工具（“Command-Line Interface Creation Kit”, Click）高度可配置，但也有开箱即用的默认值设置。


******
docopt
******

`docopt <http://docopt.org/>`_ 是一个轻量级，高度Pythonic风格的包，它支持
简单而直觉地创建命令行接口，它是通过解析POSIX-style的用法指示文本实现的。


****
Plac
****

`Plac <https://pypi.org/project/plac>`_ 是对 Python 标准库 
`argparse <http://docs.python.org/2/library/argparse.html>`_ 的简单封装。
它使用声明式接口隐藏其复杂性：参数解析器是被推断出来，而非强制编写。
此模块面向不熟练的用户、程序员、系统管理员、科学家以及只想
写个只一次性脚本的人们。他们选择创建命令行界面，因为它快速而简单。


*****
Cliff
*****

`Cliff <http://docs.openstack.org/developer/cliff/>`_  是一个建立命令行程序的框架。
它使用setuptools入口点（entry points）来提供子命令，输出格式化，以及其他的扩展。这个框架
可以用来创建多层命令程序，如 ``svn`` 和 ``git``，其主程序要进行一些简单的参数解析然后调用
一个子命令干活。


******
Cement
******

`Cement <http://builtoncement.com/>`_ 是一个高级的CLI应用程序框架。
其目标是为简单和复杂的命令行应用程序引入标准和功能完整的平台，并支持快速开发需求，而不会牺牲质量。
Cement是灵活的，它的用例范围涵盖了从微框架的简单到巨型框架的复杂。


***********
Python Fire
***********

`Python Fire <https://github.com/google/python-fire/>`_ 是一个能根据任意 Python 对象自动生成出命令行接口的库。它能帮助您更轻松地通过命令行调试 Python 代码，根据现有代码创建命令行接口，还能让您以在 REPL 中交互式地浏览 Python 对象，并简化 Python 和 Bash（或任何其他 Shell）之间的转换。
