# Buffer Clone

This is a clone app of the buffer service to schedule tweets.
This project is based on gorails course "rails for beginners".
App is containerized so you can download the repo and run docker-compose
to launch the app and begin to develop.

## Requirements

1. Docker Compose.
2. Make (optional)

The Makefile inside the project have some commands to interact with the development stack.

## Usage 

Create an .env file in the root directory with the following variables

POSTGRES_USER=ruby_user
POSTGRES_PASSWORD=<your_password>

Then run the app with:

`docker-compose up`

or

`make app.start`

## Utilities

1. `make app.start`: Shut down previous containers and create new ones.
2. `make app.shell`: Let you acces to the ruby console.
3. `make docker.build`: Build the ruby image.
4. `make docker.exec`: Give you access inside ruby container.

You can check the makefile to see the equivalent commands if you don't have make installed in your system.
