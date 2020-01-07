## Simple web app Flutter project

This repo is a very simple web app with Flutter following the basic tutorial.

A working production URL is deployed at https://flutter-simple-web-app.now.sh

## Some basic commands

### Setup

* `flutter` setup was mainly based on this page https://flutter.dev/docs/get-started/install/macos

* Flutter `beta` channel is used

```
 flutter channel beta
 flutter upgrade
 flutter config --enable-web
```

* Also Chrome browser should be installed

* DevTools (https://flutter.dev/docs/development/tools/devtools/cli)  can also be installed for performance and debugging purpose

```
flutter pub global activate devtools
```

To run DevTools from CLI:

```
flutter pub global run devtools 
```

And open DevTools UI in the browser at http://127.0.0.1:9100

### Run with Chrome browser

This command will attempt to open a new Chrome browser and run the app in Debug mode.

```
flutter run -d chrome
```

You should see a URL for debugging:

```
🔥  To hot restart changes while running, press "r". To hot restart (and refresh
the browser), press "R".
For a more detailed help message, press "h". To quit, press "q".
Debug service listening on ws://127.0.0.1:54708/bcg-mZh5AzI=
```

If you have DevTools running, drop the above URL into DevTools to connect the debugger.

### Run tests

```
flutter test
```


### Build web deployment

```
flutter build web
```

(To build a version for performance profiling, use `flutter build web --profile`)

The build outputs will be under `build/web` directory. This can be served with a simple HTTP server, such as one from Python

```
cd build/web

python3 -m http.server 8000
```

### Deploy

Zeit (https://zeit.co/) `now` CLI is used for deployment. The CLI can be installed following the instruction at https://zeit.co/download. A simple configuration file `now.json` is used with the cli.

* To deploy for testing
```
> now -A now.json
```

The output will look like this

```
> Deploying flutter-simple-web-app under <user-id>
> Using project flutter-simple-web-app
> Synced 1 file [2s]
> https://flutter-simple-web-app-<some-random-id>.now.sh [9s]
> Ready! Deployed to https://flutter-simple-web-app.<user-id>.now.sh 
```
* To deploy to production

```
> now -A now.json --prod
```

The output will look like this

```
> Deploying flutter-simple-web-app under <user-id>
> Using project flutter-simple-web-app
> https://flutter-simple-web-app-<some-random-id>.now.sh [3s]
> Ready! Deployment complete [8s]
- https://flutter-simple-web-app.now.sh
- https://flutter-simple-web-app.<user-id>.now.sh [in clipboard]
```


### Github Actions
[.github/workflows/main.yml](.github/workflows/main.yml) contains the Github Actions workflow for running Flutter test and build and deploy with zeit `now` cli. 

This is a sample screenshot of a successful workflow:

![](https://raw.githubusercontent.com/alext234/figs/master/flutter-simple-web-app/github-actions.png)

Build artifacts used for deployment can be downloaded from the top right corner `Artifacts` drop-down.


## References

* The project was created following this page

https://flutter.dev/docs/get-started/web

* Build for deployment instructions

https://flutter.dev/docs/deployment/web

* What's not to commit to git

https://dart.dev/guides/libraries/private-files
