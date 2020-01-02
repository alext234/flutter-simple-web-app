## Simple web app Flutter project

This repo is a very simple web app with Flutter following the basic tutorial.

A working production URL is deployed at https://flutter-simple-web-app.now.sh


TODO: pipeline with github actions 
TODO: debug instructions

## Some basic commands

### Setup

* `flutter` setup was mainly based on this page https://flutter.dev/docs/get-started/install/macos

* Also Chrome browser should be installed

### Run with Chrome browser

```
flutter run -d chrome
```

### Run tests

```
flutter test
```


### Build web deployment

```
flutter build web
```

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


## References

* The project was created following this page

https://flutter.dev/docs/get-started/web

* Build for deployment instructions

https://flutter.dev/docs/deployment/web

* What's not to commit to git

https://dart.dev/guides/libraries/private-files
