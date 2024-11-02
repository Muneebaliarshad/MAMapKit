//
//  AnnotationViewController.swift
//  MAMapKit
//
//  Created by Muneeb Ali on 30/09/2024.
//  Copyright © 2024 Muneeb Ali. All rights reserved.
//

import UIKit

class AnnotationViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet weak var mapView: MAMapKit!
    
    //MARK: - UIView Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.getCurrentLocation()
    }

    // MARK: - IBAction
    @IBAction func defaultPinButtonAction(_ sender: UIButton) {
        mapView.removeAnnotations(mapView.annotations)
        mapView.setPinOnMap(view: self.view, title: "Title", locationName: "Location Name", coordinate: mapView.currentLocation)
    }
    
    @IBAction func customPinButtonAction(_ sender: UIButton) {
        mapView.removeAnnotations(mapView.annotations)
        mapView.setPinWithImageOnMap(view: self.view, title: "Title", locationName: "Location Name", coordinate: mapView.currentLocation)
    }
    
    @IBAction func clusterButtonAction(_ sender: UIButton) {
        mapView.setPinWithImageOnMap(view: self.view, title: "Title", locationName: "Location Name", coordinate: mapView.currentLocation)
    }
}
