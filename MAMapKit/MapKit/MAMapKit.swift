//
//  MAMapKit.swift
//  MAMaps
//
//  Created by Muneeb Ali on 04/07/2018.
//  Copyright © 2018 Muneeb Ali. All rights reserved.
//

import Foundation
import MapKit

class MAMapKit: MKMapView {
    
    //MARK: - Variables
    var annotationView : MKAnnotationView = MKAnnotationView()
    let locationManager: CLLocationManager = {
        let manager = CLLocationManager()
        manager.requestWhenInUseAuthorization()
        return manager
    }()
    
    
    //MARK: - Init Methods
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        delegate = self
    }
    
    
    
    //MARK: - Map Setup
    func setMap(view: UIView) {
        showsUserLocation = true
        showsCompass = true
        showsScale = true
        setupUserTrackingButtonAndScaleView(view: view)
    }
    
    
    //MARK: - User Location Button
    func setupUserTrackingButtonAndScaleView(view: UIView) {
        
        if #available(iOS 11.0, *) {
            let button = MKUserTrackingButton(mapView: self)
            button.layer.backgroundColor = UIColor(white: 1, alpha: 0.8).cgColor
            button.layer.cornerRadius = 5
            button.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(button)
            
            NSLayoutConstraint.activate([button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40),
                                         button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)])
        } else {
            
        }
    }
    
    
    //MARK: - Current Location Method
    func currentLocation() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        if #available(iOS 11.0, *) {
            locationManager.showsBackgroundLocationIndicator = true
        } else {
            // Fallback on earlier versions
        }
        locationManager.startUpdatingLocation()
    }
    
    
    //MARK: - Map Terrin Type
    func mapTerrin() -> UIAlertController {
        let alert = UIAlertController(title: nil, message: Messages.SelectOption, preferredStyle: .actionSheet)
        
        
        alert.addAction(UIAlertAction(title: Title.Hybrid, style: .default , handler:{ (UIAlertAction) in
            self.mapType = .hybrid
        }))
        
        
        alert.addAction(UIAlertAction(title: Title.HybridFlyover, style: .default , handler:{ (UIAlertAction) in
            self.mapType = .hybridFlyover
        }))
        
        
        alert.addAction(UIAlertAction(title: Title.MutedStandard, style: .default , handler:{ (UIAlertAction) in
            if #available(iOS 11.0, *) {
                self.mapType = .mutedStandard
            } else {
                // Fallback on earlier versions
            }
        }))
        
        
        alert.addAction(UIAlertAction(title: Title.Satellite, style: .default, handler:{ (UIAlertAction) in
            self.mapType = .satellite
        }))
        
        alert.addAction(UIAlertAction(title: Title.SatelliteFlyover, style: .default, handler:{ (UIAlertAction) in
            self.mapType = .satelliteFlyover
        }))
        
        alert.addAction(UIAlertAction(title: Title.Standard, style: .default, handler:{ (UIAlertAction) in
            self.mapType = .standard
        }))
        
        alert.addAction(UIAlertAction(title: Title.Dismiss, style: .cancel, handler:{ (UIAlertAction) in
            
        }))
        
        return alert
    }
    
    //MARK: - Seting Pin
    func setCurrentLocationPinOnMap(view: UIView, title: String, locationName: String, coordinate: CLLocationCoordinate2D) {
        
        let pin1 = CurrentMapPin(title: title, locationName: locationName, coordinate: coordinate)
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(pin1.coordinate, 800, 800)
        setRegion(coordinateRegion, animated: true)
        addAnnotations([pin1])
    }
    
    func setPinOnMap(view: UIView, title: String, locationName: String, coordinate: CLLocationCoordinate2D) {
        
        let pin1 = MapPin(title: title, locationName: locationName, coordinate: coordinate)
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(pin1.coordinate, 800, 800)
        setRegion(coordinateRegion, animated: true)
        addAnnotations([pin1])
    }
    
    func setPinWithImageOnMap(view: UIView, title: String, locationName: String, coordinate: CLLocationCoordinate2D) {
        
        let pin1 = ImageMapPin(title: title, locationName: locationName, coordinate: coordinate)
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(pin1.coordinate, 800, 800)
        setRegion(coordinateRegion, animated: true)
        addAnnotations([pin1])
    }
    
    
    //MARK: - Draw Circle
    func drawCircle(coordinate: CLLocationCoordinate2D, radius: CLLocationDistance) {
        let circle = MKCircle(center: coordinate, radius: radius)
        add(circle)
    }
}


//MARK: - MKMapView Delegate Methods
extension MAMapKit: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        let Identifier = "Pin"
        
        annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: Identifier)
            ?? MKAnnotationView(annotation: annotation, reuseIdentifier: Identifier)
        
        annotationView.canShowCallout = true
        if #available(iOS 11.0, *) {
            annotationView.clusteringIdentifier = "PinCluster"
        } else {
            // Fallback on earlier versions
        }
        
        if annotation is MKUserLocation {
            return nil
        } else if annotation is ImageMapPin {
            annotationView.image =  #imageLiteral(resourceName: "pin")
            return annotationView
        } else {
            return nil
        }
        
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        annotationView.canShowCallout = false
    }
    
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        
        if let circleOverlay = overlay as? MKCircle {
            let circleRenderer = MKCircleRenderer(overlay: circleOverlay)
            circleRenderer.fillColor = UIColor.black
            circleRenderer.alpha = 0.5
            circleRenderer.strokeColor = .red
            circleRenderer.lineWidth = 3
            
            return circleRenderer
        }else {
            return MKPolylineRenderer()
        }
    }
}

//MARK: - CLLocationManager Delegate
extension MAMapKit: CLLocationManagerDelegate {
    
    // Get Current Location
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let location = locations.last! as CLLocation
        let currentLocation = location.coordinate
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(currentLocation, 800, 800)
        setRegion(coordinateRegion, animated: true)
        //        locationManager.stopUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }
    
}
