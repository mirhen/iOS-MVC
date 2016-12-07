//
//  ViewController.swift
//  yo
//
//  Created by Miriam Hendler on 12/2/16.
//  Copyright © 2016 Miriam Hendler. All rights reserved.
//


import UIKit
import MapKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var location: String = "113 carlton rd w, siffern NY, 10901"
        var geocoder: CLGeocoder = CLGeocoder()
        geocoder.geocodeAddressString(location,completionHandler: {(placemarks: [CLPlacemark]?, error: NSError?) -> Void in
            if ((placemarks?.count)! > 0) {
                var topResult: CLPlacemark = (placemarks?[0])!
                print(placemarks[0].c)
                var placemark: MKPlacemark = MKPlacemark(placemark: topResult)
//                var region: MKCoordinateRegion = self.mapView.region
//                region.center = placemark.region.center
//                region.span.longitudeDelta /= 8.0
//                region.span.latitudeDelta /= 8.0
//                self.mapView.setRegion(region, animated: true)
//                self.mapView.addAnnotation(placemark)
            }
        } as! CLGeocodeCompletionHandler)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

