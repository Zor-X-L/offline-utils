../repoquery-recursive.py docker device-mapper-libs device-mapper-event-libs \
	docker-compose docker-distribution | wget -i - && \
	rm -f *i686*.rpm
