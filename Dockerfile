FROM python:3.7
WORKDIR /app
COPY Application/ /app
RUN pip install --upgrade pip
RUN pip install -r Application/requirements.txt
RUN export $(cat .env | xargs)
CMD [ "python", "hello.py" ]
