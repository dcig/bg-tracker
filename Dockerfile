FROM ruby:2.6.3
RUN apt-get update -qq && apt-get upgrade -qqy
RUN apt-get -qqy install cmake
RUN gem install bundler
RUN gem update --system

ENV APP_HOME /app
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

ADD .ruby-version $APP_HOME/
ADD Gemfile* $APP_HOME/

ENV BUNDLE_GEMFILE=$APP_HOME/Gemfile BUNDLE_JOBS=4 BUNDLE_WITHOUT=production:staging

RUN bundle install

COPY . $APP_HOME

CMD ["echo", "Commands: `bin/rails s -p $PORT`]