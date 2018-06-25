//
//  HealthViewController.swift
//  tufted
//
//  Created by Audrey ROEMER on 4/2/18.
//  Copyright © 2018 Audrey ROEMER. All rights reserved.
//

import UIKit

class HealthViewController: UIViewController {
    
    @IBAction func goToNav(_ sender: Any) {
        performSegue(withIdentifier: "toTheHealthNav", sender: view)
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

