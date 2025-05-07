# FROM mathcomp/mathcomp:2.4.0-coq-8.20
FROM coqorg/coq:latest

RUN apt-get update && \
    apt-get install -y python3-virtualenv

RUN virtualenv -p python3 /opt/venv && \
    . /opt/venv/bin/activate && \
    pip install --upgrade pip && \
    pip install flask

COPY main.py /opt/main.py

EXPOSE 5000

CMD ["python3", "/opt/main.py"]