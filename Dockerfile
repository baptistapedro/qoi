FROM fuzzers/libfuzzer:12.0

RUN apt-get update
RUN apt install -y build-essential wget git clang cmake  automake autotools-dev  libtool zlib1g zlib1g-dev libexif-dev
RUN git clone https://github.com/phoboslab/qoi.git
WORKDIR /qoi
RUN clang -g -O0 -fsanitize=fuzzer,address qoifuzz.c -o x

ENTRYPOINT []
CMD ["/qoi/x"]
