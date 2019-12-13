FROM python:3.8.0-buster
ENV TZ=Asia/Shanghai
ENV PYPI=https://mirrors.aliyun.com/pypi/simple
ENV PIP_DEFAULT_TIMEOUT=1000
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN sed -i 's/deb.debian.org/mirrors.ustc.edu.cn/g' /etc/apt/sources.list
RUN apt-get update && apt-get upgrade -y && apt-get install -y vim git gcc build-essential libffi-dev
RUN pip install -U pip
RUN pip install poetry==1.0.0 -i $PYPI
RUN poetry config virtualenvs.create false --local
RUN pip install cython numpy pandas -i $PYPI
RUN pip install gunicorn pycrypto ipython ipdb mypy flask sqlalchemy django celery redis \
pyjwt pymysql requests graphene pytest jupyter  -i $PYPI
