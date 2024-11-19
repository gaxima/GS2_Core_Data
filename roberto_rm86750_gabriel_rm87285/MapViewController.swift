//
//  MapViewController.swift
//  roberto_rm86750_gabriel_rm87285
//
//  Created by Gabriel Ximenes on 18/11/24.
//

import UIKit
import MapKit

class MapViewController: UIViewController {

    @IBOutlet weak var mapa: MKMapView!
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        let annotation = MKPointAnnotation()
        annotation.coordinate = CLLocationCoordinate2D(latitude: -3.549776181559725, longitude: -38.81031981589203)
        annotation.title = "Porto de pecém"
        annotation.subtitle = "Primeira uzina a base de movimento das ondas do mar da Ámerica Latina"
        mapa.addAnnotation(annotation)
        
        let region = MKCoordinateRegion(center: annotation.coordinate, latitudinalMeters: 200, longitudinalMeters: 200)
        mapa.setRegion(region, animated: true)
    }
   

}
