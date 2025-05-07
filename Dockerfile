# FROM mathcomp/mathcomp:2.4.0-coq-8.20
FROM coqorg/coq:latest

RUN sudo apt-get update && \
    sudo apt-get install -y python3-virtualenv

RUN virtualenv -p python3 /home/coq/venv && \
    . /home/coq/venv/bin/activate && \
    pip install --upgrade pip && \
    pip install flask

COPY main.py /home/coq/main.py
COPY run.sh /home/coq/run.sh

EXPOSE 5000

CMD ["sh", "/home/coq/run.sh"]
