images := \
	base \
	influxdb

build build : $(images)
push push : $(images)

$(images)::
	$(MAKE) -C $@ $(MAKECMDGOALS)

clean:
	../tools/destroy-docker-images.sh