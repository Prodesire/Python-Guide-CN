##################
图像处理
##################

.. image:: https://farm5.staticflickr.com/4157/34575689432_3de8e9a348_k_d.jpg

多数图像处理与操作技术可以被两个库有效完成，它们是Python Imaging Library (PIL)与
OpenSource Computer Vision (OpenCV)。

下面是这两个库的简略介绍。


**********************
Python 图形库
**********************

`Python Imaging Library <http://www.pythonware.com/products/pil/>`_ ，或者叫PIL，简略来说，
是Python图像操作的核心库。不幸的是，它的开发陷入了停滞，最后一次更新是2009年。

对您而言幸运的是，存在一个活跃的PIL开发分支，叫做 `Pillow <http://python-pillow.github.io/>`_ 
它很容易安装，运行在虽有的主流操作系统上，而且支持Python3。

安装
~~~~~~~~~~~~


在安装Pillow之前，您应该先安装Pillow的前置部分。针对您的平台对此的特别指导可以在此找到
`Pillow installation instructions <https://pillow.readthedocs.io/en/3.0.0/installation.html>`_.

完成之后，直接执行：

.. code-block:: console

    $ pip install Pillow

例子
~~~~~~~

.. code-block:: python

    from PIL import Image, ImageFilter
    #读取图像
    im = Image.open( 'image.jpg' )
    #显示图像
    im.show()

    #过滤图像
    im_sharp = im.filter( ImageFilter.SHARPEN )
    #保存过滤过的图像到文件中
    im_sharp.save( 'image_sharpened.jpg', 'JPEG' )

    #分解图像到三个RGB不同的通道（band）中。
    r,g,b = im_sharp.split()

    #显示被插入到图像中的EXIF标记
    exif_data = im._getexif()
    exif_data


这里有一些Pillow库的例子：
`Pillow 教程 <https://pillow.readthedocs.io/en/3.0.x/handbook/tutorial.html>`_。


**************************
开源计算机视觉（OpenCv）
**************************

OpenSource Computer Vision,其更广为人知的名字是OpenCv，是一个在图像操作与处理上
比PIL更先进的库。它可以在很多语言上被执行并被广泛使用。

安装
~~~~~~~~~~~~

在Python中，使用OpenCV进行图像处理是通过使用 ``cv2`` 与 ``NumPy`` 模块进行的。
`OpenCV 安装指南 <http://docs.opencv.org/2.4/doc/tutorials/introduction/table_of_content_introduction/table_of_content_introduction.html#table-of-content-introduction>`_
可以指导您如何为您自己的项目进行配置。

NumPy可以从Python Package Index （PyPI）中下载：

.. code-block:: console

    $ pip install numpy


例子
~~~~~~~

.. code-block:: python

    import cv2
    #读取图像
    img = cv2.imread('testimg.jpg')
    #显示图像
    cv2.imshow('image',img)
    cv2.waitKey(0)
    cv2.destroyAllWindows()

    #Applying Grayscale filter to image 作用Grayscale（灰度）过滤器到图像上
    gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)

    #保存过滤过的图像到新文件中
    cv2.imwrite('graytest.jpg',gray)

更多的OpenCV在Python运行例子在这里可以找到：
`collection of
tutorials
<https://opencv-python-tutroals.readthedocs.io/en/latest/py_tutorials/py_tutorials.html>`_.
