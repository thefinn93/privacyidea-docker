# PrivacyIdea Docker


**This is a work in progress and will not work right out of the box, or possibly at all**

This repo represents my attempts to build a resaonable PrivacyIdea docker image. 

Alternatives/what about...
* The [official one](https://github.com/privacyidea/docker) doesn't seem to have been updated since 2014.
  It uses Ubuntu Trusty and doesn't seem like it will work with current privacyidea. I did not actually try.
* [This one](https://github.com/pasientskyhosting/ps-privacyidea), referenced on the forums, uses supervisord and runs
  a number of processes in the container, including the database server (!?).
