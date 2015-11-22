=======================
科学应用
=======================

背景
:::::::


Python被经常使用在高性能科学应用中。它之所以在学术或科研项目中得到
如此广泛的应用是因为它容易写而且执行效果很好。


决定于科学计算对高性能的要求，Python中相关操作经常借用外部库，通常是
以更快的语言写的（如C，或者FORTRAN来进行矩阵操作）。其主要的库有 `Numpy`_,
`Scipy`_ 以及 `Matplotlib`_.关于这些库的细节超过了Python教程的范围。无论如
何，一个关于Python的科学计算生态的综合介绍在这里找
到 `Python Scientific Lecture Notes <http://scipy-lectures.github.com/>`_ 。


工具
:::::

IPython
-------


`IPython <http://ipython.org/>`_ 是一个加强版Python解释器，其提供了一些科学计算
感兴趣的特性。其中，`inline mode`允许将图像绘制到终端中（基于Qt）。
进一步的，`notebook`模式支持文学化编程（literate programming,作者这里可能是指
其富文本性不是那个编程范式）与可重现性（reproducible，作者可能是指每段程序
可以单独重新计算的特性），其产生了一个基于web的python notebook。这个notebook允许
你保存一些代码块，伴随着它们的计算结果以及增强的注释（HTML,LaTex,Markdown）。
这个notebook可以被共享并以各种文件格式导出。


库
:::::::::

NumPy
-----

`NumPy <http://numpy.scipy.org/>`_ 是一个用C和FORTRAN写的底层库，其提供一些高层
数学函数。NumPy通过多维数组和操作这些数组的函数解决了Python运行慢的问题。
任何算法只要被写成数组的函数，就可以运行的很快。

NumPy是SciPy项目中的一部分，其被单独释放这样只想使用这一部分的人就不
用安装SciPy的其余部分。

NumPy是兼容Python 2.4-2.7.2以及3.1+

Numba
-----

`Numba <http://numba.pydata.org>`_ 是一个针对NumPy的Python编译器（即时编译器,JIT）
其编译标注过的Python（以及）NumPy代码到LLVM（Low Level Virtual Machine，底层虚拟机）
通过使用装饰器。简明的，Numba的编译可以在运行时进行。

SciPy
-----

`SciPy <http://scipy.org/>`_ 是一个库，其基于NumPy并提供了更多的数学函数。
SciPy使用NumPy数组作为基本数据结构，并有为完成科学编程的任务的各种模块，
包括线性代数，积分（微积分），常微分方程求解以及信号过程。

Matplotlib
----------

`Matplotlib <http://matplotlib.sourceforge.net/>`_ 是一个可以流畅绘图并创建
2D,3D交互式图形并能保存成稿件质量（manuscript-quality）图表的库。其API很像
`MATLAB <http://www.mathworks.com/products/matlab/>`_ ，这使得MATLAB用户很容易
转移到Python。很多例子，以及实现它们的源代码可以
在 `matplotlib gallery <http://matplotlib.sourceforge.net/gallery.html>`_ 找到。

Pandas
------

`Pandas <http://pandas.pydata.org/>`_ 是一个基于NumPy的数据操纵库，其提供了
一些方便的函数对数据进行访问，索引，合并以及归类。其主要数据结构（DataFrame）
与R统计包的的类似概念十分相近；其处理混杂数据（heterogeneous data），对其进行
名称索引，时间序列操作以及对数据的自动对齐（auto-alignment）。

Rpy2
----

`Rpy2 <http://rpy.sourceforge.net/rpy2.html>`_ 是一个Python对R统计学包的绑定，
以让Python可以执行R的函数并且在两个环境中交换数据。Rpy2是
对`Rpy <http://rpy.sourceforge.net/rpy.html>`_ 绑定的面向对象化。

PsychoPy
--------

`PsychoPy <http://www.psychopy.org/>`_ 是做给认知科学家用的库，其可以创建
认知心理学实验和神经科学实验（指的是那种你坐在电脑前，给你一个刺激测
你反应的实验，基本上就是个UI）这个库可以处理刺激表示，实验脚本设计以及
数据收集。

资源
:::::::::

安装这些科学计算Python包可能会很麻烦，它们中很多作为Python的C扩展需要编译。
这一节列举了一些Python科学计算发布版，其提供了已编译并且易于安装的科学计算包。

Python扩展包的非官方Windows库
---------------------------------------------------------

很多人在Windows平台上做科学计算，然而很多科学计算包是臭名昭著的难以build和
安装到这个平台的。`Christoph Gohlke <http://www.lfd.uci.edu/~gohlke/pythonlibs/>`_ 无
论如何，编译了一系列有用的Python包成Windows库。其数量还在不断增长。如果你在
Windows上工作，你也许想要看看它。

Anaconda
--------

`Continuum Analytics <http://continuum.io/>`_ 提供了
`Anaconda Python Distribution <https://store.continuum.io/cshop/anaconda>`_ 其
包含了所有在数据分析和大数据中常用的的Python包。Anaconda自己是免费的
而Continuum卖一些特别的额外组件。这些组件对于学术研究是免费的。

Canopy
------

`Canopy <https://www.enthought.com/products/canopy/>`_ 是另一个Python科学发布版，
`Enthought <https://www.enthought.com/>`_ 提供。其受限制的'Canopy Express'版本
是免费提供的，但是Enthought为完整版负责。其对学术研究是免费的。
