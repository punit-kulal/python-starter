format:
	python3 -m black .
	python3 -m scripts.create_doc

lint:
# lint only checking new directories as previous lint story is pending
	python3 -m ruff check activities workflows entities server metrics usecases tests
	#python3 -m pylint activities workflows entities server metrics usecases tests
	python3 -m pylint usecases api services workflows

test:
	python -m unittest discover -p '*_test.py' -s tests -t .

lint-fix:
	python3 -m ruff check api activities workflows entities server metrics usecases tests --fix

server-start:
	python3 main.py

worker-start:
	python3 worker.py

check: format lint test