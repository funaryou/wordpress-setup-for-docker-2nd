FROM wordpress:latest
WORKDIR /workdir



# 必要なパッケージをインストール
RUN apt-get update && apt-get install -y \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libpng-dev \
    libwebp-dev \
    zlib1g-dev \
    && rm -rf /var/lib/apt/lists/*

# PHP拡張モジュールをインストール
RUN docker-php-ext-configure gd --with-freetype --with-jpeg --with-webp \
    && docker-php-ext-install -j$(nproc) gd

# conf.iniを自動生成
RUN echo "upload_max_filesize = 64M\npost_max_size = 64M" > /usr/local/etc/php/conf.d/conf.ini
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]