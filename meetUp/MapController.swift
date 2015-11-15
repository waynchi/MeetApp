//
//  MapController.swift
//  meetUp
//
//  Created by Student on 11/14/15.
//  Copyright (c) 2015 Wayne. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class MapController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate{
    
    @IBOutlet weak var MapDoneButton: UIBarButtonItem!
    @IBOutlet weak var MapCancelButton: UIBarButtonItem!
    
    var locationManager:CLLocationManager!
    var locationFixAchieved : Bool = false
    var startPin: MKPointAnnotation!
    @IBOutlet weak var MapView: MKMapView!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /* locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        */
        
       
        
        MapView.delegate = self
        
        locationFixAchieved = false
        
        locationManager = CLLocationManager()
        
        locationManager.requestWhenInUseAuthorization()

        locationManager.delegate = self
        locationManager.startUpdatingLocation()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        startPin = MKPointAnnotation()
       
        
        startPin.coordinate = CLLocationCoordinate2DMake(locationManager.location!.coordinate.latitude, locationManager.location!.coordinate.longitude)
        
        
        
        MapView.addAnnotation(startPin)
        
        
        
        var coordinateRegion: MKCoordinateRegion
        coordinateRegion = MKCoordinateRegion()
        coordinateRegion.span.latitudeDelta = 0.02
        coordinateRegion.span.longitudeDelta = 0.02
        coordinateRegion.center = locationManager.location!.coordinate
        
        MapView.setRegion(coordinateRegion, animated: true) // center mapview to user location
        
      //add pin image
        let newPoint = self.MapView.convertCoordinate(MapView.centerCoordinate, toPointToView: self.view)

        
        let pinImage = UIImage(named: "Resources//red_pin.png")
        let imageView = UIImageView(image: pinImage) // set as you want
        
        imageView.image = pinImage
        imageView.backgroundColor = UIColor.clearColor()
        imageView.contentMode = UIViewContentMode.Center
        imageView.center.y = newPoint.y
        imageView.center.x = newPoint.x
        
        
        self.view.addSubview(imageView)
        
        
        
    }
    func MapView(MapView: MKMapView!, regionDidChangeAnimated animated: Bool) {
        startPin.coordinate = MapView.centerCoordinate;
        
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
}
