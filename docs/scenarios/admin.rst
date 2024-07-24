
######################
系统管理
######################

.. image:: https://farm5.staticflickr.com/4179/34435690580_3afec7d4cd_k_d.jpg

******
Fabric
******

`Fabric <http://docs.fabfile.org>`_ 是一个简化系统管理任务的库。
Chef和Puppet倾向于关注管理服务器和系统库，而Fabric更加关注应用级别的任务，比如说部署。

安装Fabric:

.. code-block:: console

    $ pip install fabric

下面的代码将会创建我们可以使用的两个任务： ``memory_usage`` 和 ``deploy``。
前者将会在每台机器上输出内存使用情况。后者将会SSH到每台服务器，cd到我们的工程目录，
激活虚拟环境，拉取最新的代码库，以及重启应用服务器。

.. code-block:: python

    from fabric.api import cd, env, prefix, run, task

    env.hosts = ['my_server1', 'my_server2']

    @task
    def memory_usage():
        run('free -m')

    @task
    def deploy():
        with cd('/var/www/project-env/project'):
            with prefix('. ../bin/activate'):
                run('git pull')
                run('touch app.wsgi')

将上述代码保存到文件 :file:`fabfile.py` 中，我们可以这样检查内存的使用：

.. code-block:: console

    $ fab memory_usage
    [my_server1] Executing task 'memory'
    [my_server1] run: free -m
    [my_server1] out:              total     used     free   shared  buffers   cached
    [my_server1] out: Mem:          6964     1897     5067        0      166      222
    [my_server1] out: -/+ buffers/cache:     1509     5455
    [my_server1] out: Swap:            0        0        0

    [my_server2] Executing task 'memory'
    [my_server2] run: free -m
    [my_server2] out:              total     used     free   shared  buffers   cached
    [my_server2] out: Mem:          1666      902      764        0      180      572
    [my_server2] out: -/+ buffers/cache:      148     1517
    [my_server2] out: Swap:          895        1      894

and we can deploy with:

.. code-block:: console

    $ fab deploy

额外的特性包括并行执行、和远程程序交互、以及主机分组。

    `Fabric 文档 <http://docs.fabfile.org>`_

****
Salt
****

`Salt <http://saltstack.org/>`_ 是一个开源的基础管理工具。
它支持从中心节点（主要的主机）到多个主机（指从机）的远程命令执行。
它也支持系统语句，能够使用简单的模板文件配置多台服务器。

Salt支持Python 2.6和2.7，并能通过pip安装：

.. code-block:: console

    $ pip install salt

在配置好一台主服务器和任意数量的从机后，我们可以在从机上使用任意的shell命令或者预制的复杂命令的模块。

下面的命令使用ping模块列出所有可用的从机：

.. code-block:: console

    $ salt '*' test.ping

主机过滤是通过匹配从机id或者使用颗粒系统（grains system）。 
`颗粒（grains） <http://docs.saltstack.com/en/latest/topics/targeting/grains.html>`_ 
系统使用静态的主机信息，比如操作系统版本或者CPU架构，来为Salt模块提供主机分类内容。

下列命令行使用颗粒系统列举了所有可用的运行CentOS的从机：

.. code-block:: console

    $ salt -G 'os:CentOS' test.ping

Salt也提供状态系统。状态能够用来配置从机。

例如，当一个从机接受读取下列状态文件的指令，他将会安装和启动Apache服务器：

.. code-block:: yaml

    apache:
      pkg:
        - installed
      service:
        - running
        - enable: True
        - require:
          - pkg: apache

状态文件可以使用YAML、Jinja2模板系统或者纯Python编写。

    `Salt 文档 <http://docs.saltstack.com>`_


******
Psutil
******

`Psutil <https://github.com/giampaolo/psutil/>`_ 是获取不同系统信息
（比如CPU、内存、硬盘、网络、用户、进程）的接口。

下面是一个关注一些服务器过载的例子。如果任意一个测试（网络、CPU）失败，它将会发送一封邮件。

.. code-block:: python

    # 获取系统变量的函数:
    from psutil import cpu_percent, net_io_counters
    # 休眠函数:
    from time import sleep
    # 用于email服务的包:
    import smtplib
    import string
    MAX_NET_USAGE = 400000  # 每秒字节数
    MAX_ATTACKS = 4
    attack = 0
    while attack <= MAX_ATTACKS:
        sleep(4)

        # 使用命名元组检查网络使用情况
        neti1 = net_io_counters().bytes_recv
        neto1 = net_io_counters().bytes_sent
        sleep(1)
        neti2 = net_io_counters().bytes_recv
        neto2 = net_io_counters().bytes_sent

        # 计算每秒字节数
        net = ((neti2+neto2) - (neti1+neto1))/2

        # 检查网络和cpu使用
        if (net > MAX_NET_USAGE) or (cpu_percent(interval = 1) > 70):
            attack+=1
        elif attack > 1:
            attack-=1

    # 如果attack大于4，就编写一封十分重要的email
    TO = "you@your_email.com"
    FROM = "webmaster@your_domain.com"
    SUBJECT = "Your domain is out of system resources!"
    text = "Go and fix your server!"
    string="\r\n"
    BODY = string.join(("From: %s" %FROM,"To: %s" %TO,
                        "Subject: %s" %SUBJECT, "",text))
    server = smtplib.SMTP('127.0.0.1')
    server.sendmail(FROM, [TO], BODY)
    server.quit()


一个基于psutil，类似于top命令并广泛扩展的功能全面的终端应用程序叫做 `glance <https://github.com/nicolargo/glances/>`_ ，它具备客户端-服务端监控能力。


*******
Ansible
*******

`Ansible <http://ansible.com/>`_ 是一个开源系统自动化工具。
相比于Puppet或者Chef最大的优点是它不需要客户机上的代理。
Playbooks是Ansible的配置、部署和编排语言，它用YAML格式编写，使用Jinja2作为模板。

Ansible支持Python 2.6和2.7，并能使用pip安装：

.. code-block:: console

    $ pip install ansible

Ansible需要一个清单文件，来描述主机经过何处。以下是一个主机和playbook的例子，
在清单文件中将会ping所有主机。

清单文件示例如下：
:file:`hosts.yml`

.. code-block:: yaml

    [server_name]
    127.0.0.1

playbook示例如下：
:file:`ping.yml`

.. code-block:: yaml

    ---
    - hosts: all

      tasks:
        - name: ping
          action: ping

要运行playbook：

.. code-block:: console

    $ ansible-playbook ping.yml -i hosts.yml --ask-pass

Ansible playbook在 :file:`hosts.yml` 中将会ping所有的服务器。您也可以选择成组的服务器使用Ansible。
了解更多关于Ansible的信息，请阅读 `Ansible Docs <http://docs.ansible.com/>`_ 。

`Ansible教程 <https://serversforhackers.com/an-ansible-tutorial/>`_ 也是一个很棒的且详细的指引来开始熟悉Ansible。


****
Chef
****

`Chef <https://www.chef.io/chef/>`_ 是一个系统的云基础设施自动化框架，
它使部署服务器和应用到任何物理、虚拟或者云终端上变得简单。您可以选择进行配置管理，那将主要使用Ruby去编写您的基础设施代码。

Chef客户端运行于组成您的基础设施的每台服务器上，这些客户端定期检查Chef服务器来确保系统是均衡并且处于设想的状态。
由于每台服务器拥有它自己的独立的Chef客户端，每个服务器配置自己，这种分布式方法使得Chef成为一个可扩展的自动化平台。

Chef通过使用定制的在cookbook中实现的食谱（配置元素）来工作。Cookbook通常作为基础设施的选择项，
作为包存放在Chef服务器中。请阅读 `数字海洋教程系列 
<https://www.digitalocean.com/community/tutorials/how-to-install-a-chef-server-workstation-and-client-on-ubuntu-vps-instances>`_ 
关于Chef的部分来学习如何创建一个简单的Chef服务器。

要创建一个简单的cookbook，使用 `knife <https://docs.chef.io/knife.html>`_ 命令：

.. code-block:: console 

    knife cookbook create cookbook_name

`Getting started with Chef <http://gettingstartedwithchef.com/first-steps-with-chef.html>`_ 
对Chef初学者来说是一个好的开始点，许多社区维护着cookbook，可以作为是一个好的参考。要服务自己的基础设施配置需求，
请见 `Chef Supermarket <https://supermarket.chef.io/cookbooks>`_ 。

- `Chef 文档 <https://docs.chef.io/>`_


******
Puppet
******

`Puppet <http://puppetlabs.com>`_ 是来自Puppet Labs的IT自动化和配置管理软件，允许系统管理员定义他们的IT基础设施状态，
这样就能够提供一种优雅的方式管理他们成群的物理和虚拟机器。

Puppet均可作为开源版和企业版获取到。其模块是小的、可共享的代码单元，用以自动化或定义系统的状态。 
`Puppet Forge <https://forge.puppetlabs.com/>`_ 是一个模块仓库，它由社区编写，面向开源和企业版的Puppet。

Puppet代理安装于其状态需要被监控或者修改的节点上。作为特定服务器的Puppet Master负责组织代理节点。

代理节点发送系统的基本信息到Puppet Master，比如说操作系统、内核、架构、IP地址、主机名等。
接着，Puppet Master编译携带有节点生成信息的目录，告知每个节点应如何配置，并发送给代理。
代理便会执行前述目录中的变化，并向Puppet Master发送回一份报告。

Facter是一个有趣的工具，它用来传递Puppet获取到的基本系统信息。这些信息可以在编写Puppet模块的时候作为变量来引用。

.. code-block:: console

    $ facter kernel
    Linux
.. code-block:: console

    $ facter operatingsystem
    Ubuntu  

在Puppet中编写模块十分直截了当。Puppet清单（manifest）组成了Puppet模块。Puppet清单以扩展名 ``.pp`` 结尾。
下面是一个Puppet中 ‘Hello World’的例子。

.. code-block:: puppet

    notify { 'This message is getting logged into the agent node':

        #As nothing is specified in the body the resource title
        #the notification message by default.
    }

这里是另一个基于系统的逻辑的例子。注意操纵系统信息是如何作为变量使用的，变量前加了前缀符号 ``$`` 。
类似的，其他信息比如说主机名就能用 ``$hostname`` 来引用。

.. code-block:: puppet

    notify{ 'Mac Warning':
        message => $operatingsystem ? {
            'Darwin' => 'This seems to be a Mac.',
            default  => 'I am a PC.',
        },
    }

Puppet有多种资源类型，需要时可以使用包-文件-服务（package-file-service）范式来承担配置管理的主要任务。
下面的Puppet代码确保了系统中安装了OpenSSH-Server包，并且在每次sshd配置文件改变时重启sshd服务。

.. code-block:: puppet

    package { 'openssh-server':
        ensure => installed,
    }

    file { '/etc/ssh/sshd_config':
        source   => 'puppet:///modules/sshd/sshd_config',
        owner    => 'root',
        group    => 'root',
        mode     => '640',
        notify   =>  Service['sshd'], # sshd will restart
                                      # whenever you edit this
                                      # file
        require  => Package['openssh-server'],

    }

    service { 'sshd':
        ensure    => running,
        enable    => true,
        hasstatus => true,
        hasrestart=> true,
    }

了解更多信息，参考 `Puppet Labs 文档 <http://docs.puppetlabs.com>`_ 。


*********
Blueprint
*********

.. todo:: Write about Blueprint

********
Buildout
********

`Buildout <http://www.buildout.org>`_ 是一个开源软件构件工具。Buildout由Python编写。
它实现了配置和构建脚本分离的原则。Buildout主要用于下载和设置正在开发或部署软件的
`Python eggs <https://stackoverflow.com/questions/2051192/what-is-a-python-egg>` 格式的依赖。
在任何环境中构建任务的指南（recipe，原意为“食谱”，引申为“指南”）能被创建，许多早已可用。
