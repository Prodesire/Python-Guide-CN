.. _publishing-your-code-ref:


####################
发布您的代码
####################

.. todo:: Replace this kitten with the photo we want.

.. image:: https://placekitten.com/800/600

一个健康的开源项目需要一个地方来发布其代码和项目管理的内容，以便其他开发人员可以与您协作。
这可以让您的用户更好地了解您的代码，跟上新的开发进度，报告错误以及贡献代码。

此开发网站应包括源代码历史本身，错误跟踪器，补丁提交（也称为“Pull Request”）队列，以及可能的其他面向开发人员的文档。

有几个免费的开源项目托管站点（又名“forges”），如 GitHub，SourceForge，Bitbucket和GitLab。
GitHub目前是最好的。
使用GitHub吧。


*********************************
在GitHub上创建项目
*********************************

要在GitHub上发布您的Python项目：

1. 如果您还没有GitHub帐户，请创建一个帐户

2. 为您的项目创建一个新的仓库

   1. 单击页面右上角的头像旁边的“+”菜单，然后选择“New repository”

   2. 给项目命名，并给它一个SEO友好的描述

   3. 如果您没有现有项目仓库，请选择设置以添加 README、`.gitignore`和许可证。使用Python的 `.gitignore` 选项

3. 在新创建的项目页面上，单击“Manage topics”并根据实际情况添加“python”和“python3”和/或“python2”标签

4. 在项目的README中包含指向您的新GitHub仓库的链接，以便那些拿到项目分发版本的人知道在哪里找到它

如果这是一个全新的仓库，请将其克隆到本地计算机并开始工作：

.. code-block:: console

    $ git clone https://github.com/<username>/<projectname>

或者，如果您已经有一个项目Git仓库，请将您的新GitHub仓库添加为远程：

.. code-block:: console

    $ cd <projectname>
    $ git remote add origin https://github.com/<username>/<projectname>
    $ git push --tags

**************************
当您的项目增长时
**************************

要了解更多关于管理开源软件项目的内容，请参见
`Producing Open Source Software <https://producingoss.com/>`_ 这本书。
