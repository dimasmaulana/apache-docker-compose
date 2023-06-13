# Docker Compose Configuration for Web Application

This `docker-compose.yml` file defines a Docker Compose setup for a web application.

## Services

* **app:** This service runs the main application.

## Configuration

* **restart:** `always` ensures the container restarts automatically if it stops.
* **network_mode:** `host` allows the container to access the host machine's network directly.
* **build:** `.` instructs Docker Compose to build the image from the current directory's Dockerfile.
* **volumes:** Several volumes are mounted to provide persistent storage and configuration:
    * **`./log:/var/log/apache2`:** Mounts the `log` directory from the host machine to the Apache2 logs directory inside the container.
    * **`./letsencrypt:/etc/letsencrypt`:** Mounts the `letsencrypt` directory for Let's Encrypt certificates.
    * **`./sites-enabled:/etc/apache2/sites-enabled`:** Mounts the `sites-enabled` directory for Apache virtual hosts.
    * **`./conf-available/other-vhosts-access-log.conf:/etc/apache2/conf-available/other-vhosts-access-log.conf`:** Mounts a specific configuration file for access logs.
    * **`./html:/var/www/html`:** Mounts the `html` directory for serving web content.

## Note

This configuration assumes you have a Dockerfile and necessary files (like `log`, `letsencrypt`, `sites-enabled`, `conf-available`, and `html`) in your project directory. 

## License

This project is licensed under the [MIT License](LICENSE).

