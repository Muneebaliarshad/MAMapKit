# MAMapKit


![Platform](https://img.shields.io/badge/Platform-iOS-orange.svg)
![Languages](https://img.shields.io/badge/Language-Swift-orange.svg)
  
# Overview
### Functionalities 
- [x] Current Location
- [x] Map Types
  - [x] Standard
  - [x] Satellite
  - [x] Hybrid
- [x] Annotations
    - [x] Default Pin
    - [x] Custom image
    - [x] Cluster

# How To Use
### Current Location

```swift
self.mapView.currentLocation()
```

### Map Types

```swift
mapView.mapType = .standard
```

```swift
mapView.mapType = .satellite
```

```swift
mapView.mapType = .hybrid
```

```swift
mapView.mapType = .standard
```

### Pin On Map
    
Default Pin
```swift
mapView.setPinOnMap(view: self.view, title: "Title", locationName: "Location Name", coordinate: mapView.currentLocation)
```
With Custom Image
```swift
mapView.setPinWithImageOnMap(view: self.view, title: "Title", locationName: "Location Name", coordinate: mapView.currentLocation)
```

