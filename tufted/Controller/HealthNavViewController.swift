//
//  HealthNavViewController.swift
//  d05
//
//  Created by Audrey Roemer on 23/05/2018.
//  Copyright © 2018 Audrey ROEMER. All rights reserved.
//

import UIKit

class HealthNavViewController: UIViewController {
    
    @IBAction func backButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
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
