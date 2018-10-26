//
//  ViewController.swift
//  Maps Kit
//
//  Created by Christiawan Eko Saputro on 17/10/18.
//  Copyright © 2018 Dev. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate {
    @IBOutlet weak var peta: MKMapView!
    var gps = CLLocationManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // menggunakan tipe map yang standard
        peta.mapType = .standard
        
        
        let coordinat = CLLocationCoordinate2D( latitude: -6.3403091, longitude: 106.7562961)
        let span = MKCoordinateSpan(latitudeDelta: 0.10, longitudeDelta: 0.10)
        peta.region = MKCoordinateRegion(center: coordinat, span: span)

        let nin = MKPointAnnotation()
        nin.title = "Seamolec"
        nin.subtitle = "Instansi Pendidikan"
        nin.coordinate = coordinat
        peta.addAnnotation(nin)
        
        
        
        gps.delegate = self
        gps.startUpdatingLocation()
        gps.requestLocation()
        gps.requestWhenInUseAuthorization()
        
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if locations != nil {
            print(locations)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
}

