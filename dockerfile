# use a nice base image
FROM debian
# install dependencies and remove cache
RUN apt update && \
	apt install -y \ 
	python \
	python-dev \
	python-pip \
	build-essential && \
	rm -rf /var/lib/apt/lists/*
# copy code into container
COPY . /codechan
RUN pip install -r /codechan/requirements.txt
EXPOSE 5000
CMD ["python", "/codechan/run.py"]
