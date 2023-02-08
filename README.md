[![publish](https://github.com/opencog/docker/actions/workflows/publish-images.yml/badge.svg)](https://github.com/opencog/docker/actions)

# OpenCog Docker library
This repository contains various docker images for demoing and using
various parts of the OpenCog project. Using the docker images here is
the easiest way to get interesting parts of OpenCog running.

By using Docker, most of the difficulty of installing and configuring
the large variety of required packages and dependencies is eliminated.
The individual docker files specify exactly what is needed to run a
system or demo.  Using these is as simple as saying `./build.sh` and
then `./run.sh`.

The most sophisticated demo is Eva, an animated female head, capable
of seeing you (via a webcam), talking to you (via a chatbot), and
engaging you (and your guests) in social interaction.  She will
make eye contact, and express her pleasure with smiles and looks
of surprise and happiness.

![Eva Splash 1](indigo/Eva-1-small.png) ![Eva Splash 2](indigo/Eva-2-small.png) ![Eva Splash 3](indigo/Eva-3-small.png)

Another particularly interesting container is that for the OpenCog to
MineCraft bridge, which allows OpenCog to operate an avatar running
around in the MineCraft world.

## Dockerfiles for Robot Operating System (ROS)
Dockerfiles for demoing and working with various different robot heads
and bodies, mostly those from Hanson Robotics. Several of the heads are
modeled with blender, and so can be usefully worked with and controlled
even without a physical robot.

These files are contained in the `hydro` and [indigo](indigo)
directories. Eva comes in two forms: a basic animation and social
interaction demo, in the [indigo/eva-owyl](indigo/eva-owyl) folder,
and a full-featured system (under heavy development, and probably broken)
in the [indigo/eva-opencog](indigo/eva-opencog) folder.  See the
README's in those directories for more info.

## Dockerfiles for OpenCog
Opencog system dockerfiles can be found in the opencog and buildbot
directories.  See [opencog's README](opencog/README.md) and
[buildbot's README](buildbot/README.md).

The Dockerfiles in the directories `opencog/tools/distcc`,
`opencog/embodiment` and `opencog/cogserver` are not detailed because
they are not in active use.

### Docker image structure:

    ├─opencog/opencog-deps:jammy
    ├─opencog/opencog-deps:latest
      ├─buildbot_* (Where * = atomspace, cogutil, opencog, moses)
      ├─opencog/cogutil:latest
        ├─opencog/opencog-dev:cli (for a dev environment)
        ├─opencog/opencog-dev:ide
        ├─opencog/atomspace
        ├─opencog/learn
        ├─opencog/lang-pairs

### Organizational Notes:
Dockerhub's copies of opencog dockerfiles are here:
https://hub.docker.com/search?q=opencog

* `opencog/opencog-deps:latest`: Ubuntu 22.04 based image with all
   OpenCog's dependencies installed. This does not need to be rebuilt,
   except to pick up the latest in version of the base OS and OS security
   patches. This is the base image for `opencog/cogutil`.

* `buildbot_*`: Is used for buildbot found [here](buildbot.opencog.org:8010)

* `opencog/cogutil`: This depends on the `opencog/opencog-deps:latest`
  image. It installs the base cogutil tools; these are shared by
  several other opencog repos. This is the base image for the
  `opencog/atomspace` image.  Dependent images will rebuild if this
   image is updated.

* `opencog/atomspace`: This depends on the `opencog/cogutil:latest`
  image. It provides the AtomSpace, RocksDB, the Cogserver, and the
  network CogStorageNode, allowing complex AtomSpace networks to
  be built.

* `opencog/learn`: This depends on the `opencog/atomspace:latest`
  image. It provides the basic development environment for the
  language learning project.

* `opencog/opencog-dev:cli`: This depends on the
  `opencog/atomspace:latest` image. It installs all supported opencog
  repos and tools, including `as-moses`.

* `opencog/opencog-dev:ide`: To be used for developing using IDEs.
   QtCreator is installed.

## Usage
* To run the demos and other containers, docker must be installed.
  Instructions can be found [here](https://docs.docker.com/installation/).
  The [Giving non-root access](https://docs.docker.com/installation/ubuntulinux/#giving-non-root-access)
  section on the page explains how to avoid having to use `sudo` all the time.

* The `docker-build.sh` file in [opencog](opencog) directory can be used
  to build the containers mentioned above. There are also many more.
  Run `./docker-build.sh -h` for usage instructions.

* To use `docker-compose`, follow the instructions in the
  [README](opencog/README.md) file in the [opencog directory](opencog).
