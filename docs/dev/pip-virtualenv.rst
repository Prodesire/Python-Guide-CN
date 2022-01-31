.. _pip-virtualenv:

Pip和Virtualenv的更多配置
===========================================

.. image:: https://farm4.staticflickr.com/3934/34018732105_f0e6758859_k_d.jpg

用 ``pip`` 来要求一个激活的虚拟环境
---------------------------------------------------

现在应该很清楚了，使用虚拟环境是个保持开发环境干净和分隔不同项目要求的好做法。

当您开始工作在多个不同的项目上时，会很难记住去激活哪个相关的虚拟环境来回到特定的项目。
其结果就是，您会非常容易在全局范围内安装包，虽然想的是要安装在特定工程的虚拟环境中。
时间越久，就会导致混乱的全局包列表。

为了确保您当您使用 ``pip install`` 时是将包安装在激活的虚拟环境中，考虑在 
:file:`~/.bashrc` 文件中加上以下一行：

.. code-block:: console

    export PIP_REQUIRE_VIRTUALENV=true

在保存完这个修改以及使用 ``source ~/.bashrc`` 来source一下 :file:`~/.bashrc` 
文件后，如果您不在一个虚拟环境中，pip就不会让您安装包。如果您试着在虚拟环境外使用 
``pip install`` ，pip将会柔和地提示您需要一个激活的虚拟环境来安装包。

.. code-block:: console

    $ pip install requests
    Could not find an activated virtualenv (required).

您也可以通过编辑 :file:`pip.conf` 或 :file:`pip.ini`来做相同的配置。 
:file:`pip.conf` 被Unix和Mac OS X操作系统使用，能够在这里找到：

.. code-block:: console

    $HOME/.pip/pip.conf

类似的， :file:`pip.ini` 被Windows操作系统使用，能够在这里找到：

.. code-block:: console

    %USERPROFILE%\pip\pip.ini

如果在这些位置中并没有 :file:`pip.conf` 或 :file:`pip.ini` ，
您可以在对应的操作系统中创建一个正确名字的新文件。

如果您早就拥有配置文件了，只需将下行添加到 ``[global]`` 设置下，
即可要求一个激活的虚拟环境：

.. code-block:: console

    require-virtualenv = true

如果您没有配置文件，您需要创建一个新的，然后把下面几行添加到这个新文件中：

.. code-block:: console

    [global]
    require-virtualenv = true


当然，您也需要在全局范围内安装一些包（通常是在多个项目中都要一直用到的包），
可以添加下面内容到 :file:`~/.bashrc` 来完成：

.. code-block:: console

    gpip() {
        PIP_REQUIRE_VIRTUALENV=false pip "$@"
    }

在保存完这个修改以及使用 ``source ~/.bashrc`` 来source一下 :file:`~/.bashrc` 
文件后，您现在可以通过运行 ``gpip install`` 来在全局范围内安装包。
您可以把函数名改成任何您喜欢的，只要记住当您要用pip在全局范围内安装包的时候使用
那个名字就行了。

存下包以供将来使用
-------------------------------

每个开发者都有偏好的库，当您工作在大量不同的项目上时，这些项目之间肯定有一些重叠的库。
比如说，您可能在多个不同的项目上使用了 ``requests`` 。

每当您开始一个新项目（并有一个新的虚拟环境）重新下载相同的包/库是没有必要的。幸运的是，
自从6.0版本开始，pip提供 `默认缓存机制
<https://pip.pypa.io/en/stable/reference/pip_install/#caching>`_ 而无需任何配置。

当使用更老的版本时，你可以用下面的方式来配置pip，以使它尝试重用已安装的包。

在Unix系统中，您可以添加以下两行到您的 :file:`.bashrc` 或 :file:`.bash_profile` 文件中。

.. code-block:: console

    export PIP_DOWNLOAD_CACHE=$HOME/.pip/cache

您可以设置成任何您喜欢的路径（只要设置了写权限）。添加完后， ``source`` 下您的 
:file:`.bashrc` （或者 :file:`.bash_profile` ）文件，就设置好啦。

另一个进行相同配置的方法是通过 :file:`pip.conf` 或 :file:`pip.ini` 文件来做，
这取决于您的系统。如果您用Windows，就将下面一行添加到 :file:`pip.ini` 文件中的 
``[global]`` 设置下：

.. code-block:: console

    download-cache = %USERPROFILE%\pip\cache

类似的，如果您使用Unix，就将下面一行添加到 :file:`pip.conf` 文件中的 ``[global]`` 设置下：

.. code-block:: console

    download-cache = $HOME/.pip/cache

虽然您可以使用任何您喜欢的存储缓存的路径，但是仍然推荐在 :file:`pip.conf` 或者 
:file:`pip.ini` 文件所在目录下床架一个新的文件夹 *in* 。如果您不相信自己能够处理好
这个路径，就使用这里提供的内容就好，不会有问题的。
