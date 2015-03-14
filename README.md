# Docker for isolated Heroku developmemt and dev/prod parity

Docker containers are great for giving you and isolated consistent configuration for any task you need to perform. This image lets you easily interact with heroku from any number of user accounts. The image contains heroku toolbelt and sets up an arbitrary directory on your home machine as the user home directory. This lets you easily switch between users, for example:

```
$ docker run -v /Users/myosuser/heroku/personal:/hdev -t -i jesperfj/hdev-base bash
hdev@8628ced3a8af:~$ heroku auth:whoami
johnny3141@gmail.com
hdev@8628ced3a8af:~$ exit
$ docker run -v /Users/myosuser/heroku/work:/hdev -t -i jesperfj/hdev-base bash
hdev@f0c53ff6f65a:~$ heroku auth:whoami
jjohnson@acmecorp.com
```

In other words, you get two benefits from this docker based approach:

* No need to install toolbelt locally
* Easy switch between multiple accounts

This image will probably not suffice to run your code since it may not have the right language runtime installs. But you can fix that by building images on top of this one.
