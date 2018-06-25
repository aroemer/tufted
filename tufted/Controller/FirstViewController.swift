//
//  FirstViewController.swift
//  d05
//
//  Created by Audrey Roemer on 17/05/2018.
//  Copyright © 2018 Audrey ROEMER. All rights reserved.
//

import UIKit
import MapKit

class FirstViewController: UIViewController {
    
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var basicInfo: UIView!
    
    @IBOutlet weak var needs: UIView!
    
    @IBAction func submitButton(_ sender: UIButton) {
        self.tabBarController?.selectedIndex = 1
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let blueFlash = UIColor(named: "blueFlash")
        
        submitButton.layer.borderWidth = 2
        submitButton.layer.borderColor = blueFlash?.cgColor
        submitButton.layer.cornerRadius = 4
        
        basicInfo.layer.shadowColor = UIColor.lightGray.cgColor
        basicInfo.layer.shadowOpacity = 0.8
        basicInfo.layer.shadowOffset = CGSize.zero
        basicInfo.layer.shadowRadius = 3
        basicInfo.layer.shouldRasterize = true

        needs.layer.shadowColor = UIColor.lightGray.cgColor
        needs.layer.shadowOpacity = 0.8
        needs.layer.shadowOffset = CGSize.zero
        needs.layer.shadowRadius = 3
        needs.layer.shouldRasterize = true

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
