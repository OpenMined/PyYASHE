.PHONY: run_example compile_and_run build run dev shell test

compile:
	swig -c++ -python -py3 YASHE.i
	python3 setup.py install

test:
	python3 tests.py

compile_and_test: compile
	make test

# Build the Docker environment
build:
	docker build -t openmined/pyyashe .

# Run the source code inside the Docker environment
run:
	docker run -i -t openmined/pyyashe make test

# Run *my* source code with the Docker environment
dev:
	docker run -i -t -v "$(PWD):/PyYashe" openmined/pyyashe make compile_and_test

# Open a shell inside the Docker environment, for debugging
shell:
	docker run -i -t -v "$(PWD):/PyYashe" openmined/pyyashe sh

