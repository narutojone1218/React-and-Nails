FROM convox/rails

RUN apt-get -yy install git curl libpq-dev libhiredis-dev libmagickwand-dev imagemagick pkgconf libcurl4-gnutls-dev libxml2 libxml2-dev libxslt1-dev

# copy only the files needed for bundle install
# uncomment the vendor/cache line if you `bundle package` your gems
COPY Gemfile      /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
# COPY vendor/cache /app/vendor/cache
RUN bundle install

# copy just the files needed for assets:precompile
COPY Rakefile   /app/Rakefile
COPY config     /app/config
COPY public     /app/public
COPY app/assets /app/app/assets
COPY . /app
RUN bundle exec rake assets:precompile
# copy the rest of the app
#COPY . /app