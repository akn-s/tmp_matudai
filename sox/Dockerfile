FROM centos:6.7

# mp3を使えるように
RUN yum -y update && yum -y install gcc-c++ libmad libmad-devel libid3tag libid3tag-devel lame lame-devel flac-devel libvorbis-devel madplay

# install sox with mp3
RUN yum -y install tar
RUN mkdir /usr/local/src/SoX
WORKDIR /usr/local/src/SoX

RUN curl -L https://sourceforge.net/projects/lame/files/lame/3.99/lame-3.99.5.tar.gz > lame.tar.gz
RUN tar xvfz lame.tar.gz && \
    cd lame-3.99.5 && \
    ./configure && \
    make all && \
    make install

RUN curl -L https://sourceforge.net/projects/sox/files/sox/14.4.2/sox-14.4.2.tar.gz > sox.tar.gz
RUN tar xvfz sox.tar.gz && \
    cd sox-14.4.2 && \
    ./configure && \
    make all && \
    make install

