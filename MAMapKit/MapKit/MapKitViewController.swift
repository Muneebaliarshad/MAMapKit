//
//  MapKitViewController.swift.swift
//  MAMapKit
//
//  Created by Muneeb Ali on 31/07/2018.
//  Copyright © 2018 Muneeb Ali. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation


class MapKitViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet weak var mapView: MAMapKit!
    @IBOutlet weak var menuButton: UIButton!
    
    
    //MARK: - Variables
    let islamabad = CLLocationCoordinate2DMake(33.7080, 73.0497)
    let islamabad2 = CLLocationCoordinate2DMake(33.7132, 73.0497)
    var annotationView : MKAnnotationView = MKAnnotationView()
    let locationManager: CLLocationManager = {
        let manager = CLLocationManager()
        manager.requestWhenInUseAuthorization()
        return manager
    }()
    
    
    //MARK: - UIView Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUIViewController()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    //MARK: - Setup Metjods
    func setupUIViewController() {
        mapView.setMap(view: view)
    }
    
    
    //MARK: - Helper Methods
    
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    }
    
    
    //MARK: - IBActions
    @IBAction func menuButtonTapped(_ sender: Any) {
        let alert = UIAlertController(title: nil, message: Messages.SelectOption, preferredStyle: .actionSheet)
        
        //--------------------------------------------- Current Location ---------------------------------------------
        alert.addAction(UIAlertAction(title: Title.CurrentLocation, style: .default , handler:{ (UIAlertAction) in
            self.mapView.currentLocation()
        }))
        
        //--------------------------------------------- May Type ---------------------------------------------
        alert.addAction(UIAlertAction(title: Title.MapType, style: .default , handler:{ (UIAlertAction) in
            self.present(self.mapView.mapTerrin(), animated: true, completion: nil)
        }))
        
        //--------------------------------------------- Set Pin ---------------------------------------------
        alert.addAction(UIAlertAction(title: Title.SetPin, style: .default , handler:{ (UIAlertAction) in
            self.mapView.setPinOnMap(view: self.view, title: "Islamabad", locationName: "Pakistan", coordinate: self.islamabad)
            self.mapView.setPinWithImageOnMap(view: self.view, title: "Islamabad", locationName: "Pakistan", coordinate: self.islamabad2)
        }))
        
        
        //--------------------------------------------- Draw Circle ---------------------------------------------
        alert.addAction(UIAlertAction(title: Title.DrawCircle, style: .default , handler:{ (UIAlertAction) in
            self.mapView.drawCircle(coordinate: self.islamabad, radius: 200)
            self.mapView.drawCircle(coordinate: self.islamabad2, radius: 200)
        }))
        
        
        //--------------------------------------------- Dismiss ---------------------------------------------
        alert.addAction(UIAlertAction(title: Title.Dismiss, style: .cancel, handler:{ (UIAlertAction) in
            
        }))
        
        self.present(alert, animated: true, completion: {
            
        })
    }
}


