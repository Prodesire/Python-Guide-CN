速度
=====


CPython作为最流行的Python环境，对于CPU密集型任务（CPU bound tasks）较慢，而  `PyPy`_ 则较快。

使用稍作改动的   `David Beazley的`_   CPU密集测试代码（增加了循环进行多轮测试），
你可以看到CPython与PyPy之间的执行差距。

.. code-block:: console

   # PyPy
   $ ./pypy -V
   Python 2.7.1 (7773f8fc4223, Nov 18 2011, 18:47:10)
   [PyPy 1.7.0 with GCC 4.4.3]
   $ ./pypy measure2.py
   0.0683999061584
   0.0483210086823
   0.0388588905334
   0.0440690517426
   0.0695300102234

.. code-block:: console

   # CPython
   $ ./python -V
   Python 2.7.1
   $ ./python measure2.py
   1.06774401665
   1.45412397385
   1.51485204697
   1.54693889618
   1.60109114647

Context
:::::::


The GIL
-------

`GIL`_ (全局解释器锁)是Python支持多线程并行操作的方式。Python的内存管理不是
线程安全的，所以GIL被创造出来避免多线程同时运行同一个Python代码。

David Beazley 有一个关于GIL如何工作的 `指导`_ 。他也讨论了 Python3.2中的 `新GIL`_ 
他的结论是为了最大化一个Python程序的性能，应该对GIL工作方式有一个深刻的理解——它如何
影响你的特定程序，你拥有多少核，以及你程序瓶颈在哪。

C 扩展
------------


The GIL
-------


当写一个C扩展时必须 `特别关注`_  在解释器中注册你的线程。

C 扩展
::::::::::::


Cython
------

`Cython <http://cython.org/>`_ 是Python语言的一个超集，对其你可以为Python写C
或C++模块。Cython也使得你可以从已编译的C库中调用函数。使用Cython让你得以发挥Python
的变量与操作的强类型优势。

这是一个Cython中的强类型例子。

.. code-block:: cython

    def primes(int kmax):
    """有一些Cython附加关键字的素数计算 """

        cdef int n, k, i
        cdef int p[1000]
        result = []
        if kmax > 1000:
            kmax = 1000
        k = 0
        n = 2
        while k < kmax:
            i = 0
            while i < k and n % p[i] != 0:
                i = i + 1
            if i == k:
                p[k] = n
                k = k + 1
                result.append(n)
            n = n + 1
        return result



将这个有一些附加关键字的寻找素数算法实现与下面这个纯Python实现比较：

.. code-block:: python

    def primes(kmax):
    """标准Python语法下的素数计算"""

        p= range(1000)
        result = []
        if kmax > 1000:
            kmax = 1000
        k = 0
        n = 2
        while k < kmax:
            i = 0
            while i < k and n % p[i] != 0:
                i = i + 1
            if i == k:
                p[k] = n
                k = k + 1
                result.append(n)
            n = n + 1
        return result


注意，在Cython版本，在创建一个Python列表时，你声明了会被编译为C类型的整型和整型数组。


.. code-block:: cython

    def primes(int kmax):
        """有一些Cython附加关键字的素数计算 """

        cdef int n, k, i
        cdef int p[1000]
        result = []


.. code-block:: python

    def primes(kmax):
        """标准Python语法下的素数计算"""

        p= range(1000)
        result = []

有什么差别呢？在上面的Cython版本中，你可以看到变量类型与整型数组像标准C一样被声明。
作为例子，第三行的 `cdef int n,k,i` 这个附加类型声明（整型）使得Cython编译器得以产生比
第二个版本更有效率的C代码。标准Python代码以 `*.py` 格式保存，而Cython以
 `*.pyx` 格式保存。

速度上有什么差异呢？看看这个！

.. code-block:: python

	import time
	#启动pyx编译器
	import pyximport
	pyximport.install()
	#Cython的素数算法实现
	import primesCy
	#Python的素数算法实现
	import primes

	print "Cython:"
	t1= time.time()
	print primesCy.primes(500)
	t2= time.time()
	print "Cython time: %s" %(t2-t1)
	print ""
	print "Python"
	t1= time.time()
	print primes.primes(500)
	t2= time.time()
	print "Python time: %s" %(t2-t1)


这两行代码需要一些说明：

.. code-block:: python

    import pyximport
    pyximport.install()



`pyximport` 使得你可以导入 `*.pyx` 文件，（像 `primesCy.pyx` 这样的）。
`pyximport.install()` 命令使Python解释器可以打开Cython编译器直接编译出 `*.so` 格式
的C库。Cython之后可以导入这个库到你的Python代码中，简便而有效。使用 `time.time()` 函数
你可以比较两个不同的在查找500个素数的调用长的时间消耗差异。在一个标准笔记本中
（双核AMD E-450 1.6GHz），测量值是这样的：
 

.. code-block:: console

    Cython time: 0.0054 seconds

    Python time: 0.0566 seconds


而这个是嵌入的 `ARM beaglebone <http://beagleboard.org/Products/BeagleBone>`_ 机的输出结果：

.. code-block:: console

    Cython time: 0.0196 seconds

    Python time: 0.3302 seconds


Pyrex
-----


Shedskin?
---------

Numba
-----
.. todo:: Write about Numba and the autojit compiler for NumPy

Threading
:::::::::


Threading
---------


Spawning Processes
------------------


Multiprocessing
---------------


.. _`PyPy`: http://pypy.org
.. _`GIL`: http://wiki.python.org/moin/GlobalInterpreterLock
.. _`指导`: http://www.dabeaz.com/python/UnderstandingGIL.pdf
.. _`新GIL`: http://www.dabeaz.com/python/NewGIL.pdf
.. _`特别关注`: http://docs.python.org/c-api/init.html#threads
.. _`David Beazley的`: http://www.dabeaz.com/GIL/gilvis/measure2.py
