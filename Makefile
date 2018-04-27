.PHONY: docker admin runserver

LOCAL_DATA_VOLUME=/tmp/privacyidea-data

docker:
	docker build -t privacyidea .

init: $(LOCAL_DATA_VOLUME) secretkey
	docker run -v $(LOCAL_DATA_VOLUME):/data --env-file=secretkey privacyidea init

admin: $(LOCAL_DATA_VOLUME) secretkey init
	docker run -v $(LOCAL_DATA_VOLUME):/data -ti --env-file=secretkey privacyidea admin add admin

runserver: $(LOCAL_DATA_VOLUME) secretkey init
	docker run -v $(LOCAL_DATA_VOLUME):/data -p 5000:5000 -ti --env-file=secretkey privacyidea runserver -p 5000 -h 0.0.0.0


$(LOCAL_DATA_VOLUME):
	mkdir $(LOCAL_DATA_VOLUME)

secretkey:
	@echo Creating secretkey
	@echo SECRET_KEY=$(shell cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1) > secretkey
