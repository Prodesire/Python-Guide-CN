
############
密码学
############

.. image:: https://farm5.staticflickr.com/4220/33907152824_bf91078cc1_k_d.jpg


************
cryptography
************

`cryptography <https://cryptography.io/en/latest/>`_ 是一个开发活跃的库，它提供
了加密方法（recipes）和基元（primitives），支持Python 2.6-2.7、Python 3.3+ 和 PyPy。

cryptography 分为两个层，方法（recipes）层和危险底层（hazardous materials，简称hazmat）。
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


**************
GPGME bindings
**************

`GPGME Python bindings <https://dev.gnupg.org/source/gpgme/browse/master/lang/python/>`_ 提供Pythonic的方式访问 `GPG Made Easy <https://dev.gnupg.org/source/gpgme/browse/master/>`_ ，这是整个GNU Privacy Guard项目套件，包括GPG、libgcrypt和gpgsm（S/MIME 引擎），的C API。它支持Python 2.6、2.7、3.4及以上版本。取决于Python的SWIG C接口以及GnuPG软件和库。

这里有更全面的GPGME Python Bindings HOWTO的 `源码版 <https://dev.gnupg.org/source/gpgme/browse/master/lang/python/docs/GPGMEpythonHOWTOen.org>`_  和 `HTML版 <http://files.au.adversary.org/crypto/GPGMEpythonHOWTOen.html>`_。还提供了Python 3版本的HOWTO示例脚本的源代码，并且可以在 `这里 <https://dev.gnupg.org/source/gpgme/browse/master/lang/python/examples/howto/>`_ 访问。

其在与GnuPG其余项目的相同条款（GPLv2和LGPLv2.1，均带有“或更高版本”）下可用。

安装
~~~~~~~~~~~~

如果配置脚本定位到了所支持的python版本（配置时位于$PATH中），那么在编译GPGME时会默认包含它。

例子
~~~~~~~

.. code-block:: python3

	import gpg
	
	# Encryption to public key specified in rkey.
	a_key = input("Enter the fingerprint or key ID to encrypt to: ")
	filename = input("Enter the filename to encrypt: ")
	with open(filename, "rb") as afile:
	    text = afile.read()
	c = gpg.core.Context(armor=True)
	rkey = list(c.keylist(pattern=a_key, secret=False))
	ciphertext, result, sign_result = c.encrypt(text, recipients=rkey,
	                                            always_trust=True,
						    add_encrypt_to=True)
	with open("{0}.asc".format(filename), "wb") as bfile:
	    bfile.write(ciphertext)
	# Decryption with corresponding secret key
	# invokes gpg-agent and pinentry.
	with open("{0}.asc".format(filename), "rb") as cfile:
	    plaintext, result, verify_result = gpg.Context().decrypt(cfile)
	with open("new-{0}".format(filename), "wb") as dfile:
	    dfile.write(plaintext)
	# Matching the data.
	# Also running a diff on filename and the new filename should match.
	if text == plaintext:
	    print("Hang on ... did you say *all* of GnuPG?  Yep.")
	else:
	    pass
