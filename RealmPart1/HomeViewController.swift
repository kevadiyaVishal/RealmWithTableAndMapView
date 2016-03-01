//
//  HomeViewController.swift
//  RealmPart1
//
//  Created by Vishal Kevadiya on 27/02/16.
//  Copyright (c) 2016 Vishal Kevadiya. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation
class HomeViewController: UIViewController , CLLocationManagerDelegate,MKMapViewDelegate {
    
    
    @IBOutlet weak var mapview: MKMapView!
    let kDistanceMeters:CLLocationDistance = 400
    var locationManager = CLLocationManager()
    var lastAnnotation : MKAnnotation!
    
    override func viewDidLoad() {
        super.loadView()
         navigationController?.navigationBarHidden = false
         navigationItem.hidesBackButton = true
         self.navigationController?.navigationBar.barStyle = UIBarStyle.BlackTranslucent
        
        self.navigationController?.navigationBar.barTintColor=UIColor.purpleColor();
        self.navigationController?.toolbarHidden = false;
        self.navigationController?.toolbar.barTintColor = UIColor.purpleColor()
        
        
        title = "Map"
        locationManager.delegate = self
        if (CLLocationManager.authorizationStatus() == CLAuthorizationStatus.NotDetermined ) {
            self.locationManager.requestAlwaysAuthorization()
            println("Requesting Authorization")
        }
        else {
            self.locationManager.startUpdatingLocation()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "newEntry") {
            let newEntryController = segue.destinationViewController as! NewEntryViewController
        }
    }
    //MARK: - CLLocationManager Delegate
    
    func locationManager(manager: CLLocationManager!, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        if status != .NotDetermined
        {
            mapview.showsUserLocation = true
        }
        else
        {
            print("Authorization to use location data denied")
        }
    }

    func mapView(mapView: MKMapView!, annotationView: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
            if (annotationView.annotation is Speciman) {
                performSegueWithIdentifier("newEntry", sender: annotationView.annotation)
            }
        }


    func mapView(mapView: MKMapView!, viewForAnnotation annotation: MKAnnotation!) -> MKAnnotationView! {
        println("viewForAnnotation1")
        if (annotation is Speciman) {
             println("viewForAnnotation2")
            var annotationView = mapView.dequeueReusableAnnotationViewWithIdentifier(annotation.subtitle)
            
            if annotationView == nil {
                
                let currentAnnoatation = annotation as! Speciman
                annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: annotation.subtitle)
                
                switch currentAnnoatation.subtitle {
                case "Uncategorized":
                     println("Uncategorized")
                    annotationView.image = UIImage(named: "IconUncategorized")
                case "Arachnids":
                    annotationView.image = UIImage(named: "IconArachid")
                case "Birds":
                    annotationView.image = UIImage(named: "IconBird")
                case "Mammals":
                    annotationView.image = UIImage(named: "IconMammal")
                case "Flora":
                    annotationView.image = UIImage(named: "IconFlora")
                case "Reptiles":
                    annotationView.image = UIImage(named: "IconReptile")
                default:
                    annotationView.image = UIImage(named: "IconUncategorized")
                }
                
                annotationView.enabled = true
                annotationView.canShowCallout = true
                var detailDisclosure = UIButton.buttonWithType(UIButtonType.DetailDisclosure) as! UIButton
                annotationView.rightCalloutAccessoryView = detailDisclosure
                
                if currentAnnoatation.title == "Empty" {
                    annotationView.draggable = true
                }
                
            }
            return annotationView
        }
        
        return nil
        
    }
    
    func mapView(mapView: MKMapView!, annotationView view: MKAnnotationView!, didChangeDragState newState: MKAnnotationViewDragState, fromOldState oldState: MKAnnotationViewDragState) {
        println("Drag1")
        if newState == MKAnnotationViewDragState.Ending{
            println("End")
            view.dragState = MKAnnotationViewDragState.None
        }
    }

    func mapView(mapView: MKMapView!, didAddAnnotationViews views: [AnyObject]!) {
        println("DidAnnotationViews")
        for annotationView in views as! [MKAnnotationView]{
            
            if (annotationView.annotation is Speciman) {
                annotationView.transform = CGAffineTransformMakeTranslation(0, -500)
                
                UIView.animateWithDuration(02, delay: 0.0, options: UIViewAnimationOptions.CurveLinear,animations: {
                    annotationView.transform = CGAffineTransformMakeTranslation(0, 0)
                    },completion: nil)
            }
        }
    }
    

    func centerToUsersLocation(){
        let center = mapview.userLocation.coordinate
        var zoomRegion : MKCoordinateRegion = MKCoordinateRegionMakeWithDistance(center, kDistanceMeters, kDistanceMeters)
        mapview.setRegion(zoomRegion, animated: true);
        
    }
    func addPin(){
        if lastAnnotation == nil {
            let speciman = Speciman(coordinate: mapview.centerCoordinate, title: "Empty", subtitle: "Uncategorized")
            mapview.addAnnotation(speciman)
            lastAnnotation = speciman
        }
        else{
            let alertController = UIAlertController(title: "Annotation already dropped", message: "There is an annoatation on screen. Try dragging it if you want to change its location!", preferredStyle: .Alert)
            let alertAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Destructive, handler: {(alert : UIAlertAction!) in
                alertController.dismissViewControllerAnimated(true, completion: nil)
            })
            alertController.addAction(alertAction)
            presentViewController(alertController, animated: true, completion: nil)
        }
    }
    

    @IBAction func addNewpin(sender: AnyObject) {
     
            addPin()
    }
    
    @IBAction func centerLcoation(sender: AnyObject) {
        centerToUsersLocation()

    }
}
/*

//
//  MapViewController.swift
//  RWRealmStarterProject
//
//  Created by Bill Kastanakis on 8/5/14.
//  Copyright (c) 2014 Bill Kastanakis. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {

@IBOutlet weak var mapView: MKMapView!

let kDistanceMeters:CLLocationDistance = 500

var locationManager = CLLocationManager()
var userLocated:Bool = false

var lastAnnotation: MKAnnotation!

//MARK: - Realm

//MARK: - Helper Methods



func centerToUsersLocation() {
let center = mapView.userLocation.coordinate
var zoomRegion : MKCoordinateRegion = MKCoordinateRegionMakeWithDistance(center, kDistanceMeters, kDistanceMeters)
mapView.setRegion(zoomRegion, animated: true);
}

func addNewPin() {
if lastAnnotation == nil {

let specimen = SpecimenAnnotation(coordinate: mapView.centerCoordinate, title: "Empty", subtitle: "Uncategorized");

mapView.addAnnotation(specimen)
lastAnnotation = specimen
} else {
let alertController = UIAlertController(title: "Annotation already dropped", message: "There is an annoatation on screen. Try dragging it if you want to change its location!", preferredStyle: .Alert)
let alertAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Destructive, handler: {(alert : UIAlertAction!) in
alertController.dismissViewControllerAnimated(true, completion: nil)
})
alertController.addAction(alertAction)
presentViewController(alertController, animated: true, completion: nil)
}
}

//MARK: - CLLocationManager Delegate

func locationManager(manager: CLLocationManager!, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
if (status != .NotDetermined) {
mapView.showsUserLocation = true
} else {
println("Authorization to use location data denied")
}
}

//MARK: - MKMapview Delegate

func mapView(mapView: MKMapView!, viewForAnnotation annotation: MKAnnotation!) -> MKAnnotationView! {
println("Testing")
if (annotation is SpecimenAnnotation) {

var annotationView = mapView.dequeueReusableAnnotationViewWithIdentifier(annotation.subtitle)
println("Testing2")
if annotationView == nil {

let currentAnnoatation = annotation as! SpecimenAnnotation
annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: annotation.subtitle)

switch currentAnnoatation.subtitle {
case "Uncategorized":
annotationView.image = UIImage(named: "IconUncategorized")
case "Arachnids":
annotationView.image = UIImage(named: "IconArachid")
case "Birds":
annotationView.image = UIImage(named: "IconBird")
case "Mammals":
annotationView.image = UIImage(named: "IconMammal")
case "Flora":
annotationView.image = UIImage(named: "IconFlora")
case "Reptiles":
annotationView.image = UIImage(named: "IconReptile")
default:
annotationView.image = UIImage(named: "IconUncategorized")
}

annotationView.enabled = true
annotationView.canShowCallout = true
var detailDisclosure = UIButton.buttonWithType(UIButtonType.DetailDisclosure) as! UIButton
annotationView.rightCalloutAccessoryView = detailDisclosure

if currentAnnoatation.title == "Empty" {
annotationView.draggable = true
}

}
return annotationView
}

return nil

}

func mapView(mapView: MKMapView!, didAddAnnotationViews views: [AnyObject]!) {

for annotationView in views as! [MKAnnotationView] {
if (annotationView.annotation is SpecimenAnnotation) {
annotationView.transform = CGAffineTransformMakeTranslation(0, -500)
UIView.animateWithDuration(0.5, delay: 0.0, options: .CurveLinear, animations: {
annotationView.transform = CGAffineTransformMakeTranslation(0, 0)
}, completion: nil)
}
}

}

func mapView(mapView: MKMapView!, annotationView: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
if (annotationView.annotation is SpecimenAnnotation) {
performSegueWithIdentifier("NewEntry", sender: annotationView.annotation)
}
}

func mapView(mapView: MKMapView!, annotationView view: MKAnnotationView!, didChangeDragState newState: MKAnnotationViewDragState, fromOldState oldState: MKAnnotationViewDragState) {
if newState == .Ending {
view.dragState = .None
}
}

//MARK: - View Lifecycle

override func viewDidLoad() {
super.viewDidLoad()

title = "Map"

locationManager.delegate = self

if (CLLocationManager.authorizationStatus() == .NotDetermined) {
locationManager.requestWhenInUseAuthorization()
println("Requesting Authorization")
} else {
locationManager.startUpdatingLocation()
}
}

override func didReceiveMemoryWarning() {
super.didReceiveMemoryWarning()
}

//MARK: - Actions & Segues

@IBAction func centerToUserLocationTapped(sender: AnyObject) {
centerToUsersLocation()
}


@IBAction func addNewEntryTapped(sender: AnyObject) {
addNewPin()
}

override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {

if (segue.identifier == "NewEntry") {
let controller = segue.destinationViewController as! AddNewEntryController
let specimenAnnotation = sender as! SpecimenAnnotation
controller.selectedAnnotation = specimenAnnotation
}

}

@IBAction func unwindFromAddNewEntry(segue: UIStoryboardSegue) {

let addNewEntryController = segue.sourceViewController as! AddNewEntryController

if (lastAnnotation != nil) {
mapView.removeAnnotation(lastAnnotation)
} else {
for annotation in mapView.annotations {

}
}

lastAnnotation = nil;

}

}
*/
