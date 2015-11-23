=======================
科学应用
=======================

背景
:::::::


Python被经常使用在高性能科学应用中。它之所以在学术和科研项目中得到
如此广泛的应用是因为它容易编写而且执行效果很好。


由于科学计算对高性能的要求，Python中相关操作经常借用外部库，通常是
以更快的语言（如C，或者FORTRAN来进行矩阵操作）写的。其主要的库有 `Numpy`_,
`Scipy`_ 以及 `Matplotlib`_。关于这些库的细节超出了本指南的范围。不过，
关于Python的科学计算生态的综合介绍可以在这里找到
`Python Scientific Lecture Notes <http://scipy-lectures.github.com/>`_。


工具
:::::

IPython
-------


`IPython <http://ipython.org/>`_ 是一个加强版Python解释器，它提供了科学工作者
感兴趣的特性。其中，`inline mode` 允许将图像绘制到终端中（基于Qt）。
进一步的，`notebook` 模式支持文学化编程（literate programming，
译者注：作者这里可能是指其富文本性不是那个编程范式）与可重现性（reproducible，
译者注：作者可能是指每段程序可以单独重新计算的特性），它产生了一个基于web的
python 笔记本。这个笔记本允许你保存一些代码块，伴随着它们的计算结果以及增强的
注释（HTML,LaTex,Markdown）。这个笔记本可以被共享并以各种文件格式导出。


库
:::::::::

NumPy
-----

`NumPy <http://numpy.scipy.org/>`_ 是一个用C和FORTRAN写的底层库，它提供一些高层
数学函数。NumPy通过多维数组和操作这些数组的函数巧妙地解决了Python运行算法较慢的问题。
任何算法只要被写成数组中的函数，就可以运行得很快。

NumPy是SciPy项目中的一部分，它被发布为一个独立的库，这样对于只需基本功能的人来说，
就不用安装SciPy的其余部分。

NumPy兼容Python 2.4-2.7.2以及3.1+。

Numba
-----

`Numba <http://numba.pydata.org>`_ 是一个针对NumPy的Python编译器（即时编译器,JIT）
它通过特殊的装饰器，将标注过的Python（以及NumPy）代码编译到LLVM（Low Level Virtual Machine，底层虚拟机）中。简单地说，Python使用一种机制，用LLVM将Python代码编译为
能够在运行时执行的本地代码。

SciPy
-----

`SciPy <http://scipy.org/>`_ 是基于NumPy并提供了更多的数学函数的库。
SciPy使用NumPy数组作为基本数据结构，并提供完成各种常见科学编程任务的模块，
包括线性代数，积分（微积分），常微分方程求解以及信号过程。

Matplotlib
----------

`Matplotlib <http://matplotlib.sourceforge.net/>`_ 是一个可以灵活绘图的库，它
能够创建2D、3D交互式图形，并能保存成具有稿件质量（manuscript-quality）的图表。
其API很像 `MATLAB <http://www.mathworks.com/products/matlab/>`_，这使得MATLAB用户
很容易转移到Python。在 `matplotlib gallery <http://matplotlib.sourceforge.net/gallery.html>`_ 中可以找到很多例子以及实现它们的源代码（可以在此基础上再创造）。

Pandas
------

`Pandas <http://pandas.pydata.org/>`_ 是一个基于NumPy的数据处理库，它提供了
许多有用的函数能轻松地对数据进行访问、索引、合并以及归类。其主要数据结构（DataFrame）
与R统计学包十分相近；也就是，使用名称索引的异构数据（heterogeneous data）表、时间序列操作以及对数据的自动对准（auto-alignment）。

Rpy2
----

`Rpy2 <http://rpy.sourceforge.net/rpy2.html>`_ 是一个对R统计学包的Python绑定，
它能够让Python执行R函数，并在两个环境中交换数据。Rpy2是
对 `Rpy <http://rpy.sourceforge.net/rpy.html>`_ 绑定的面向对象实现。

PsychoPy
--------

`PsychoPy <http://www.psychopy.org/>`_ 是面向认知科学家的库，它允许创建
认知心理学和神经科学实验（译者注：指的是那种你坐在电脑前，给你一个刺激测
你反应的实验，基本上就是个UI）。这个库能够处理刺激表示、实验设计脚本以及
数据收集。

资源
:::::::::

安装这些科学计算Python包可能会有些麻烦，因为它们中很多是用Python的C扩展实现的，
这就意味着需要编译。这一节列举了各种科学计算Python发行版，它们提供了预编译编译
且易于安装的科学计算Python包。

Python扩展包的非官方Windows二进制文件（库）
---------------------------------------------------------

很多人在Windows平台上做科学计算，然而众所周知的是，其中很多科学计算包在该平台上
难以构建和安装。不过， `Christoph Gohlke <http://www.lfd.uci.edu/~gohlke/pythonlibs/>`_ 将一系列有用的Python包编译成了Windows的二进制文件，其数量还在不断增长。如果你在
Windows上工作，你也许想要看看。

Anaconda
--------

`Continuum Analytics <http://continuum.io/>`_ 提供了
`Anaconda Python Distribution <https://store.continuum.io/cshop/anaconda>`_，它
拥有所有常见的Python科学包，也包括与数据分析和大数据相关的包。Anaconda是免费的
而Continuum销售一些专有的额外组件。学术研究者可以获取这些组件的免费许可。

Canopy
------

`Canopy <https://www.enthought.com/products/canopy/>`_ 是另一个Python科学发布版，由
`Enthought <https://www.enthought.com/>`_ 提供。其受限制的 'Canopy Express' 版本
是免费提供的，但是Enthought负责完整版。学术研究者可以获取到免费许可。
