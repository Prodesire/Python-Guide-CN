虚拟环境
====================

虚拟环境是一个将不同项目所需求的依赖分别放在独立的地方的一个工具，它给这些工程创建虚拟的
Python环境。它解决了“项目X依赖于版本1.x，而项目Y需要项目4.x”的两难问题，而且使你的全局
site-packages目录保持干净和可管理。

比如，你可以工作在一个需求Django 1.10的工程，同时维护一个需求Django 1.8的工程。

virtualenv
----------

`virtualenv <http://pypi.python.org/pypi/virtualenv>`_ 是一个创建隔绝的Python环境的
工具。virtualenv创建一个包含所有必要的可执行文件的文件夹，用来使用Python工程所需的包。

通过pip安装virtualenv：

.. code-block:: console

  $ pip install virtualenv

测试你的安装

.. code-block:: console

   $ virtualenv --version

基本使用
~~~~~~~~~~~

1. 为一个工程创建一个虚拟环境：

.. code-block:: console

   $ cd my_project_folder
   $ virtualenv my_project

``virtualenv my_project`` 将会在当前的目录中创建一个文件夹，包含了Python可执行文件，
以及 ``pip`` 库的一份拷贝，这样就能安装其他包了。虚拟环境的名字（此例中是 ``my_project`` ）
可以是任意的；若省略名字将会把文件均放在当前目录。

在任何你运行命令的目录中，这会创建Python的拷贝，并将之放在叫做 :file:`my_project` 
的文件中。

你可以选择使用一个Python解释器（比如``python2.7``）：

.. code-block:: console

   $ virtualenv -p /usr/bin/python2.7 my_project

或者使用``~/.bashrc``的一个环境变量将解释器改为全局性的：

.. code-block:: console

   $ export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python2.7


2. 要开始使用虚拟环境，其需要被激活：

.. code-block:: console

   $ source my_project/bin/activate

当前虚拟环境的名字会显示在提示符左侧（比如说 ``(my_project)你的电脑:你的工程 用户名$）
以让你知道它是激活的。从现在起，任何你使用pip安装的包将会放在 ``my_project`` 文件夹中，
与全局安装的Python隔绝开。

像平常一样安装包，比如：

.. code-block:: console

    $ pip install requests

3. 如果你在虚拟环境中暂时完成了工作，则可以停用它：

.. code-block:: console

   $ deactivate

这将会回到系统默认的Python解释器，包括已安装的库也会回到默认的。

要删除一个虚拟环境，只需删除它的文件夹。（要这么做请执行  ``rm -rf my_project`` ）

然后一段时间后，你可能会有很多个虚拟环境散落在系统各处，你将有可能忘记它们的名字或者位置。

其他注意
~~~~~~~~~~~

运行带 ``--no-site-packages`` 选项的 ``virtualenv`` 将不会包括全局安装的包。
这可用于保持包列表干净，以防以后需要访问它。（这在 ``virtualenv`` 1.7及之后是默认行为）

为了保持你的环境的一致性，“冷冻住（freeze）”环境包当前的状态是个好主意。要这么做，请运行：

.. code-block:: console

    $ pip freeze > requirements.txt

这将会创建一个 :file:`requirements.txt` 文件，其中包含了当前环境中所有包及
各自的版本的简单列表。你可以使用 “pip list”在不产生requirements文件的情况下，
查看已安装包的列表。这将会使另一个不同的开发者（或者是你，如果你需要重新创建这样的环境）
在以后安装相同版本的相同包变得容易。

.. code-block:: console

    $ pip install -r requirements.txt

这能帮助确保安装、部署和开发者之间的一致性。

最后，记住在源码版本控制中排除掉虚拟环境文件夹，可在ignore的列表中加上它。

.. _virtualenvwrapper-ref:

virtualenvwrapper
-----------------

`virtualenvwrapper <https://virtualenvwrapper.readthedocs.io/en/latest/index.html>`_ 
提供了一系列命令使得和虚拟环境工作变得愉快许多。它把你所有的虚拟环境都放在一个地方。

安装（确保 **virtualenv** 已经安装了）：

.. code-block:: console

  $ pip install virtualenvwrapper
  $ export WORKON_HOME=~/Envs
  $ source /usr/local/bin/virtualenvwrapper.sh

(`virtualenvwrapper 的完整安装指引 <https://virtualenvwrapper.readthedocs.io/en/latest/install.html>`_.)

对于Windows，你可以使用 `virtualenvwrapper-win <https://github.com/davidmarble/virtualenvwrapper-win/>`_ 。

安装（确保 **virtualenv** 已经安装了）：

.. code-block:: console

  $ pip install virtualenvwrapper-win

在Windows中，WORKON_HOME默认的路径是 %USERPROFILE%\Envs 。

基本使用
~~~~~~~~~~~

1. 创建一个虚拟环境：

.. code-block:: console

   $ mkvirtualenv my_project

这会在 :file:`~/Envs` 中创建 :file:`my_project` 文件夹。

2. 在虚拟环境上工作：

.. code-block:: console

   $ workon my_project

或者，你可以创建一个项目，它会创建虚拟环境，并在 ``$PROJECT_HOME`` 中创建一个项目目录。
当你使用 ``workon myproject`` 时，会 ``cd`` -ed 到项目目录中。

.. code-block:: console

   $ mkproject myproject

**virtualenvwrapper** 提供环境名字的tab补全功能。当你有很多环境，
并且很难记住它们的名字时，这就显得很有用。

``workon`` 也能停止你当前所在的环境，所以你可以在环境之间快速的切换。

3. 停止是一样的：

.. code-block:: console

   $ deactivate

4. 删除：

.. code-block:: console

   $ rmvirtualenv my_project

其他有用的命令
~~~~~~~~~~~~~~~~~~~~~

``lsvirtualenv``
  列举所有的环境。

``cdvirtualenv``
  导航到当前激活的虚拟环境的目录中，比如说这样你就能够浏览它的 :file:`site-packages` 。

``cdsitepackages``
  和上面的类似，但是是直接进入到 :file:`site-packages` 目录中。

``lssitepackages``
  显示 :file:`site-packages` 目录中的内容。

`virtualenvwrapper 命令的完全列表 <https://virtualenvwrapper.readthedocs.io/en/latest/command_ref.html>`_ 。

virtualenv-burrito
------------------

有了 `virtualenv-burrito <https://github.com/brainsik/virtualenv-burrito>`_ ，
你就能使用单行命令拥有virtualenv + virtualenvwrapper的环境。

autoenv
-------
当你 ``cd`` 进入一个包含 :file:`.env` 的目录中，就会 `autoenv <https://github.com/kennethreitz/autoenv>`_ 
自动激活那个环境。

使用 ``brew`` 在Mac OS X上安装它：

.. code-block:: console

   $ brew install autoenv

在Linux上:

.. code-block:: console

   $ git clone git://github.com/kennethreitz/autoenv.git ~/.autoenv
   $ echo 'source ~/.autoenv/activate.sh' >> ~/.bashrc
