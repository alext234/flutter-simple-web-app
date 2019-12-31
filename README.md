## Simple web app FLutter project

This repo is a very simple web app with Flutter following the basic tutorial.

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


## References

* The project was created following this page

https://flutter.dev/docs/get-started/web

* Build for deployment instructions

https://flutter.dev/docs/deployment/web

* What's not to commit to git

https://dart.dev/guides/libraries/private-files
