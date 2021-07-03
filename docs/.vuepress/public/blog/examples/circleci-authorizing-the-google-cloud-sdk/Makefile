SHELL:/bin/bash

COMMAND_GCLOUD_AUTHENTICATE:=set -x \
	&& echo $${GCLOUD_SERVICE_KEY} > /tmp/gcloud-service-key.json \
	&& gcloud auth activate-service-account --key-file=/tmp/gcloud-service-key.json \
	&& gcloud --quiet config set project "circleci-google-cloud-sdk" \
	&& gcloud --quiet config set compute/zone "europe-west2-a" \
	&& gcloud --quiet container clusters get-credentials "circleci-google-cloud-sdk-cluster" --project="circleci-google-cloud-sdk" \
	&& gcloud --quiet auth configure-docker

.PHONY: zones_list
zones_list:
	@echo -e "\033[92m  ---> testing authentication \033[0m"
	@docker run --rm -it \
		-v /var/run/docker.sock:/var/run/docker.sock \
		-e GCLOUD_SERVICE_KEY='$(GCLOUD_SERVICE_KEY)' \
		google/cloud-sdk:latest \
		/bin/bash -c ' \
      $(COMMAND_GCLOUD_AUTHENTICATE) \
      && gcloud compute zones list \
    '

.PHONY: pods
pods:
	@echo -e "\033[92m  ---> testing authentication \033[0m"
	@docker run --rm -it \
		-v /var/run/docker.sock:/var/run/docker.sock \
		-e GCLOUD_SERVICE_KEY='$(GCLOUD_SERVICE_KEY)' \
		google/cloud-sdk:latest \
		/bin/bash -c ' \
      $(COMMAND_GCLOUD_AUTHENTICATE) \
      && kubectl get pods \
    '
