Linux Interview Question
========================

## Question

Find all files in hadoop configuration directory (`/etc/hadoop/conf`) with "yarn.resourcemanager.address" in linux server.

## Answer

We can simply use *grep* command with option '-r', which is to read all files under each directory recursively.

```shell
grep -r "yarn.resourcemanager.address" /etc/hadoop/conf
```

