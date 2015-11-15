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
    
    var savedLatitude: Double!
    var savedLongitude: Double!
    
    @IBOutlet weak var MapView: MKMapView!
    
    @IBAction func doDoneButton(sender: UIBarButtonItem){
        if sender.tag == 1{
            dismissViewControllerAnimated(true, completion: nil)
        }
        
    }
    @IBAction func doCancelButtion(sender: UIBarButtonItem){
        if sender.tag == 2{
            savedLatitude = MapView.centerCoordinate.latitude
            savedLongitude = MapView.centerCoordinate.longitude
            dismissViewControllerAnimated(true, completion: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        savedLatitude = 0;
        savedLongitude = 0;
        MapDoneButton.tag = 2;
        MapCancelButton.tag = 1;
        /*
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        */
        
        
        
        MapView.delegate = self
        
        locationFixAchieved = false
        
        locationManager = CLLocationManager()
        locationManager.delegate = self
        
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
        
        
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        startPin = MKPointAnnotation()
        
        
        sleep(1)
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
        
        
        let pinImage = UIImage(named: "red_pin.png")
        let imageView = UIImageView(image: pinImage) // set as you want
        
        imageView.image = pinImage
        imageView.backgroundColor = UIColor.clearColor()
        imageView.contentMode = UIViewContentMode.Center
        imageView.center.y = newPoint.y
        imageView.center.x = newPoint.x
        
        view.addSubview((imageView))
        ///////////////
        
        
    }
    
    func mapView(mapView: MKMapView, regionDidChangeAnimated animated: Bool) { // updates pin location
        startPin.coordinate = CLLocationCoordinate2DMake(MapView.centerCoordinate.latitude, MapView.centerCoordinate.longitude)
    }
    
    
    
    func MapView(mapView: MKMapView!, annotationView view: MKAnnotationView!, didChangeDragState newState: MKAnnotationViewDragState, fromOldState oldState: MKAnnotationViewDragState) {
        switch (newState) {
        case .Starting:
            view.dragState = .Dragging
        case .Ending, .Canceling:
            view.dragState = .None
        default: break
        }
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
