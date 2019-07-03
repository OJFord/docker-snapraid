# snapraid

All credit for the file-system itself to amadvance/snapraid.

## Usage

Image is available at:
```
docker.io/ojford/snapraid
```

Data and parity disks are expected to be mounted at:
```
/mnt/{data,parity}/
```

An additional volume for snapraid.content (there must be P+1 for P parity mounts) is expected at:
```
/var/snapraid
```


## Licence

GPL v3.0 as per amadvance/snapraid contained.
