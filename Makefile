.PHONY: mmdetection

mmdetection: requirements.txt docker/DockerfilePaperspace
	docker build \
		-t mmdetection:V100 . \
		-f docker/DockerfilePaperspace	

clean:
	rm -rf build/
	docker rmi -f mmdetection:latest
