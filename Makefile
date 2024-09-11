install:
	pip install --upgrade pip &&\
		pip install -r requirements.txt
	python -m textblob.download_corpora

test:
	python -m pytest -vv --cov=wikiphrases --cov=nlplogic test_corenlp.py

format:
	black *.py nlplogic

run:
	python main.py

run-uvicorn:
	uvicorn main:app --reload

killweb:
	sudo killall uvicorn

lint:
	pylint --disable=R,C *.py nlplogic/*.py

all: install lint test run