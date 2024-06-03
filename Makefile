PKG=iaed
ENV=test
REP=testpypi
PYTHON=python3
all::
	$(PYTHON) -m build # pip install build
	#$(PYTHON) setup.py sdist bdist_wheel # pip install wheel
install::
	$(PYTHON) -m twine upload --repository $(REP) dist/*
check::
	$(PYTHON) -m twine check dist/*
test::
	$(PYTHON) -m venv $(ENV)
	bash -c "source $(ENV)/bin/activate; $(PYTHON)"
	pip install --index-url https://test.pypi.org/simple/ --extra-index-url https://pypi.org/simple $(PKG)
	echo "import package, test and exit"
clean::
	rm -rf __pycache__ *.egg-info/ dist build $(ENV)
lixo::
	bash -c "$(PYTHON) -m venv $(ENV); source $(ENV)/bin/activate; pip install --index-url https://test.pypi.org/simple/ --extra-index-url https://pypi.org/simple $(PKG); echo "import package, test and exit"; $(PYTHON)"
