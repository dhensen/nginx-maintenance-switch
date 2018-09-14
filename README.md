# Nginx maintenance switch

There is an upstream web application that needs to be served.
It goes into maintenance by serving a local available static html site instead
of the upstream.

## Prerequisites
You need to have:
- docker
- git

## Reverse proxy + fake app
The docker-compose will launch:
- __a reverse proxy__ that has a maintenance page. This maintenance page consist of html plus statis assets as opposed to only a single html with everything included. This allows you to design a maintenance page including css, images and javascript.
- __a fake app__ that just serves a html page with static content. The same structure as the maintenance page is used deliberatly to show that the switch really happens instantly.

> Disclaimer: take extra care when adding your own caching rules on top of this example

## Getting started
To get started run the following commands on the command line
```
git clone https://github.com/dhensen/nginx-maintenance-switch.git
(or if you prefer ssh: git clone git@github.com:dhensen/nginx-maintenance-switch.git)
cd nginx-maintenance-switch
docker-compose up -d
```

Now go to http://localhost and you will see a fake app with green text on black background.

> This docker-compose will launch a container mapped to port 80 locally. So if you already
have something listening on port 80, either adjust this docker-compose and nginx config, or temporarily bring down your app already running on port 80.

## Toggle maintenance mode

When starting maintenance mode is off. To turn on maintenance mode you need to create `reverse_proxy/html/maintenance.txt`, this is done automatically by `toggle_maintenance.sh`

From the repository root execute:
```
$ ./toggle_maintenance.sh
maintenance mode: ON
$ ./toggle_maintenance.sh
maintenance mode: OFF
```

Toggle it on, then go to http://localhost to see the maintenance page in red text on a black background. After toggling you might need to hard refresh (CTRL+F5).

## Shortcommings
- The http status code 503 is not used