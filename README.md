# iDEP: Integrated Differential Expression and Pathway analysis


[iDEP](http://ge-lab.org/idep/) is a Shiny app for analyzing RNA-seq or other transcriptomic data: see the [documentation](https://idepsite.wordpress.com/) and [paper](https://bmcbioinformatics.biomedcentral.com/articles/10.1186/s12859-018-2486-6). It incorporates the annotations of 220 animal and plant genomes from Ensembl BioMart as of 6/4/2018. Additional reference data from KEGG, Reactome, MSigDB (human), GSKB (mouse) and araPath (arabidopsis) are also made available. For feedbacks or data contributions (genes and GO mapping of any species), please contact us or visit our homepage. Feel free to send us suggestions to help improve iDEP.

## iDEP is a web application hosted at PLACEHOLDER (ours is a fork of http://bioinformatics.sdstate.edu/idep/)

## Local installation
Local installation of this software is possible through the steps below.

1. Clone the repository (it is a private repo, so you will be prompted for credentials):

```
https://github.com/compbiocore/idep-fork.git
```

2. Run the `run_idep_with_data.sh` script:

```
sudo sh run_idep_with_data.sh
```

This command will download a large docker image (~25 GB) containing the iDEP files and the associated data.

3. Once the script is running, open a browser window and visit the URL:

```
127.0.0.1/idep/
```

or, equivalently:

```
localhost/idep/
```

Please note that some of the functions available through iDEP are memory intensive and may not be runnable on older machines with limited memory, especially when attempting to analyze large datasets.  In this case, the CBC's server-hosted iDEP instance should be used instead.

## To install iDEP as a server, follow the following instructions:

Requirements
+ Storage should be more than 40 GB
+ Memory should be more than 2 GB

A [user](https://github.com/wresch) has contributed scripts to install a standalone version using [Singularity](https://www.sylabs.io/). Following the instruction in this [folder.](https://github.com/iDEP-SDSU/idep/tree/master/singularity_standalone)  

## Quickstart (Setup from Scratch)

The following are instructions based on [Docker](https://www.docker.com/) and have only been tested on Ubuntu, but should work on most Linux distros.

1. Clone the repository (it is a private repo, so you will be prompted for credentials):

```
https://github.com/compbiocore/idep-fork.git
```

2. Run setup script in the repo's root directory:

```
sudo sh setup.sh
```

Wait until the script shows 'iDEP is ready.' It can take several hours, as the script installs dozens of R packages and also copies a large database automatically.

3. Start system:

**Warning: iDEP is not compatible with docker-compose version 1.23** - newer and some older versions will work (1.24.0 is recommended).

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

## Advanced Setup (Manual Download)

It is possible to set up iDEP without downloading the data via the setup script.  To do so, create a local data directory that mimics the directory structure of this section of the setup script:
```
mkdir data
cd data
mkdir data92
cd data92
```

i.e. `/path/data/data92`, with all references then expanded into that innermost subdirectory.  Then, substitute that path for the left side of the mount directive on line 10 of `docker-compose.yml`, replacing `./data/`.

Once that is done, prepare the two docker images by running the following script:

```
bash prepare-docker.sh
```

The script will pull the R image (~5 minutes) and build the proxy (<10 seconds) but take no other action.  This approach has not yet been tested.


## Documentation (External)
https://idepsite.wordpress.com/
http://docs.rstudio.com/shiny-server/


## Resources
### docker-compose documentation
https://docs.docker.com/compose/reference/overview/
