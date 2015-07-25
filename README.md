Docker-simplevault
==================

Docker image for [the password manager Simplevault](http://simplevault.sourceforge.net/).

**WARNING: this container run with HTTP by default. It is in your responsability to secure the service with an HTTPS proxy (by using for instance [a proxy container like nginx-proxy](https://github.com/jwilder/nginx-proxy)).**

Usage
----

To run it:
```docker run -d -P pierre-jean/simplevault```

It is recommanded to mount a volume to be able to reuse the password database (the text file `simplevault.txt`) for later use:
```docker run -d -P -v /var/lib/simplevault/ pierre-jean/simplevault```

If you want to bind the volume with an existing password database file on your host,use
```docker run -d -P -v /path/to/simplevault/host/directory:/var/lib/simplevault/```
In that case, the simplevault file present in /path/to/simplevault/host/directory must be readable and writable by the process.
