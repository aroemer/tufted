//
//  MapViewController.swift
//  tufted
//
//  Created by Audrey ROEMER on 4/2/18.
//  Copyright © 2018 Audrey ROEMER. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController, UITextFieldDelegate, MKMapViewDelegate, CLLocationManagerDelegate {
    
    @IBOutlet weak var MapView: MKMapView!
    
    @IBOutlet weak var searchLocationTextField: UITextField!
    var locationManager = CLLocationManager()
    var petSitters: [Place] = []
    
    @IBOutlet weak var datePickerFrom: UIDatePicker!
    @IBOutlet weak var datePickerTo: UIDatePicker!

    @IBOutlet weak var TextLabelFrom: UILabel!
    
    @IBOutlet weak var TextLabelTo: UILabel!
    
    @IBAction func openPopUp(_ sender: Any) {
        let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "sbPopUpID") as! PopUpViewController
        self.addChildViewController(popOverVC)
        popOverVC.view.frame = self.view.frame
        self.view.addSubview(popOverVC.view)
        popOverVC.didMove(toParentViewController: self)
    }
    
    func centerMapOnLocation(location: CLLocationCoordinate2D) {
        let regionRadius: CLLocationDistance = 3500
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location, regionRadius, regionRadius)
        MapView.setRegion(coordinateRegion, animated: true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //for the location search field
        if let search = searchLocationTextField.text {
            let searchRequest = MKLocalSearchRequest()
            searchRequest.naturalLanguageQuery = search
            let activeSearch = MKLocalSearch(request: searchRequest)
            activeSearch.start { (response, error) in
               
                //Getting data
                guard let latitude =  response?.boundingRegion.center.latitude else { return }
                guard let longitude = response?.boundingRegion.center.longitude else { return }
                let coordinate:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
                //Zooming in on annotation
                self.centerMapOnLocation(location: coordinate)
            }
        }
        //hide keyboard
        self.view.endEditing(true)
        return false
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        if control == view.rightCalloutAccessoryView {
            performSegue(withIdentifier: "toTheProfile", sender: view)
        }
    }
        
    func loadInitialData() {
        petSitters = Place.places
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        datePickerFrom.minimumDate = Date()
        datePickerTo.minimumDate = Date()
        searchLocationTextField.delegate = self
        TextLabelFrom.addBottomBorderWithColor(color: UIColor(named: "blueFlash")!, width: 1)
        TextLabelTo.addBottomBorderWithColor(color: UIColor(named: "blueFlash")!, width: 1)
        let statusBarView = UIView(frame: UIApplication.shared.statusBarFrame)
        let statusBarColor = UIColor(named: "blueFlash")
        statusBarView.backgroundColor = statusBarColor
        view.addSubview(statusBarView)
        locationManager.requestWhenInUseAuthorization()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        locationManager.distanceFilter = 10
        locationManager.startUpdatingLocation()
        MapView.register(PetSitterMarkerView.self, forAnnotationViewWithReuseIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier)
        loadInitialData()
        MapView.addAnnotations(petSitters)
        MapView.showsUserLocation = true
        if let locValue = locationManager.location?.coordinate {
            centerMapOnLocation(location: locValue)
        }
        else {
            centerMapOnLocation(location: CLLocationCoordinate2D(latitude: 48.859377, longitude: 2.347525))
        }
        datePickerFrom.addTarget(self, action: #selector(datePickerChanged(picker:)), for: .valueChanged)
        datePickerTo.addTarget(self, action: #selector(datePickerChanged(picker:)), for: .valueChanged)

        

        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @objc func datePickerChanged(picker: UIDatePicker) {
        let from = datePickerFrom as UIDatePicker
        let to = datePickerTo as UIDatePicker
        MapView.removeAnnotations(petSitters)
        var filterPetSitters: [Place] = []
        for pet in petSitters
        {
            let dateFormatter = DateFormatter()
            let dateFormat = "yyyy-MM-dd"
            dateFormatter.dateFormat = dateFormat
            
            let startDate = dateFormatter.date(from: pet.from)
            let endDate = dateFormatter.date(from: pet.to)
            if startDate! < from.date && endDate! > to.date
            {
                filterPetSitters.append(pet)
            }
            MapView.addAnnotations(filterPetSitters)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension UIView {
    func addBottomBorderWithColor(color: UIColor, width: CGFloat) {
        let border = CALayer()
        border.backgroundColor = color.cgColor
        border.frame = CGRect(x: 0, y: self.frame.size.height - width, width: frame.size.width, height: width)
        self.layer.addSublayer(border)
    }
}

