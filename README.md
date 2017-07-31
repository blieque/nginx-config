# nginx Configuration

This is a collection of [nginx](https://nginx.org/) configuration file snippets to make administration of a webserver with multiple virtual hosts easier, cleaner, and more secure.

The `nginx` directory of the repository can be dropped into `/etc` as-is and will work (with nxing 1.13.0+). In its default form it serves the domain `example.com` (and `www.example.com`) and the secondary domain `subdomain.example.com`. Modify and add files in the `nginx/hosts` directory to change this.

The snippets files in `nginx/snippets` are intended to be included in virtual host configuration files. The snippets do as follows:

- `common.conf` – `server` block configuration, including clean URLs (without ".html", ".php"), PHP handling, pretty HTTP error pages, basic caching, and hiding of hidden files.
- `ssl-common-no-listen.conf` – SSL configuration for HTTPS hosts, using secure ciphers and protocols, and using stapling to ease client load. This file does not include a `listen` directive; it's recommended that you instead include one of the following two files.
- `ssl-common.conf` – Listens on port 443 with HTTP/2. Includes `ssl-common-no-listen.conf`.
- `ssl-common-default.conf` – Listens on port 443 with HTTP/2, and uses the `default_server` parameter of the `listen` directive. This should only be used for a single `server` block. Includes `ssl-common-no-listen.conf`.
- `fastcgi-php.conf` – FastCGI configuration for PHP. This includes the parameters distributed with nginx plus a few, and listens on the Unix socket `/run/php/php7.0-fpm.sock`.
- `http-errors.conf` – Makes 4xx- and 5xx-code HTTP error pages a bit prettier. This will require [http-errors](https:/github.com/blieque/http-errors).
- `proxy-common.conf` – Configuration for reverse proxying to another server, such as Node.js API.

## License

I've used the same license that nginx itself is distributed by the terms of. This is simply to avoid confusion or any license issues. Submit an issue if this causes a problem.
