ARG RUBY_VERSION=3.2.3
FROM ruby:$RUBY_VERSION-slim as base

# Rack app lives here
WORKDIR /app

# Install required packages
RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y \
    build-essential \
    git \
    curl \
    libssl-dev \
    pkg-config \
    && rm -rf /var/lib/apt/lists/*

# Update gems and bundler
RUN gem update --system --no-document && \
    gem install -N bundler


# Throw-away build stage to reduce size of final image
FROM base as build

# Install application gems
COPY Gemfile* .
RUN bundle install


# Final stage for app image
FROM base

# Run and own the application files as a non-root user for security
RUN useradd ruby --home /app --shell /bin/bash

# Create _site directory for Jekyll output and set permissions
RUN mkdir -p /app/_site && \
    chown -R ruby:ruby /app/_site

USER ruby:ruby

# Copy built artifacts: gems, application
COPY --from=build /usr/local/bundle /usr/local/bundle
COPY --from=build --chown=ruby:ruby /app /app

# Copy application code
COPY --chown=ruby:ruby . .

# Start the server
EXPOSE 8080
ENV JEKYLL_ENV=production
CMD ["bundle", "exec", "jekyll", "serve", "--port", "8080", "--host", "0.0.0.0", "--no-watch"]
