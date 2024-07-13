format:
	poetry run python3 -m black .
	poetry run python3 -m scripts.create_doc

lint:
# lint only checking new directories as previous lint story is pending
	poetry run python3 -m ruff check activities workflows entities server metrics usecases tests
	#python3 -m pylint activities workflows entities server metrics usecases tests
	poetry run python3 -m pylint usecases api services workflows

test:
# can be updated to use pytest instead
	poetry run python -m unittest discover -p '*_test.py' -s tests -t . 

lint-fix:
	poetry run python3 -m ruff check api activities workflows entities server metrics usecases tests --fix

server-start:
	poetry run python3 main.py

worker-start:
	poetry run python3 worker.py

check: format lint test