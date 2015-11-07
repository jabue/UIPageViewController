//
//  JBContendVC.swift
//  UIPageViewController
//
//  Created by EV Technologies Inc. on 2015-11-06.
//  Copyright © 2015 EVTech. All rights reserved.
//

import UIKit

class JBContendVC: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    var pageIndex: Int!
    var imageFile: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.imageView.image = UIImage(named: self.imageFile)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
