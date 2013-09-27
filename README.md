ModCloth Docker Layers
======================

This is a collection of layers meant to be published to ModCloth's Docker Registry.  Nothing in here should be
anything like an "application container", but instead just foundational layers.  Because of this layered
relationship, the directories in this repository are nested accordingly.  In order to get an idea of the hierarchy,
perhaps use a tool like `tree` (which is `brew`-installable) like so:

``` bash
tree -C
```

## Initial Vagrant setup

This repository contains a `Vagrantfile` at the top level which is meant to be used to create a Linux VM
environment in which `docker` can be used.  [Install vagrant here](http://downloads.vagrantup.com/tags/v1.3.3),
then do this:

``` bash
vagrant up
```

If anything explodes, you should [yell at someone](mailto:d.buch@modcloth.com).

## Building images
Each directory contains a `Makefile` (based on `/.tmp/Makefile`) which may be used to build images from the
`Dockerfile`s found throughout:

``` bash
# Move into a directory containing a Dockerfile
cd /vagrant/build-essential/nodejs

# Build the container
make container
```

## Pushing images

Once the images are built, they should be uploaded to the ModCloth Docker Registry at `dr.prod.modcloth.com` using
`docker push` (after `docker login`) like so:

``` bash
# Make sure you're logged into the ModCloth Docker Registry
sudo docker login dr.prod.modcloth.com

# Enter username, password, email # after which there will be
# a ~/.dockercfg containing the auth JSON.

# Push an image by "repository name" and "tag"
sudo docker push dr.prod.modcloth.com/nodejs:0.1.0
```
