# murmur

Modified from [fculpo/murmur] (https://hub.docker.com/r/fculpo/murmur/)

## Description

This is a Docker Container using [Busybox] (https://busybox.net/) and a development snapshot of [Murmur] (https://wiki.mumble.info/wiki/Main_Page).

It's configured to look for the configuration file in `/etc/murmur.ini` and default db will be at `/home/murmur/murmur.sqlite`.

## Usage

To run the Container without the data being persistent:

```bash
$ docker run -d -p 64738:64738 -p 64738:64738/udp lauwarm/murmur
```

To make the sqlite database persistent:

```bash
$ docker run -d -p 64738:64738 -p 64738:64738/udp \
    -v /path/to/data:/home/murmur lauwarm/murmur
```

To supply your own murmur.ini:

```bash
docker run -d -p 64738:64738 -p 64738:64738/udp \
    -v /path/to/murmur.ini:/etc/murmur.ini lauwarm/murmur
```

Combine both, to make data persistent and supply your own murmur.ini:

```bash
docker run -d -p 64738:64738 -p 64738:64738/udp \
    -v /path/to/data:/home/murmur \
    -v /path/to/murmur.ini:/etc/murmur.ini lauwarm/murmur
```

## Important notes

### Getting the super-user password

On first run, if you don't already have an existing state database, you'll want
to look at the logs for your container to get the super-user password:

```bash
$ docker logs murmur 2>&1 | grep Password
<W>2014-07-27 01:41:31.256 1 => Password for 'SuperUser' set to '(mAq3hkwnkD'
```

### Providing your own murmur.ini

If you don't set `uname=murmur` in your murmur.ini, murmur will run as root and db will be created at `/etc/murmur.sqlite`
