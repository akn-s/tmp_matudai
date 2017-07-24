FROM ubuntu:latest

# パッケージのインストールとアップデート
RUN apt-get update && apt-get -y upgrade
RUN apt-get -y install build-essential
RUN apt-get -y install zlib1g-dev \
                       libssl-dev \
                       libreadline-dev \
                       libyaml-dev \
                       libxml2-dev \
                       libxslt-dev \
                       libncurses5-dev \
                       libncursesw5-dev
RUN apt-get -y install git vim curl wget

# pyenv のインストール
RUN git clone git://github.com/yyuu/pyenv.git /root/.pyenv
RUN git clone https://github.com/yyuu/pyenv-pip-rehash.git /root/.pyenv/plugins/pyenv-pip-rehash
ENV PYENV_ROOT /root/.pyenv
ENV PATH $PYENV_ROOT/bin:$PATH
RUN echo 'eval "$(pyenv init -)"' >> .bashrc

# anaconda のインストール
ENV ANACONDA_VER 4.1.1
RUN pyenv install anaconda3-$ANACONDA_VER
RUN pyenv global anaconda3-$ANACONDA_VER
ENV PATH $PYENV_ROOT/versions/anaconda3-$ANACONDA_VER/bin:$PATH

# ライブラリのアップデート
RUN conda update -y conda
RUN pip install --upgrade pip

# OpenCV
RUN apt-get update && \
	apt-get install -y wget unzip && \
    apt-get install -y build-essential cmake git libgtk2.0-dev pkg-config libavcodec-dev libavformat-dev libswscale-dev && \
    mkdir /opencv && \
	cd /opencv && \
	wget https://github.com/Itseez/opencv/archive/3.1.0.zip && \
	unzip 3.1.0.zip && \
	cd opencv-3.1.0 && \
	mkdir build && \
	cd build && \
	cmake -D CMAKE_BUILD_TYPE=Release -D CMAKE_INSTALL_PREFIX=/usr/local -D WITH_IPP=ON .. && \
	make -j7 && \
	make install
