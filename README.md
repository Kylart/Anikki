# Name
Name is to be determined. For now it is using KawAnime but this is highly subject to change in the future.

## Features

#### Done
* Browse local anime files with Anilist information
* Check what animes came out for a range of days
* Download (almost) any anime on the fly
* Embedded VLC player

#### To be done
* Search for any torrent
* Search for any anime information
* Embedded Torrent client
* Automatic anime watch list tracking

## Building

1. Install [Flutter](https://flutter.dev) for you platform
2. Clone this repo 

```bash
git clone --recursive https://github.com/Kylart/kawanime-flutter
```

If you are on MacOS, run

```bash
cd kawanime-flutter
source ./scripts/build_bindings_macos.sh
```

This is for the building process to be able to find native dependencies and link them properly.

### For Desktop

On your platform of choice
```bash
flutter build <macos / windows / linux>
```

### For Android
```bash
flutter build apk
```

### For iOS

TO DO

## Develop

Run
```bash
flutter pub get
```

```bash
flutter run
```

## Contributing
Any contribution is appreciated.

1. Fork it!
2. Create your feature branch: git checkout -b my-new-feature
3. Commit your changes: git commit -am 'Add some feature'
4. Push to the branch: git push origin my-new-feature
5. Submit a pull request.

## License
MIT License

Copyright (c) Kylart