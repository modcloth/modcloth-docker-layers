ModCloth Docker Layers
======================

This is a collection of layers meant to be published to ModCloth's Docker
Registry.  Nothing in here should be anything like an "application container",
but instead just foundational layers. 

## Initial Vagrant setup

This repository contains a `Vagrantfile` at the top level which is meant to be
used to create a Linux VM environment in which `docker` can be used.  [Install
vagrant here](http://downloads.vagrantup.com/tags/v1.3.4), then do this:

``` bash
vagrant up
```

If anything explodes, you should [yell at someone](mailto:d.buch@modcloth.com).

## Building images
Each directory contains a `Makefile` (most (all?) of which are linked to
[/meta.mk](meta.mk)) which may be used to build images from the
`Dockerfile`s found throughout:

``` bash
# Move into a directory containing a Dockerfile
cd /vagrant/nodejs-dev

# Build the container and tag it 'latest'
make latest
```

## Pushing images

Once the images are built, they should be uploaded to the ModCloth Docker
Registry at `quay.io/modcloth` using `docker push` (after `docker login`)
like so:

``` bash
# Make sure you're logged into the ModCloth Docker Registry
sudo docker login quay.io

# Enter username, password, email # after which there will be
# a ~/.dockercfg containing the auth JSON.

# Push the image by "repository name".  All tags for the image will also be pushed.
make push
```
