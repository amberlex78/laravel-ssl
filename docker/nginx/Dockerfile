FROM nginx:alpine

# Remove default Nginx configurations
RUN rm -rf /etc/nginx/sites-available/default /etc/nginx/sites-enabled/default

# Create directory for SSL certificates
RUN mkdir -p /etc/nginx/cert \
    && chmod -R 600 /etc/nginx/cert

# Copy custom Nginx configuration
COPY nginx.conf /etc/nginx/nginx.conf

# Copy SSL certificates
COPY cert /etc/nginx/certs/

# Expose ports 80 and 443
EXPOSE 80 443
