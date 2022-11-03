FROM python:3.7
WORKDIR /app
COPY . /app
RUN pip install --upgrade pip
RUN pip install -r requirements.txt
RUN export $(cat .env | xargs)
CMD [ "python", "hello.py" ]