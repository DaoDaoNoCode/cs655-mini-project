#!/usr/bin/env bash 

# retrieve the file from the source server
curl -o test.flv -w 'Total: %{time_total}s\n' 164.67.126.36/video_83M.flv

# retrieve the file from the cached server
curl -o test.flv -w 'Total: %{time_total}s\n' 192.1.242.153/video_83M.flv