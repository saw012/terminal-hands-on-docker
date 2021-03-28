FROM ubuntu:20.04

WORKDIR /home/user/bin
ENV HOME=/home/user \
    DEBIAN_FRONTEND=noninteractive \
    TZ=Asia/Tokyo \
    PATH=$PATH:/home/user/bin
WORKDIR /home/user
COPY samples ./samples
COPY movies ./movies
COPY images ./images

RUN adduser user \
    && sed -i -e 's/# deb-src/deb-src/g' /etc/apt/sources.list \
    && apt-get update -y \
    && apt-get install -y tzdata wget curl git htop \
                        # 「libsixelを使ってみる」より
                        build-essential libsixel-bin libsixel-dev \
                        # 「sayakaちゃんを使ってみる」より
                        freebsd-buildutils libjpeg-dev bmake libpng-dev libmbedtls-dev pkgconf \
                        # 「FFmpeg-SIXELを使ってみる」より
                        python3-pip \
                        # 「ImageMagickを使ってみる」より
                        imagemagick \
    # 「w3m-sixelを使ってみる」、「FFmpeg-SIXELを使ってみる」より
    && apt-get build-dep -y w3m ffmpeg \
    # 「LaTeX to SIXEL を使ってみる」より
    && apt-get install -y texlive-lang-japanese texlive-lang-cjk texlive-fonts-recommended texlive-fonts-extra dvipng \
    # 「FFmpeg-SIXELを使ってみる」(続き)、「matplotlib-sixelを使ってみる」より
    && pip3 install youtube-dl matplotlib \
    # キャッシュを綺麗にしておく
    && apt-get clean \
    # パーミッション弾かれないように、userにしておく
    && chown -R user:user /home/user

SHELL ["/bin/zsh", "-c"]
USER user