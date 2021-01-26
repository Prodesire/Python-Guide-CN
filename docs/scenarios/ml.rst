
################
机器学习
################

.. image:: https://farm4.staticflickr.com/3954/34018729885_002ced9b54_k_d.jpg

Python拥有大量的数据分析、统计和机器学习库，使其成为许多数据科学家的首选语言。

一些广泛使用的机器学习和其他数据科学应用程序包被列在下面：


*********************************
SciPy 栈（SciPy stack）
*********************************

SciPy 栈由数据科学所使用的一组核心帮助包组成，用于统计分析和数据可视化。
由于其庞大的功能和易用性，SciPy 栈被认为是大多数数据科学应用的必备条件。

该栈包含以下包（提供文档链接）：

1. `NumPy <http://www.numpy.org/>`_
2. `SciPy library <https://www.scipy.org/>`_
3. `Matplotlib <http://matplotlib.org/>`_
4. `IPython <https://ipython.org/>`_
5. `pandas <http://pandas.pydata.org/>`_
6. `Sympy <http://www.sympy.org/en/index.html>`_
7. `nose <http://nose.readthedocs.io/en/latest/>`_

该栈还附带了Python，但已被排除在上面的列表中。

安装
~~~~~~~~~~~~

要安装完整的栈或单个包，您可以参考 `这里 <https://www.scipy.org/install.html>`_ 
给出的说明。

**注意：** `Anaconda <https://www.continuum.io/anaconda-overview>`_ 是高推荐的，
因为它可以无缝地安装和维护数据科学包。


************
scikit-learn
************

Scikit是一个用于Python的免费开源机器学习库。 它提供了现成的功能来实现诸如线性回归、
分类器、SVM、k-均值和神经网络等多种算法。它还有一些可直接用于训练和测试的样本数据集。

由于其速度、鲁棒性和易用性，它是许多机器学习应用程序中使用最广泛的库之一。

安装
~~~~~~~~~~~~

通过 PyPI:

.. code-block:: python
	
	pip install -U scikit-learn

通过 conda:

.. code-block:: python

	conda install scikit-learn

scikit-learn 也随Anaconda发行（如上所述）。 有关更多安装说明，请参阅 
`此链接 <http://scikit-learn.org/stable/install.html>`_ 。

例子
~~~~~~~

本例中，我们在 `Iris 数据集 <http://en.wikipedia.org/wiki/Iris_flower_data_set>`_
上训练一个简单的分类器，它与scikit-learn捆绑在一起。

数据集具有花的四个特征：萼片长度，萼片宽度，花瓣长度和花瓣宽度，并将它们分为三个花种
（标签）：setosa、versicolor或virginica。 标签已经被表示为数据集中的数字：
0（setosa），1（versicolor）和2（virginica）。

我们清洗Iris数据集，并将其分为独立的训练和测试集：保留最后10个数据点进行测试，
剩余的进行训练。然后我们在训练集训练分类器，并对测试集进行预测。

.. code-block:: python

	from sklearn.datasets import load_iris 
	from sklearn import tree
	from sklearn.metrics import accuracy_score
	import numpy as np

	#loading the iris dataset
	iris = load_iris() 

	x = iris.data #array of the data
	y = iris.target #array of labels (i.e answers) of each data entry

	#getting label names i.e the three flower species
	y_names = iris.target_names 

	#taking random indices to split the dataset into train and test
	test_ids = np.random.permutation(len(x)) 

	#splitting data and labels into train and test
	#keeping last 10 entries for testing, rest for training

	x_train = x[test_ids[:-10]]
	x_test = x[test_ids[-10:]]

	y_train = y[test_ids[:-10]]
	y_test = y[test_ids[-10:]]

	#classifying using decision tree
	clf = tree.DecisionTreeClassifier()

	#training (fitting) the classifier with the training set
	clf.fit(x_train, y_train)

	#predictions on the test dataset
	pred = clf.predict(x_test)

	print pred #predicted labels i.e flower species
	print y_test #actual labels
	print (accuracy_score(pred, y_test))*100 #prediction accuracy

由于我们在每次迭代中随机分割和分类训练，所以准确性可能会有所不同。运行上面的代码得到：

.. code-block:: python

	[0 1 1 1 0 2 0 2 2 2]
	[0 1 1 1 0 2 0 2 2 2]
	100.0

第一行包含由我们的分类器预测的测试数据的标签（即花种），第二行包含数据集中给出的实际花种。 
我们这次准确率达到100％。

关于scikit-learn的更多内容可以在 `文档 <http://scikit-learn.org/stable/user_guide.html>`_
中阅读。