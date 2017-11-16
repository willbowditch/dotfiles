# Jupyter Kernel with Virtual Env

**Problem:** working on virtual enviroments in Python is best for avoiding package clashes, but each time you'll need to setup a new ipython kernel to develop interactivly.

With [virtual env wrapper](https://virtualenvwrapper.readthedocs.io/en/latest/index.html)

```bash
#! bash
# function to setup jupyter with virtualenv
# Usage venvjupter enviromentname
function venvjupter() {

	source `which virtualenvwrapper.sh`

	echo ">>> Making env"
	mkvirtualenv $1
	echo ">>> Switching to env"
	workon $1
	echo ">>> Setting up ipython"
	pip3 install ipykernel
	echo ">>> telling Jupyter about this env"
	python3 -m ipykernel install --user --name $1 --display-name "Python 3 - $1"

	echo "------------------------------------------------------------------------"
	echo "Virtual env $1 now activated and setup for Jupyter"
	echo "To remove use:"
	echo "> jupyter kernelspec remove $1; rmvirtualenv $1"
	echo "------------------------------------------------------------------------"
}

```

