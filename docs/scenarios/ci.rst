######################
持续集成
######################

.. image:: https://farm5.staticflickr.com/4173/33907150594_9abba7ad0a_k_d.jpg

.. note::
    关于编写测试更多的建议，参阅 :doc:`/writing/tests`。


************
为什么?
************

Martin Fowler 和 Kent Beck 首次提出 `Continuous Integration <http://martinfowler.com/articles/continuousIntegration.html>`_ 
（简称：CI），将之描述为：

    持续集成是一种软件开发实践：许多团队频繁地集成他们的工作，每位成员通常进行
    日常集成，进而每天会有多种集成。每个集成会由自动的构建（包括测试）来尽可能快地
    检测错误。许多团队发现这种方法可以显著的减少集成问题并且可以使团队的开发更加
    快捷。


*******
Jenkins
*******

`Jenkins CI <http://jenkins-ci.org>`_ 可扩展的持续集成引擎。 使用它吧！


********
Buildbot
********

`Buildbot <http://docs.buildbot.net/current/>`_ 是一个检查代码变化的自动化编译/
测试的Python系统。


***
Tox
***

`Tox <https://tox.readthedocs.io/en/latest/>`_ 是一款为Python软件提供打包、测试和
开发的自动化工具，基于命令行或CI服务器。它是一个通用的虚拟环境管理和测试的命令行
工具，提供如下特性：

* 检查包在不同的Python版本和解释器下安装正确
* 在每个环境中运行您的测试、配置测试工具的选择
* 作为前端持续集成服务器，减少样板文件，合并了CI和基于shell的测试。


*********
Travis-CI
*********

`Travis-CI <https://travis-ci.org/>`_ 是一个分布式CI服务器，免费为开源项目构建测试。
它提供多个worker运行Python测试，并能和GitHub无缝集成。您甚至可以用它对您的Pull Requests
评论是否构建这个特定的变更集。Travis-CI 是一个很好的、简单的方式去了解持续集成。

作为开始，将 :file:`.travis.yml` 文件加入到您的仓库中，内容如下::

    language: python
    python:
      - "2.6"
      - "2.7"
      - "3.2"
      - "3.3"
    # command to install dependencies
    script: python tests/test_all_of_the_units.py
    branches:
      only:
        - master


这将会使您的工程在罗列的Python版本中，用给定的脚本进行测试，而且只会构建主干分支。
有许多可供开启的选项，包括通知、步骤前后等。 `Travis-CI docs <http://about.travis-ci.org/docs/>`_ 
详尽地解释了所有这些操作。

为了激活您的工程的测试，去 `Travis-CI 网站 <https://docs.travis-ci.com/user/languages/python/>`_ 登录您的GitHub
账号。然后在您的profile设置中激活您的工程。现在，每一次push到GitHub上的提交将会运行
您的工程中的测试。