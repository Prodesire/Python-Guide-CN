密码学
============

.. image:: https://farm5.staticflickr.com/4220/33907152824_bf91078cc1_k_d.jpg

Cryptography
------------

`Cryptography <https://cryptography.io/en/latest/>`_ 是一个开发活跃的库，它提供
了加密方法（recipes）和基元（primitives），支持Python 2.6-2.7、Python 3.3+ 和 PyPy。

Cryptography 分为两个层，方法（recipes）层和危险底层（hazardous materials，简称hazmat）。
方法层提供用于适当的对称加密，hazmat层提供底层的加密基元。

安装
~~~~~~~~~~~~

.. code-block:: console

    $ pip install cryptography

例子
~~~~~~~

示例代码使用了高层的对称加密方法：

.. code-block:: python

	from cryptography.fernet import Fernet
	key = Fernet.generate_key()
	cipher_suite = Fernet(key)
	cipher_text = cipher_suite.encrypt(b"A really secret message. Not for prying eyes.")
	plain_text = cipher_suite.decrypt(cipher_text)


GPGME bindings
--------------

`GPGME Python bindings <https://dev.gnupg.org/source/gpgme/browse/master/lang/python/>`_ 提供Pythonic的方式访问 `GPG Made Easy <https://dev.gnupg.org/source/gpgme/browse/master/>`_ ，这是整个GNU Privacy Guard项目套件，包括GPG、libgcrypt和gpgsm（S/MIME 引擎），的C API。它支持Python 2.6、2.7、3.4及以上版本。取决于Python的SWIG C接口以及GnuPG软件和库。

其在与GnuPG其余项目的相同条款（GPLv2和LGPLv2.1，均带有“或更高版本”）下可用。

安装
~~~~~~~~~~~~

如果配置脚本定位到了所支持的python版本（配置时位于$PATH中），那么在编译GPGME时会默认包含它。

例子
~~~~~~~

.. code-block:: python3

	import gpg
	import os
	
	# Encryption to public key specified in rkey.
	rkey = "0xDEADBEEF"
	text = "Something to hide."
	plain = gpg.core.Data(text)
	cipher = gpg.core.Data()
	c = gpg.core.Context()
	c.set_armor(1)
	c.op_keylist_start(rkey, 0)
	r = c.op_keylist_next()
	c.op_encrypt([r], 1, plain, cipher)
	cipher.seek(0, os.SEEK_SET)
	ciphertext = cipher.read()

	# Decryption with corresponding secret key
	# invokes gpg-agent and pinentry.
	plaintext = gpg.Context().decrypt(ciphertext)

	# Matching the data.
	if text == plaintext[0].decode("utf-8"):
	    print("Hang on ... did you say *all* of GnuPG?  Yep.")
	else:
	    pass


PyCrypto
--------

`PyCrypto <https://www.dlitz.net/software/pycrypto/>`_ 是另一个密码库，它提供
安全的哈希函数和各种加密算法，支持Python 2.1到3.3。

安装
~~~~~~~~~~~~

.. code-block:: console

    $ pip install pycrypto

例子
~~~~~~~

.. code-block:: python

	from Crypto.Cipher import AES
	# Encryption
	encryption_suite = AES.new('This is a key123', AES.MODE_CBC, 'This is an IV456')
	cipher_text = encryption_suite.encrypt("A really secret message. Not for prying eyes.")

	# Decryption
	decryption_suite = AES.new('This is a key123', AES.MODE_CBC, 'This is an IV456')
	plain_text = decryption_suite.decrypt(cipher_text)
