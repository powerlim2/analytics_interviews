Linux CMD Interview Question
============================

Due to the large size of the data that a data scientist deals with, he often needs to perform analysis in a virtual machine.
Being able to do simple setups, configurations and data manipulations in linux virtual machines is often required to data scientists.
(e.g. *Hadoop Yarn, GCP, AWS, R, Rstudio-server, Rstudio-shiny, Python, Java, etc.*)


## Question

Find all files in hadoop configuration directory (`/etc/hadoop/conf`) with "yarn.resourcemanager.address" in linux server.

## Answer

We can simply use *grep* command with option '-r', which is to read all files under each directory recursively.

```shell
grep -r "yarn.resourcemanager.address" /etc/hadoop/conf
```

