//
//  DefaultMapViewController.swift.swift
//  MAMapKit
//
//  Created by Muneeb Ali on 31/07/2018.
//  Copyright © 2018 Muneeb Ali. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation


class DefaultMapViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet weak var mapView: MAMapKit!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    //MARK: - Variables
    let islamabad = CLLocationCoordinate2DMake(33.7080, 73.0497)
    var annotationView : MKAnnotationView = MKAnnotationView()
    let locationManager: CLLocationManager = {
        let manager = CLLocationManager()
        manager.requestWhenInUseAuthorization()
        return manager
    }()
    
    
    //MARK: - UIView Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setSegment()
        mapView.getCurrentLocation()
    }
    
    // MARK: - Helper Methods
    func setSegment() {
        let titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        segmentControl.setTitleTextAttributes(titleTextAttributes, for: .normal)
        segmentControl.setTitleTextAttributes(titleTextAttributes, for: .selected)
    }
    
    //MARK: - IBActions
    @IBAction func drawCircleButtonAction(_ sender: UIButton) {
        mapView.drawCircle(coordinate: mapView.currentLocation, radius: 200)
    }
    
    @IBAction func segmentControl(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            mapView.mapType = .standard
            break
            
        case 1:
            mapView.mapType = .satellite
            break
            
        case 2:
            mapView.mapType = .hybrid
            break
            
        default:
            mapView.mapType = .standard
            break
        }
    }
    
}
