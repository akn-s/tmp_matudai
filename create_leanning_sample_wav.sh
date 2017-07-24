docker run --rm -it -v $(pwd)/src:/root/src sox /bin/bash -c "cd && cd src/sounds/ && python create_learning_sample_wav.py"
