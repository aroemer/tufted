//
//  BookingViewController.swift
//  d05
//
//  Created by Audrey Roemer on 22/05/2018.
//  Copyright © 2018 Audrey ROEMER. All rights reserved.
//

import Foundation
import UIKit

class BookingViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let statusBarView = UIView(frame: UIApplication.shared.statusBarFrame)
        let statusBarColor = UIColor(named: "blueFlash")
        statusBarView.backgroundColor = statusBarColor
        view.addSubview(statusBarView)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
