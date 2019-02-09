Python最佳实践指南中文版
============================
.. image:: https://opencollective.com/python-guide-cn/backers/badge.svg
    :alt: Backers on Open Collective
    :target: #backers

.. image:: https://opencollective.com/python-guide-cn/sponsors/badge.svg
    :alt: Sponsors on Open Collective
    :target: #sponsors



.. image:: https://farm1.staticflickr.com/628/33173824932_58add34581_k_d.jpg

项目翻译来自 `Hitchhiker's Guide to Python <https://github.com/kennethreitz/python-guide>`_。

Readthedocs文档地址 `Python最佳实践指南中文版 <http://pythonguidecn.readthedocs.org/>`_。

-----------

本指南目前持续不断地更新与完善。这份主要是自我见解的指南旨在为Python初学者和
专家提供一个关于Python安装、配置和日常使用的最佳实践手册。


主题包括:

- 不同平台和系统上的安装
- Py2app, Py2exe, bbfreeze, pyInstaller
- Pip
- Numpy, scipy, statpy, pyplot, matplotlib
- Virtualenv
- Fabric
- 优秀的模块推荐，按主题/目的分类
- 在哪些场景下使用哪些模块
- 服务器配置 & 不同的web框架和工具
- 文档: 写文档
- 测试: Jenkins & tox 指南
- 如何更方便地通过 ``git`` 连接 ``hg``

如果您不习惯阅读reStructuredText形式的文档, 这里有一份同步更新的 `HTML版文档，请戳它 <http://pythonguidecn.readthedocs.org/>`_。


使用指南
============================
1. 下载zip文件或clone到本地，并进入到项目根目录
2. 打开命令行，运行 ``pip install -r requirements.txt`` 安装依赖
3. 打开命令行，运行 ``make html`` ; 或者（针对Windows）运行 ``makehtml.bat``
4. 上述步骤自动在根目录下生成build文件夹，打开 ``./build/html/index.html`` 即可浏览文档

或者
---------------------------
- 直接访问 `Python最佳实践指南中文版 <http://pythonguidecn.readthedocs.org/>`_。


翻译指南
============================
1. 将 `python-guide <https://github.com/kennethreitz/python-guide>`_ 项目和本项目的master分支更新
2. 查看本项目 ``diff.txt`` 中的当前翻译版本对应的原版提交号，在 ``python-guide`` 中比对master分支上最新提交和该提交号的差异，并据此翻译进本项目
3. 翻译完毕后将 ``python-guide`` 中master分支上的最新提交号更新入 ``diff.txt`` 的当前翻译版本对应的原版提交号
4. 在本项目中提交修改、推送，并发起合并请求

Credits
============================

Contributors
------------

This project exists thanks to all the people who contribute! 

.. image:: https://opencollective.com/python-guide-cn/contributors.svg?width=890&button=false

Backers
-------

Thank you to all our backers! `Become a backer`__.

.. image:: https://opencollective.com/python-guide-cn/backers.svg?width=890
    :target: https://opencollective.com/python-guide-cn#backers

__ Backer_

.. _Backer: https://opencollective.com/python-guide-cn#backer

Sponsors
--------

Support us by becoming a sponsor. Your logo will show up here with a link to your website. `Become a sponsor`__.

.. image:: https://opencollective.com/python-guide-cn/sponsor/0/avatar.svg
    :target: https://opencollective.com/python-guide-cn/sponsor/0/website

__ Sponsor_

.. _Sponsor: https://opencollective.com/python-guide-cn#sponsor


