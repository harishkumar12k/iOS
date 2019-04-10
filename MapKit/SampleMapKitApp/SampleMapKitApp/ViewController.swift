//
//  ViewController.swift
//  SampleMapKitApp
//
//  Created by Harish Kumar on 10/04/19.
//  Copyright © 2019 Harish Kumar. All rights reserved.
//

import UIKit
import MapKit
import Contacts

class ViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet var MapView: MKMapView!
    let initialLocation = CLLocation(latitude: 12.979026, longitude: 77.591328)
    var regionRadius: CLLocationDistance = 100
    
    override func viewDidLoad() {
        super.viewDidLoad()
        MapView.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        centerMapOnLocation(location: initialLocation)
    }
    
    //Update map to given location as center
    func centerMapOnLocation(location: CLLocation) {
        UIView.animate(withDuration: 0.5) {
            DispatchQueue.main.async {
                let Bangalore = MKPointAnnotation()
                Bangalore.title = "Bangalore"
                Bangalore.subtitle = "Vidhana Suodha"
                Bangalore.coordinate = location.coordinate
                let coordinateRegion = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: self.regionRadius, longitudinalMeters: self.regionRadius)
                self.MapView.setRegion(coordinateRegion, animated: true)
                self.MapView.addAnnotation(Bangalore)
            }
        }
    }
    
    //Annotation View for coordinates
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let identifier = "mapmarker"
        var view: MKMarkerAnnotationView
        if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKMarkerAnnotationView {
            dequeuedView.annotation = annotation
            view = dequeuedView
        } else {
            view = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            view.canShowCallout = true
            view.calloutOffset = CGPoint(x: 0, y: 0)
            view.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
        }
        return view
    }
    
    //Tap action on AccessoryView
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        let addressDict = [
            CNPostalAddressStreetKey: "Vidhana Soudha",
            CNPostalAddressCityKey: "Bangalore",
            CNPostalAddressStateKey: "Karnataka",
            CNPostalAddressCountryKey: "INDIA",
            ]
        let launchOptions = [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving]
        let placemark = MKPlacemark(coordinate: initialLocation.coordinate, addressDictionary: addressDict)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = "Bangalore"
        mapItem.openInMaps(launchOptions: launchOptions)
    }

}
