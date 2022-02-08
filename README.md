# MAMapKit


![Platform](https://img.shields.io/badge/Platform-iOS-orange.svg)
![Languages](https://img.shields.io/badge/Language-Swift-orange.svg)
  
# Overview
### Functionalities 
- [Current Location](#current-location)
- [Map Types](#map-types)
  - Hybrid
  - Hybrid Flyover
  - Muted Standard
  - Satellite
  - Satellite Flyover
  - Standard
- [Pin On Map](#pin-on-map)
    - [Default](#default)
    - [With custom image/Annotation](#with-custom-image)
- [Draw Circle on given location](#draw-circle-on-given-location)


### Current Location

```swift
self.mapView.currentLocation()
```

### Map Types

```swift
self.present(self.mapView.mapTerrin(), animated: true, completion: nil)
```

### Pin On Map
    
Default
```swift
self.mapView.setPinOnMap(view: self.view, title: "Islamabad", locationName: "Pakistan", coordinate: self.islamabad)
```
With Custom Image
```swift
self.mapView.setPinWithImageOnMap(view: self.view, title: "Islamabad", locationName: "Pakistan", coordinate: self.location)
```

### Draw Circle on given location

```swift
self.mapView.drawCircle(coordinate: self.islamabad, radius: 200)
```

