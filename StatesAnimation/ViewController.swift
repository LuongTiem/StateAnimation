//
//  ViewController.swift
//  StatesAnimation
//
//  Created by ReasonAmu on 6/7/17.
//  Copyright © 2017 ReasonAmu. All rights reserved.
//

import UIKit

class ViewController: BaseVC {
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func pushView(_ sender: Any) {
        
        let viewB = self.storyboard?.instantiateViewController(withIdentifier: "viewB")
        
        self.navigationController?.pushViewController(viewB!, animated: true)
    }
    
    
    

    
   
}

