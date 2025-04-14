# Use official Ruby image as a base image
FROM ruby:2.7

# Set environment variables
ENV LANG C.UTF-8
ENV RACK_ENV production

# Install dependencies
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

# Set the working directory to /app
WORKDIR /app

# Copy the Gemfile and Gemfile.lock
COPY Gemfile* ./

# Install Ruby gems
RUN bundle install --without development test

# Copy the entire app
COPY . .

# Precompile assets (if necessary)
# RUN rake assets:precompile

# Expose the port the app will run on
EXPOSE 4567

# Start the Sinatra app
CMD ["ruby", "app.rb"]
