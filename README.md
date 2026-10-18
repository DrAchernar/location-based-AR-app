# FIRAT AR

Example of a location-based AR demo for iOS. It points a compass and a spoken distance toward the Faculty of Technology at Fırat University, then uses ARKit image detection to place a card on a scanned picture.

Coordinates are aimed at that faculty. Change them in `lib/detect.dart` if you want another target:

- latitude `38.681527`
- longitude `39.196072`

Plugins used when this was published (February 2020):

- `arkit_plugin` 0.3.0
- `geolocator` 5.1.5
- `flutter_tts` 0.8.5
- `flutter_compass` 0.3.4
- `video_player` 0.10.5 (intro video after launch)

After `flutter pub get`, change the images in the Xcode asset catalog group `AR Resources` to scan your own target. Other AR objects and geometries are covered by the `arkit_plugin` docs.

The compass was already described as unstable in 2020. The angle math and the iOS compass were only a rough example.

## Notes from 18 October 2026

Reviewed again on this date. These points describe the code as it stands; they are not part of the original 2020 readme.

- Snapshot of the February 2020 tree. It is not being ported to current Flutter.
- Written with Flutter 1.12. The Dart constraint is `>=2.1.0 <3.0.0`, so `flutter pub get` fails on Dart 3.8 (Flutter 3.32) and on any null-safe Dart SDK. Building it needs a Flutter 1.12-era SDK.
- AR is iOS-only. The Android project is the stock Flutter shell: application id `com.example.firatar`, no camera or location permissions, and no ARCore.
- The intro video does not reliably advance on its own. Skip is the path to the camera screen. Auto-advance compares the playback position string to the exact value `0:00:32.958000`.
- Every 7 seconds the app reads location, computes distance and a bearing, and speaks the distance. The bearing formula passes degrees to `sin` and `cos`, which expect radians. Each tick also subscribes to the compass again and never cancels the previous subscription or the timer.
- Inside 50 meters the distance label is replaced by an eye icon. Image detection stays on at every distance. That check does not place, hide, or move an AR object. A proximity guard is only mentioned in a comment inside `onAnchorWasFound`.
- When ARKit recognizes the reference image, the app adds a flat card (`ios/Runner/firatcard.png`) on that image anchor. Coordinates are not used to put an object in the world. Geo-tracking against the camera pose, including the `ar_flutter_plugin` integration asked about in issue #3, is not implemented.
- `assets/background.jpg` is listed in `pubspec.yaml` and is not used.
