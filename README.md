# Python最佳实践指南中文版

[![Open Collective 支持者](https://opencollective.com/python-guide-cn/backers/badge.svg)](#支持者)
[![Open Collective 赞助者](https://opencollective.com/python-guide-cn/sponsors/badge.svg)](#赞助者)

![Python 指南配图](https://farm1.staticflickr.com/628/33173824932_58add34581_k_d.jpg)

项目翻译来自 [Hitchhiker's Guide to Python](https://github.com/kennethreitz/python-guide)。

文档地址：[Python最佳实践指南中文版](https://prodesire.github.io/Python-Guide-CN/)

本指南目前持续不断地更新与完善。这份主要是自我见解的指南旨在为 Python 初学者和专家提供一个关于 Python 安装、配置和日常使用的最佳实践手册。

主题包括：

- 不同平台和系统上的安装
- Py2app、Py2exe、bbfreeze、pyInstaller
- Pip
- NumPy、SciPy、statpy、pyplot、matplotlib
- Virtualenv
- Fabric
- 优秀的模块推荐，按主题/目的分类
- 在哪些场景下使用哪些模块
- 服务器配置与不同的 Web 框架和工具
- 文档：写文档
- 测试：Jenkins 与 tox 指南
- 如何更方便地通过 `git` 连接 `hg`

## 使用指南

1. 下载 zip 文件或 clone 到本地，并进入到项目根目录。
2. 运行 `make help` 查看可用命令。
3. 运行 `make install` 使用 uv 根据 `pyproject.toml` 创建虚拟环境并安装依赖。
4. 运行 `make html` 构建文档；或运行 `make serve` 构建并启动本地文档网站。
5. `make html` 会在 `docs/_build/html` 中生成 HTML 文件，`make serve` 默认会在 `http://localhost:8005/` 运行文档网站。

## 翻译指南

1. 将 [python-guide](https://github.com/kennethreitz/python-guide) 项目和本项目的 `master` 分支更新。
2. 查看本项目 `diff.txt` 中的当前翻译版本对应的原版提交号，在 `python-guide` 中比对 `master` 分支上最新提交和该提交号的差异，并据此翻译进本项目。
3. 翻译完毕后将 `python-guide` 中 `master` 分支上的最新提交号更新入 `diff.txt` 的当前翻译版本对应的原版提交号。
4. 在本项目中提交修改、推送，并发起合并请求。

## 鸣谢

### 贡献者

感谢所有为本项目做出贡献的人。

![贡献者](https://opencollective.com/python-guide-cn/contributors.svg?width=890&button=false)

### 支持者

感谢所有支持者。[成为支持者](https://opencollective.com/python-guide-cn#backer)。

[![支持者](https://opencollective.com/python-guide-cn/backers.svg?width=890)](https://opencollective.com/python-guide-cn#backers)

### 赞助者

欢迎赞助本项目。您的 Logo 将显示在这里，并链接到您的网站。[成为赞助者](https://opencollective.com/python-guide-cn#sponsor)。

[![赞助者](https://opencollective.com/python-guide-cn/sponsor/0/avatar.svg)](https://opencollective.com/python-guide-cn/sponsor/0/website)
