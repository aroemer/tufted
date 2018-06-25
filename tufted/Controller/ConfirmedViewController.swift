//
//  ConfirmedViewController.swift
//  d05
//
//  Created by Audrey Roemer on 22/05/2018.
//  Copyright © 2018 Audrey ROEMER. All rights reserved.
//

import Foundation
import UIKit

class ConfirmedViewController: UIViewController {
    
    @IBOutlet weak var bookingButton: UIButton!
    
    
    @IBAction func seeBookings(_ sender: Any) {
        performSegue(withIdentifier: "toTheBookings", sender: view)

    }
    
    override func viewDidLoad() {
        
        bookingButton.layer.borderWidth = 2
        bookingButton.layer.borderColor = UIColor.white.cgColor
        bookingButton.layer.cornerRadius = 4
        
        super.viewDidLoad()
        let statusBarView = UIView(frame: UIApplication.shared.statusBarFrame)
        let statusBarColor = UIColor(named: "blueFlash")
        statusBarView.backgroundColor = statusBarColor
        view.addSubview(statusBarView)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "toTheBookings" )
        {
            let storyBoard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyBoard.instantiateViewController(withIdentifier: "TabBarController") as! UITabBarController
            self.present(vc, animated: true, completion: nil)
            vc.selectedIndex = 3
        }
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
