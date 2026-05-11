## Sentera Notes

1. execute build script `./bin/build_xcframework.sh`
2. copy `./build/ImageViewer.xcframework` to your project

## Install

### CocoaPods

```ruby
pod 'ImageViewer'
```

### Carthage

```ruby
github "Krisiacik/ImageViewer"
```

## Sample Usage

For a detailed example, see the [Example](https://github.com/Krisiacik/ImageViewer/tree/master/Example)!

```swift
// Show the ImageViewer with the first item
self.presentImageGallery(GalleryViewController(startIndex: 0, itemsDataSource: self))

// The GalleryItemsDataSource provides the items to show
extension ViewController: GalleryItemsDataSource {
    func itemCount() -> Int {
        return items.count
    }

    func provideGalleryItem(_ index: Int) -> GalleryItem {
        return items[index].galleryItem
    }
}

```

### ImageViewer version vs Swift version.

ImageViewer 6.0+ is Swift 5 ready! 🎉

If you use earlier version of Swift - refer to the table below:

| Swift version | ImageViewer version               |
| ------------- | --------------------------------- |
| 5.x           | >= 6.0                            |
| 4.x           | 5.0                               |
| 3.x           | 4.0                               |
| 2.3           | 3.1 [⚠️](CHANGELOG.md#version-31) |
| 2.2           | <= 2.1                            |

## License

ImageViewer is licensed under the MIT License, Version 2.0. See the [LICENSE](LICENSE) file for more info.

Copyright (c) 2016 MailOnline
