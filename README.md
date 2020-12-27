# docker_sparta_dsmc
dockerfile to learn [sparta DSMC code](https://github.com/sparta/sparta)
* source tree is under `home/user/sparta-master
```
    host$ docker run -it -d -v `pwd`:/home/sparta --rm --name cnt1 natsumizu/sparta_dsmc:0.1 /bin/bash
    host$ docker attach cnt1

    user@xx:~$ pwd
    /home/user
    user@xx:~$ ls
    sparta-master
    user@xx:~$ cmake --version
    cmake version 3.19.2
    user@xx:~$ which cmake
    /usr/local/bin/cmake
    
```
