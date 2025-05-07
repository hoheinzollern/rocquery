FROM mathcomp/mathcomp:2.4.0-rocq-prover-9.0

RUN sudo apt-get update && \
    sudo apt-get install -y python3-virtualenv

RUN virtualenv -p python3 /home/coq/venv && \
    . /home/coq/venv/bin/activate && \
    pip install --upgrade pip && \
    pip install flask gunicorn

COPY main.py /home/coq/main.py
COPY run.sh /home/coq/run.sh

WORKDIR /home/coq

CMD ["sh", "/home/coq/run.sh"]
