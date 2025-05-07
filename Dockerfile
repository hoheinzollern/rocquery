FROM mathcomp/mathcomp:2.4.0-rocq-prover-9.0

RUN sudo apt-get update && \
    sudo apt-get install -y python3-virtualenv

WORKDIR /home/coq

RUN virtualenv -p python3 venv
RUN . ./venv/bin/activate && \
    pip install --upgrade pip && \
    pip install flask gunicorn

COPY main.py main.py
COPY run.sh run.sh

CMD ["sh", "run.sh"]
