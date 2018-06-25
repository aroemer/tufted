//
//  Places.swift
//  tufted
//
//  Created by Audrey ROEMER on 4/2/18.
//  Copyright © 2018 Audrey ROEMER. All rights reserved.
//

import UIKit
import MapKit

class Place: NSObject, MKAnnotation {
     let title: String?
    let locationName: String
    let locationDesc: String
    var coordinate: CLLocationCoordinate2D
    let Options :  String
    public var markerTintColor: UIColor  {
        if Options == "home"
        {
            return UIColor(named: "blueFlash")!
        }
        else if Options == "there"
        {
            return UIColor(named: "blueMiddle")!
        }
        else
        {
            return UIColor(named: "blueDark")!
        }
    }
    
    var favoured: Bool
    
    var imageName: String? {
        if title == "Max" { return "goldicon" }
        else if (title == "Emilie" || title == "Matthieu" || title == "Quentin") { return "silvericon" }
        else if (title == "Jeanne") { return "bronzeicon" }
        return "footprint"
    }
    let from: String
    let to: String
    
    init(title: String, locationName: String, locationDesc: String, coordinate: CLLocationCoordinate2D, Options: String, favoured: Bool, from: String, to: String) {
        self.title = title
        self.locationName = locationName
        self.locationDesc = locationDesc
        self.coordinate = coordinate
        self.Options = Options
        self.favoured = favoured
        self.from = from
        self.to = to
        
        super.init()
    }
    
    var subtitle: String? {
        return locationName
    }
    
    static var places: [Place] = [
        Place(title: "Julie", locationName: "Dog lover", locationDesc: "2 dogs", coordinate: CLLocationCoordinate2D(latitude: 48.896649, longitude:2.318350), Options: "home", favoured: true, from: "2018-05-17", to: "2018-12-17"),
        Place(title: "Emilie", locationName: "I take great care of your dogs", locationDesc: "one cat", coordinate: CLLocationCoordinate2D(latitude: 48.914326, longitude: 2.324946), Options: "both", favoured: false, from: "2018-05-17", to: "2018-12-17"),
        Place(title: "Matthieu", locationName: "The best pet sitter in Paris", locationDesc: "I love dogs", coordinate: CLLocationCoordinate2D(latitude: 48.859526, longitude: 2.382872), Options: "there", favoured: false, from: "2018-05-17", to: "2018-05-28"),
        Place(title: "Alex", locationName: "Pets are my passion", locationDesc: "I love dogs", coordinate: CLLocationCoordinate2D(latitude: 48.871730, longitude: 2.353285), Options: "both", favoured: false, from: "2018-05-17", to: "2018-05-25"),
        Place(title: "Max", locationName: "I love dogs", locationDesc: "I love dogs", coordinate: CLLocationCoordinate2D(latitude: 48.859377, longitude: 2.347525), Options: "both", favoured: true, from: "2018-05-17", to: "2018-12-17"),
        Place(title: "Tom", locationName: "I'm a student who loves pets", locationDesc: "I love dogs", coordinate: CLLocationCoordinate2D(latitude: 48.872760, longitude: 2.292566), Options: "both", favoured: false, from: "2018-05-17", to: "2018-05-25"),
        Place(title: "Aurélie", locationName: "I'm a student who loves pets", locationDesc: "I love dogs", coordinate: CLLocationCoordinate2D(latitude: 48.867970, longitude: 2.304847), Options: "home", favoured: false, from: "2018-05-17", to: "2018-05-25"),
        Place(title: "Virginie", locationName: "I'm a student who loves pets", locationDesc: "I love dogs", coordinate: CLLocationCoordinate2D(latitude: 48.849351, longitude: 2.294580), Options: "there", favoured: false, from: "2018-05-17", to: "2018-05-25"),
        Place(title: "Fabrice", locationName: "I have one dog", locationDesc: "I love dogs", coordinate: CLLocationCoordinate2D(latitude: 48.849855, longitude: 2.347351), Options: "both", favoured: false, from: "2018-05-17", to: "2018-06-03"),
        Place(title: "Louane", locationName: "I'm a student who loves pets", locationDesc: "I love dogs", coordinate: CLLocationCoordinate2D(latitude: 48.844501, longitude: 2.284874), Options: "home", favoured: false, from: "2018-05-17", to: "2018-06-03"),
        Place(title: "Jacques", locationName: "I'm a student who loves pets", locationDesc: "I love dogs", coordinate: CLLocationCoordinate2D(latitude: 48.855176, longitude: 2.278951), Options: "both", favoured: false, from: "2018-05-17", to: "2018-05-25"),
        Place(title: "Bernard", locationName: "I take care of pets like my owns", locationDesc: "I love dogs", coordinate: CLLocationCoordinate2D(latitude: 48.853194, longitude: 2.329688), Options: "both", favoured: false, from: "2018-05-17", to: "2018-05-25"),
        Place(title: "Christine", locationName: "I'm a student who loves pets", locationDesc: "I love dogs", coordinate: CLLocationCoordinate2D(latitude: 48.832965, longitude: 2.317636), Options: "there", favoured: false, from: "2018-05-17", to: "2018-05-25"),
        Place(title: "Hana", locationName: "I'm a student who loves pets", locationDesc: "I love dogs", coordinate: CLLocationCoordinate2D(latitude: 48.837136, longitude: 2.300827), Options: "home", favoured: false, from: "2018-05-17", to: "2018-05-25"),
        Place(title: "Yves", locationName: "I'm a student who loves pets", locationDesc: "I love dogs", coordinate: CLLocationCoordinate2D(latitude: 48.874119, longitude: 2.344486), Options: "home", favoured: false, from: "2018-05-17", to: "2018-05-25"),
        Place(title: "Quentin", locationName: "I am a pet lover", locationDesc: "I love dogs", coordinate: CLLocationCoordinate2D(latitude: 48.859079, longitude: 2.361995), Options: "there", favoured: false, from: "2018-05-17", to: "2018-05-25"),
        Place(title: "Jeanne", locationName: "Dogs are amazing", locationDesc: "I love dogs", coordinate: CLLocationCoordinate2D(latitude: 48.867436, longitude: 2.347576), Options: "home", favoured: false, from: "2018-05-17", to: "2018-06-03"),
        Place(title: "Manon", locationName: "I love my job", locationDesc: "I love dogs", coordinate: CLLocationCoordinate2D(latitude: 48.862399, longitude: 2.343842), Options: "home", favoured: false, from: "2018-05-17", to: "2018-05-25"),
        Place(title: "Pierre", locationName: "You can trust me", locationDesc: "I love dogs", coordinate: CLLocationCoordinate2D(latitude: 48.859067, longitude: 2.342898), Options: "there", favoured: false, from: "2018-05-17", to: "2018-06-03"),
        
    ]
    
}


    



