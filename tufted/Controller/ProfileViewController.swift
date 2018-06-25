//
//  ProfileViewController.swift
//  d05
//
//  Created by Audrey Roemer on 19/05/2018.
//  Copyright © 2018 Audrey ROEMER. All rights reserved.
//

import Foundation
import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var navigationBarTitle: UINavigationItem!
    
    @IBOutlet weak var confirmationButton: UIButton!
    
    @IBAction func backButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)

    }
    override func viewDidLoad() {
        let blueFlash = UIColor(named: "blueFlash")
        
        confirmationButton.layer.borderWidth = 2
        confirmationButton.layer.borderColor = blueFlash?.cgColor
        confirmationButton.layer.cornerRadius = 4
        
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
