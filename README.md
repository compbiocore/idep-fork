# iDEP: Integrated Differential Expression and Pathway analysis


[iDEP](http://ge-lab.org/idep/) is a Shiny app for analyzing RNA-seq or other transcriptomic data: see the [documentation](https://idepsite.wordpress.com/) and [paper](https://bmcbioinformatics.biomedcentral.com/articles/10.1186/s12859-018-2486-6). It incorporates the annotations of 220 animal and plant genomes from Ensembl BioMart as of 6/4/2018. Additional reference data from KEGG, Reactome, MSigDB (human), GSKB (mouse) and araPath (arabidopsis) are also made available. For feedbacks or data contributions (genes and GO mapping of any species), please contact us or visit our homepage. Feel free to send us suggestions to help improve iDEP.

## iDEP is a web application hosted at PLACEHOLDER (ours is a fork of http://bioinformatics.sdstate.edu/idep/)

## Local installation
Local installation of this software is possible through the steps below, but it is not supported by our group (see the parent repository for more information). 

## To run iDEP on your laptop, you will need to download the database and follow these instructions:

1. Upgrade to the most recent version of R and Rstudio.
2. Install all the R packages by running [this script](https://github.com/iDEP-SDSU/idep/blob/master/classes/librarySetup.R) under RStudio. This step will take a minimum of 3 hours.
3. Download the iDEP source code and example data files from Github. The best is to click the Clone or Download button on this [page](https://github.com/compbiocore/idep-fork). And unzip to a folder such as ~/IDEP.
4. Download all database files. This process can take several hours. Unzip this files to a folder within the iDEP folder such as `~/IDEP/data/data92`. 
[pathwayDB](https://sdsu.box.com/shared/static/c24f792ojoikpzu0lkpng8uuf9ychwm7.gz), 
[Motif](https://sdsu.box.com/shared/static/9v1ao6mwhduvrcx793j3answph9gqnkt.gz), 
[geneInfo](https://sdsu.box.com/shared/static/mns0k1uvwtfnsohoc89b984ih36nmnz9.gz), 
[data_go](https://sdsu.box.com/shared/static/qwpdh36vcisgy1hcmadck8i8ezhvr2fh.gz), 
[convertIDs](https://sdsu.box.com/shared/static/sorewt7w6iypmhg2k2xhyi8myeit156o.gz)
5. Start RStudio and load the ui.R and server.R scriptS; then, click on Run app. 

## To install iDEP as a server, follow the following instructions:

Requirements
+ Storage should be more than 200GB
+ Memory should be more than 2GB

A [user](https://github.com/wresch) has contributed scripts to install a standalone version using [Singularity](https://www.sylabs.io/). Following the instruction in this [folder.](https://github.com/iDEP-SDSU/idep/tree/master/singularity_standalone)  

The following are instructions based on [Docker](https://www.docker.com/) and have only been tested on Ubuntu, but should work on most Linux distros.
1. Clone the repository (it is a private repo, so you will be prompted for credentials):

```
https://github.com/compbiocore/idep-fork.git
```

2. Run setup script in the repo's root directory:
```
sudo sh setup.sh
```
Wait until the script shows 'iDEP is ready.' It can take several hours, as the script installs dozens of R pacakges and also copies a large database automatically.

3. Start system:

**iDEP is not compatible with docker-compose version 1.23** - newer and some older versions will work (1.24.0 is recommended).

```
sudo docker-compose up -d --scale webapp=4 
```
After approximately 20 seconds, the server will be running.
 
Note: `webapp=4` indicates the web application count. This count is currently hardcoded into the proxy, so the proxy docker image must be rebuilt in order to use a number of worker processes other than 4.  Please contact Andrew Leith if you wish to change this number.

You can bring everything down, removing the containers entirely, with the down command. Pass `--volumes` to also remove the data volume.
```
sudo docker-compose down --volumes
```

Changes to the docker composition, such as substituting alternative file paths for the mounted volumes, can be done without rebuilding containers.  Simply use `sudo docker-compose down --volumes`, make the changes, and then run `sudo docker-compose up -d --scale webapp=4` again.

## Advanced Setup

It is possible to set up iDEP without downloading the data via the setup script.  To do so, create a local data directory that mimics the directory structure of this section of the setup script:
```
mkdir data
cd data
mkdir data92
cd data92
```

i.e. `/path/data/data92`, with all references then expanded into that innermost subdirectory.  Then, substitute that path for the left side of the mount directive on line 10 of `docker-compose.yml`, replacing `./data/`.  This approach has not yet been tested.


## Documentation
https://idepsite.wordpress.com/
http://docs.rstudio.com/shiny-server/


## Resources
### docker-compose documentation
https://docs.docker.com/compose/reference/overview/
