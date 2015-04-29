# Custom Console for Rancheros

This include a tinycore image with git and bash install.

## Building 

### Requirements

- Docker 1.5.0
- Make changes and push the Repo

# Installing Packages

- Edit Dockerfile
- tce-load -wic packagename

## Testing

docker pull console-rancheros

docker run -i -t console-rancheros bash

