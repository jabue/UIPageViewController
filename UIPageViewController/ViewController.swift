//
//  ViewController.swift
//  UIPageViewController
//
//  Created by EV Technologies Inc. on 2015-11-06.
//  Copyright © 2015 EVTech. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPageViewControllerDataSource {

    var pageViewController: UIPageViewController!
    var pageImages:NSArray!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.pageImages = NSArray(objects: "campus", "Road")
        self.pageViewController = self.storyboard?.instantiateViewControllerWithIdentifier("PageViewController") as! UIPageViewController
        
        self.pageViewController.dataSource = self
        
        var startVC = self.viewControllerAtIndex(0) as JBContendVC
        var viewControllers = NSArray(object: startVC)
        self.pageViewController.setViewControllers(viewControllers as! [UIViewController], direction: .Forward, animated: true, completion: nil)
        
        self.pageViewController.view.frame = CGRectMake(0, 0, self.view.frame.width, self.view.frame.height)
        self.addChildViewController(self.pageViewController)
        self.view.addSubview(self.pageViewController.view)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // used to generate a ContentViewController to show
    func viewControllerAtIndex(index: Int) -> JBContendVC {
        if((self.pageImages.count == 0) || (index >= self.pageImages.count)){
            return JBContendVC()
        }
        
        var vc: JBContendVC = self.storyboard?.instantiateViewControllerWithIdentifier("ContendView") as! JBContendVC
        
        vc.imageFile = self.pageImages[index] as! String
        vc.pageIndex = index
        
        return vc
    }
    
    // Mark: - Page View Controller Data Source
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        
        var vc = viewController as! JBContendVC
        var index = vc.pageIndex as Int
        
        if (index == 0 || index == NSNotFound) {
            return nil
        }
        
        index--
        return self.viewControllerAtIndex(index)
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        var vc = viewController as! JBContendVC
        var index = vc.pageIndex as Int
        
        if (index == NSNotFound) {
            return nil
        }
        
        index++
        
        if (index == self.pageImages.count) {
            return nil
        }
        
        return self.viewControllerAtIndex(index)
    }

}

