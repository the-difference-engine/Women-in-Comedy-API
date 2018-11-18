FROM ruby:2.5.0

RUN apt-get update
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -
RUN apt-get install -y nodejs postgresql postgresql-contrib

RUN mkdir /code
WORKDIR /code
COPY . /code/

RUN gem install bundler
RUN bundle install --jobs=4
RUN gem install rerun

ENTRYPOINT ["./docker-entrypoint.sh"]