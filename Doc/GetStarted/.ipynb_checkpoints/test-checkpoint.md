# Matlab in Jupyter

## 安装说明

### 安装Jupyter Book

可以通过以下方式安装**Jupyter Book**：

```bash
$ pip install -U jupyter-book
```

或者通过**Anaconda**，**Windows**下通过**Anaconda navigator**中的**Powershell Prompt**进入**bash**界面：

```bash
$ conda install -c conda-forge jupyter-book
```

### 安装Matlab kernel

#### 版本对应

首先要明确**MATLAB**和**Python**版本对应的关系，可以通过[该网址](https://ww2.mathworks.cn/support/requirements/python-compatibility.html)查看。安装好对应版本的软件。

- 推荐不更改**MATLAB**而是创建个新的conda环境来搞对应版本的**Python**，例如安装**MATLAB 2022a**，就可以安装支持的3.9版本的**Python**虚拟环境

```bash
$ conda create -n python39 python=3.9
$ conda env list  			# 查询已有的环境列表
$ conda activate python39 	# 激活上述安装的新python环境
```

#### 安装过程

##### 安装MATLAB Engine API for Python

在**Windows**系统上，找到**MATLAB**安装路径下面的"matlabroot\extern\engines\python"目录，如该目录位置为D:\Matlab\extern\engines\python，则运行:

```bash
$ cd D:\Matlab\extern\engines\python
$ python setup.py install
```

或者在**MATLAB**命令行中使用:

```matlab
>> cd (fullfile(matlabroot,'extern','engines','python'))
>> system('python setup.py install')
```

##### 安装**jupyterlab**和**MATLAB**内核

```bash
$ pip install jupyterlab
$ pip install matlab_kernel
$ python -m matlab_kernel install
```

要想移除该**kernel**可以使用：

```bash
$ jupyter kernelspec remove matlab
```

#### 成功结果

安装成功后即可在**Jupyter notebook**中选择到**Matlab**内核，后续就可执行相应**MATLAB**代码块。