# Use the official Ruby 2.6.1 image as the base image
FROM ruby:2.6.10

# Install essential dependencies
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs npm

# Set the working directory inside the container
WORKDIR /usr/src/app

RUN gem install bundler
RUN npm install -g yarn
# Copy the Gemfile and Gemfile.lock into the container
COPY Gemfile* ./

# Install the application's dependencies
RUN bundle install 

# Copy the rest of the application code into the container
COPY . /usr/src/app

# Expose port 3000 for the Rails application
EXPOSE 3000

# Start the Rails application
CMD ["rails", "server"]
