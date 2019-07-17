.. _packaging-your-code-ref:


###################
打包您的代码
###################

.. image:: https://farm5.staticflickr.com/4325/36137234682_be6898bf57_k_d.jpg

打包就是把您的代码分享给其他开发者。例如，共享一个库给其他开发者用在
他们的应用中，或者作为一个开发工具，比如 'py.test'。

这种分发方式的一个优势是它拥有既已建成的良好的工具生态，如PyPI与pip，其使得其他
开发者很容易下载与安装您的包，而无论是一个即兴实验还是作为一个巨型软件系统的一部分。

使用这种方式共享Python代码是既已存在的传统，如果您的代码没打包到PyPI上，则它将难以
被其他开发者找到并用在它们的程序中。事实上他们会怀疑这种项目是否管理不善或者已被放弃了。

像这样分发代码的消极一面是它依赖使用者理解如何安装所要求的Python版本以及会并且希望
使用pip这样的工具安装您的代码及其他依赖项。虽然对于其它的开发者来说这是没问题的，但
对于最终用户这并不友好。

`Python打包指南 <https://python-packaging-user-guide.readthedocs.io/>`_ 
提供了更多关于如何创建以及维护Python包的知识。


*************************
打包的多种方式
*************************

为了分发应用给最终用户，您应该
:ref:`冻结您的应用 <freezing-your-code-ref>`。

在Linux，您可能想会考虑
:ref:`创建一个Linux分发包 <packaging-for-linux-distributions-ref>`
(例 对于Debian或Ubuntu是一个 .deb文件)


*********************
对于Python开发者
*********************

如果您编写了一个开源的Python模块， `PyPI <http://pypi.org>`_
(更准确的叫法是 *The Cheeseshop*)是一个放它的地方。

Pip vs. easy_install
--------------------


使用 `pip <http://pypi.org/project/pip>`_. 更多细节参见
`here <https://stackoverflow.com/questions/3220404/why-use-pip-over-easy-install>`_


私人的PyPI
-------------

如果您想要从有别于PyPI的其他源安装包（也就是说，如果您的包是 *专门* （proprietary）的），
您可以通过为自己开启一个服务器来建立一个这样的源，这个服务器应该开在您想共享的包所在位置
的文件夹下。

**例子总是有益的**

作为例子，如果您想要共享一个叫做 :file:`MyPackage.tar.gz` 的包，并且假设您的文件
结构是这样的：

- archive
   - MyPackage
       - MyPackage.tar.gz


打开您的命令行并且输入：

.. code-block:: console

   $ cd archive
   $ python -m http.server 9000


这运行了一个简单的HTTP服务器，其监听端口9000并且将列出所有包（比如 **MyPackage**）。现在
您可以使用任何Python包安装器从您的服务器中安装 **MyPackage** 。若使用Pip,您可以这样做：

.. code-block:: console

   $ pip install --extra-index-url=http://127.0.0.1:9000/ MyPackage

您的文件夹名字与您的包名相同是 **必须** 的。我曾经被这个坑过一次。但是如果您觉得
创建一个叫做 :file:`MyPackage` 的文件夹然后里面又有一个 :file:`MyPackage.tar.gz` 文件
是 *多余* 的，您可以这样共享 MyPackage:



.. code-block:: console

   $ pip install  http://127.0.0.1:9000/MyPackage.tar.gz

pypiserver
++++++++++

`Pypiserver <https://pypi.org/project/pypiserver>`_ 是一个精简的PyPI兼容服务器。
它可以被用来让一系列包通过easy_install与pip进行共享。它包含一些有益的命令，诸如管理
命令（ ``-U`` ），其可以自动更新所有它的包到PyPI上的最新版。


S3-Hosted PyPI
++++++++++++++


一个简单的个人PyPI服务器实现选项是使用Amazon S3。使用它的一个前置要求是您有一个
Amazon AWS账号并且有 S3 bucket。

1. **安装所有您需要的东西从PyPI或者其他源**

2. **安装 pip2pi**

* :code:`pip install git+https://github.com/wolever/pip2pi.git`

3. **跟着 pip2pi 的README文件使用pip2tgz 与 dir2pi命令**

* :code:`pip2tgz packages/ YourPackage` (or :code:`pip2tgz packages/ -r requirements.txt`)
* :code:`dir2pi packages/`


4. **上传新文件**
* 使用像Cyberduck这些的客户端同步整个 :file:`packages`文件夹到您的s3 bucket
* 保证您像（注意文件和路径）这样 :code:`packages/simple/index.html` 上传了新的文件。

5. **Fix新文件许可**

* 默认情况下，当您上传新文件到S3 bucket,它们将有一个不合适的许可设置。
* 使用Amazon web console设置文件的对所有人的READ许可。
* 如果当您尝试安装一个包的时候遇上 HTTP 403 ，确保您正确设置了许可。

6. **搞定**

* 您可以安装您的包通过使用代码 :code:`pip install --index-url=http://your-s3-bucket/packages/simple/ YourPackage`

.. _packaging-for-linux-distributions-ref:


***********************
在Linux上分发
***********************


创建一个Linux分发包对于Linux来说是个正确的决定。

因为分发包可以不包含Python解释器，它使得下载与安装这些包可以减小2-12 MB，
:ref:`freezing your application <freezing-your-code-ref>`.

并且，如果Python有了更新的版本，则您的应用可以自动使用新版本的Python。

bdist_rpm命令使得 `producing an RPM file <https://docs.python.org/3/distutils/builtdist.html#creating-rpm-packages>`_
使得像Red Hat以及SuSE使用分发包变得极其简单，


 无论如何，创建和维持不同配置要求给不同的发布格式（如 对于Debian/Ubuntu是.deb，而对于Red
 Hat/Fedora是.rpm等）无疑需要大量的工作。如果您的代码是一个应用，而您计划分发到其他平台上，
 则您需要创建并维护各个配置要求来冻结您的应用为Windows与OS X。它比创建和
 维护一个单独的配置给每个平台要简单的多 :ref:`freezing tools <freezing-your-code-ref>`
 其将产生独立可执行的文件给所有Linux发布版，就像Windows与OS X上一样，

创建一个对Python版本敏感的分发包也会造成问题。可能需要告诉Ubuntu的 *一些版本* 的
用户他们需要增加 `the 'dead-snakes' PPA <https://launchpad.net/~fkrull/+archive/ubuntu/deadsnakes>`_
通过使用 `sudo apt-repository` 命令在他们安装您的 .deb文件，这将使用户极其厌烦。
不仅如此，您会要维持每个发布版的使用指导，也许更糟的是，您的用户要去读，理解，
并按它上面说的做。


下面是指导如何做上面所说事情的链接：

* `Fedora <https://fedoraproject.org/wiki/Packaging:Python>`_
* `Debian and Ubuntu <http://www.debian.org/doc/packaging-manuals/python-policy/>`_
* `Arch <https://wiki.archlinux.org/index.php/Python_Package_Guidelines>`_


有用的工具
------------

- `fpm <https://github.com/jordansissel/fpm>`_
- `alien <http://joeyh.name/code/alien/>`_
- `dh-virtualenv <https://dh-virtualenv.readthedocs.io/en/latest/info.html>`_ (for APT/DEB omnibus packaging)
