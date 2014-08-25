# Docker for isolated Heroku developmemt and dev/prod parity

This is a base container that installs Heroku Toolbelt on top of Heroku's Cedar 14 image. It expects to be run as the `hdev` user with the user's home directory bind mounted from the host system. This lets you do a couple of things:

* Easily have different "dev home" directories with different Heroku and other config
* Do development in a docker container specialized for your particular language and avoid polluting your host system with Java, Python, Ruby, Node, etc. stacks
* Achieve optimal dev/prod parity
* Easily keep a consistent development environment across a team of developers

## Running

This container is published to Docker Hub, so you can run it without building it locally:

```
$ docker run -v /dev-home/test:/hdev -p 5000:5000 -t -i jesperfj/hdev-base bash
```

This presumes that your "dev home" directory on the host system is located at `/dev-home` and that you want this particular run to use the `test` home directory. If you're using boot2docker, use these modifications to mount a dev home directory in your boot2docker VM (with correct uid).

Now you can log into your Heroku account:

```
hdev@cb84b9b388b8:~$ heroku login
Enter your Heroku credentials.
Email: joe@example.org
Password (typing will be hidden): 
Two-factor code: 123456
Authentication successful.
```

You can exit the container and check that a .netrc file was saved in the host system folder that was mounted:

```
$ ls -la ~/dev-home/test
total 16
drwxr-xr-x  5 joe  joe  170 Aug 25 12:33 .
drwxr-xr-x  4 joe  joe  136 Aug 25 12:31 ..
-rw-------  1 joe  joe   13 Aug 25 12:33 .bash_history
drwxr-xr-x  3 joe  joe  102 Aug 25 12:31 .heroku
-rw-------  1 joe  joe  197 Aug 25 12:32 .netrc
```

Start a new container and you'll see that you are still logged in:

```
$ docker run -v /dev-home/test:/hdev -p 5000:5000 -t -i jesperfj/hdev-base bash
hdev@860ee57d1fff:~$ heroku apps
=== My Apps
[app list]
```

There you have it: a nicely isolated environment for developing and deploying Heroku apps. We can now extend this base container for a particular language stack, [like Java](https://github.com/jesperfj/hdev-java).

