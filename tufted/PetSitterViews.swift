//
//  PetSitterViews.swift
//  tufted
//
//  Created by Audrey ROEMER on 4/3/18.
//  Copyright © 2018 Audrey ROEMER. All rights reserved.
//

import UIKit
import MapKit

class PetSitterMarkerView: MKMarkerAnnotationView {
    override var annotation: MKAnnotation? {
        willSet {
            guard let petsitter = newValue as? Place else { return }
            canShowCallout = true
            calloutOffset = CGPoint(x: -5, y: 5)
            rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
            markerTintColor = petsitter.markerTintColor
//            glyphText = String(petsitter.locationName.first!)
            if let imageName = petsitter.imageName {
                glyphImage = UIImage(named: imageName)
            } else {
                glyphImage = nil
            }
        }
    }
}
