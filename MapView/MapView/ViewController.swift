//
//  ViewController.swift
//  MapView
//
//  Created by 박경춘 on 2023/01/07.
//

import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate {
    @IBOutlet var myMap: MKMapView!
    @IBOutlet var lblLocation1: UILabel!
    @IBOutlet var lblLocation2: UILabel!
    
    let locationManger = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lblLocation1.text = ""
        lblLocation2.text = ""
        
        locationManger.delegate = self
        locationManger.desiredAccuracy = kCLLocationAccuracyBest
        locationManger.requestWhenInUseAuthorization()
        locationManger.startUpdatingLocation()
        myMap.showsUserLocation = true
        
    }
    
    func goLocation(latitudeValue: CLLocationDegrees, longitudeValue : CLLocationDegrees, delta span : Double) -> CLLocationCoordinate2D
    {
        
        let pLocation = CLLocationCoordinate2DMake(latitudeValue, longitudeValue)
        let spanValue = MKCoordinateSpan(latitudeDelta: span, longitudeDelta: span)
        let pRegion = MKCoordinateRegion(center: pLocation, span: spanValue)
        myMap.setRegion(pRegion, animated: true)
        
        return pLocation
    }
    
    func setAnnotation(latitudeValue: CLLocationDegrees, longitudeValue: CLLocationDegrees, delta span: Double, tittle strTitle: String,
                       subtitle strSubtitle:String)
    {
        let annotation = MKPointAnnotation()
        annotation.coordinate = goLocation(latitudeValue: latitudeValue, longitudeValue: longitudeValue, delta: span)
        annotation.title = strTitle
        annotation.subtitle = strSubtitle
        myMap.addAnnotation(annotation)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let pLocation = locations.last
        _ = goLocation(latitudeValue: (pLocation?.coordinate.latitude)!, longitudeValue: (pLocation?.coordinate.longitude)!, delta: 0.01)
        CLGeocoder().reverseGeocodeLocation(pLocation!, completionHandler: {
            (placemarks, error) -> Void in
            let pm = placemarks!.first
            let country = pm!.country
            var address:String = country!
            if pm!.locality != nil {
                address += " "
                address += pm!.locality!
            }
            if pm!.thoroughfare != nil {
                address += " "
                address += pm!.thoroughfare!
            }
            
            self.lblLocation1.text = "현재 위치"
            self.lblLocation2.text = address
        })
        
        
        locationManger.stopUpdatingLocation()
    }

    @IBAction func sgChangeLocation(_ sender: UISegmentedControl) {
        
        if sender.selectedSegmentIndex == 0 {
            self.lblLocation1.text = ""
            self.lblLocation2.text = ""
            locationManger.startUpdatingLocation()
        }
        else if sender.selectedSegmentIndex == 1 {
            setAnnotation(latitudeValue: 37.751853 , longitudeValue: 128.87605740000004, delta: 1, tittle: "한국폴리텍대학 강릉캠퍼스", subtitle: "강원도 강릉시 남산초교길 121")
            self.lblLocation1.text = "보고 계신 위치"
            self.lblLocation2.text = "한국폴리텍대학 강릉캠퍼스"
        }
        else if sender.selectedSegmentIndex == 2 {
            
        }
        
    }
    
}

