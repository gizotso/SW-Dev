# Jupyter Notebooks (aka Ipython Notebooks)
![](http://jupyter.org/assets/nav_logo.svg)
http://jupyter.org/

* https://jupyter.org/try 
* http://nbviewer.jupyter.org/
* https://github.com/jupyter/docker-demo-images
* Online Jupyter Notebooks (Microsoft) : https://notebooks.azure.com/
   * https://notebooks.azure.com/help/introduction
   * Sync with GitHub : [article](https://medium.com/@mikeclymer/integrating-azure-notebooks-jupyter-notebooks-with-github-fd847e941e4)
* Online Jupyter Notebooks (Google) : https://colab.research.google.com/notebooks/welcome.ipynb
   * http://colab.research.google.com/github/gizotso
   * https://nholmber.github.io/2018/09/google-colab/

```
ipython notebook --help-all
jupyter notebook --help-all
options(jupyter.plot_mimetypes = 'image/png')
```

## Launch Jupyter Notebook (from a WinPython Distribution)
Under WinPython folder install's root, run "Jupyter Notebook.exe".
It is useful to have a shortcut in FreeCommander to open Jupyter Notebook in a specific folder.

"Jupyter Notebook.exe" starts IPython (%WINPYDIR%\Scripts\ipython3.exe) under a terminal and starts a local web server : http://localhost:8889/tree


ipython_notebook.bat Wrapper (just use a call to set_env to have required env var well set (%PYTHOHOME%, %PYTHONPATH%, ...? )
```
call %~dp0set_env.cmd
jupyter notebook --notebook-dir=%PYTHON_iNB_PATH%
```

Windows Shortcut
```
%windir%\system32\cmd.exe /c "cd notebooks && "%CD%/Portable Python 2.7.6.1/App\python.exe" "%CD%/Portable Python 2.7.6.1\App\Scripts\ipython_script.py" notebook"
```

- http://stackoverflow.com/questions/15680463/change-ipython-working-directory
```
ipython notebook --notebook-dir="T:\SW Dev\R project\iNotebooks"
ipython notebook Somefile.ipynb
```

## Open Notebook files (.ipynb)
The easiest is to associate ipynb to open with the "IPython Notebook.exe" program when available.

- http://blog.ouseful.info/2014/12/12/seven-ways-of-running-ipython-notebooks/ 
- [nbopen](https://github.com/takluyver/nbopen) : looks for the nearest running notebook server - if it finds one, it opens a web browser to that notebook. If not, it starts a new notebook server in that directory

## NbViewer
NbViewer A simple way to share Jupyter Notebooks : http://nbviewer.jupyter.org/
http://jupyter-notebook-beginner-guide.readthedocs.io/en/latest/what_is_jupyter.html

Examples : 
- https://github.com/jupyter/notebook/blob/master/docs/source/examples/Notebook/Typesetting%20Equations.ipynb
   + https://github.com/jupyter/notebook/blob/master/docs/source/examples/Notebook/Working%20With%20Markdown%20Cells.ipynb

# Python Notebooks

## ipy_table
[Creates richly formatted tables in a Jypyter Notebook](https://pypi.python.org/pypi/ipy_table)
http://nbviewer.jupyter.org/github/epmoyer/ipy_table/blob/master/notebooks/ipy_table-Introduction.ipynb

## R within Python Notebooks
Rpy/Rpy2 run R code within a python -- Rpython run python code from R
- http://www.r-bloggers.com/using-one-programming-language-in-the-context-of-another-python-and-r/
- http://www.r-bloggers.com/a-modular-rmarkdown-workbook-in-actionim-now-using-a/ 
- http://www.r-bloggers.com/ipython-notebook-for-r-quickstart-for-ubuntu/
- http://www.r-bloggers.com/interactive-r-notebooks-with-jupyter-and-sagemathcloud/

R must be set in the %PATH%

# R Notebooks
* [A portable Jupyter (IPython) install on Windows with an R kernel](http://www.walkingrandomly.com/?p=5734)
* R kernel for Jupyter Notebook https://irkernel.github.io/
   * IRKernel https://github.com/IRkernel/IRkernel
* See also R Notebooks in R Studio and Rnotebook package https://github.com/ramnathv/rNotebook
   * online RmdViewer : http://ramnathv.github.io/rNotebook/

R Code to install required packages
```
install.packages(c('repr', 'IRdisplay', 'evaluate', 'crayon', 'pbdZMQ', 'devtools', 'uuid', 'digest'))
devtools::install_github('IRkernel/IRkernel')

library(devtools)
devtools::install_github('IRkernel/IRkernel')

IRkernel::installspec()
```

update package as needed
```
update.packages(repos = c('http://irkernel.github.io/', getOption('repos')))
```
edit kernel.json file to specify R.exe binary location when using a portable version. Not required if R_HOME_bin is added to the PATH
%R_LIB%\IRkernel\kernelspec\kernel.json
```
{"argv": ["R", "--slave", "-e", "IRkernel::main()", "--args", "{connection_file}"],
 "display_name":"R",
 "language":"R"
}
```

## Run jupyter Notebook
Start Jupyter notebook in a web browser and create a notebook using IRkernel from the dropdown menu.
```
jupyter notebook <nb name>
jupyter notebook --notebook-dir <dir>
```

Run Notebook under Console
```
jupyter qtconsole --kernel=ir
jupyter console --kernel=ir
```

# Conversions
## R Markdown to IPython Notebook (using knitr and notedown)
- https://github.com/aaren/notedown
- https://gist.github.com/ramnathv/9334834
- https://www.youtube.com/watch?v=Av_M3f4XTTM  

## nbconvert
```
jupyter nbconvert --to html mynotebook.ipynb
ipython nbconvert example_v0.3.ipynb example.htm
```
- https://github.com/jupyter/nbconvert-examples 

# References
*	https://try.jupyter.org/
*	http://opentechschool.github.io/python-data-intro/core/notebook.html  
*	http://ipython.org/
*	http://ipython.org/install.html
*	http://ipython.org/notebook.html
*	http://nbviewer.ipython.org/github/ipython/ipython/blob/2.x/examples/Notebook/Index.ipynb 
*	http://ipython.org/ipython-doc/stable/interactive/tutorial.html 
