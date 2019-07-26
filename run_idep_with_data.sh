#!/bin/bash

docker run --expose 3838 -p 80:3838 -v $PWD/./shinyapps/:/srv/shiny-server/ -v $PWD/./countsData/:/srv/countsData/ -v $PWD/./shinylog/:/var/log/shiny-server/ -v $PWD/./config/:/etc/shiny-server/ -v $PWD/./classes/:/usr/local/src/myscripts/ compbiocore/idep-with-data:latest /usr/bin/shiny-server.sh