FROM cangjians/libcangjie:latest
MAINTAINER Cangjians (https://cangjians.github.io)

# basic environment for building
WORKDIR /usr/local/src/pycangjie

# copy source files to build
COPY "." "./"

# build the library
RUN ./autogen.sh --prefix=/usr && \
  make && make install

# manually adapt to Debian specific dist-packages practice
RUN export PYTHONPATH=$(python3 -c "import os; print(os.path.dirname(os.__file__))") && \
  mkdir -p $PYTHONPATH/dist-packages && \
  ln -s $PYTHONPATH/site-packages/cangjie $PYTHONPATH/dist-packages/.

ENTRYPOINT []
CMD ["make", "check", "distcheck"]
