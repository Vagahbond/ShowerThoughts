FROM ruby:2.7.0
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client git
RUN mkdir /myapp









COPY . /myapp/

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]


# Start the main process.
workdir /myapp
RUN bundle install
CMD RAILS_ENV=${RAILS_ENV} bundle exec rails db:create db:migrate db:seed --trace &&  bundle exec rails s -p 3000 -b '0.0.0.0' 
