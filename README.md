# PrivacyIdea Docker


**This is a work in progress and will not work right out of the box, or possibly at all**

This repo represents my attempts to build a resaonable PrivacyIdea docker image. 

## Usage
This is what I'm running to test with. Currently doesn't work:

```
# Build the image
docker build -t privacyidea .

# Create a directory on the host to keep data in
mkdir /tmp/privacyidea-data

# Initialize the database
docker run -ti -v /tmp/privacyidea-data:/data -p 5000:5000 -e PI_LOGLEVEL=DEBUG privacyidea init

# Add a new user
docker run -ti -v /tmp/privacyidea-data:/data -p 5000:5000 -e PI_LOGLEVEL=DEBUG privacyidea admin add admin

# Run the server
docker run -ti -v /tmp/privacyidea-data:/data -p 5000:5000 -e PI_LOGLEVEL=DEBUG privacyidea runserver --port 5000 --host 0.0.0.0
```

Alternatives/what about...
* The [official one](https://github.com/privacyidea/docker) doesn't seem to have been updated since 2014.
  It uses Ubuntu Trusty and doesn't seem like it will work with current privacyidea. I did not actually try.
* [This one](https://github.com/pasientskyhosting/ps-privacyidea), referenced on the forums, uses supervisord and runs
  a number of processes in the container, including the database server (!?).
