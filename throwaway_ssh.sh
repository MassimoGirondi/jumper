#!/bin/bash
sudo docker run --rm -it \
	-p45678:2222 \
	--hostname jumper --name jumper \
	jumper 
