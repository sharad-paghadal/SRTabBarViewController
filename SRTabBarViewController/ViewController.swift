//
//  ViewController.swift
//  SRTabBarViewController
//
//  Created by Sharad Paghadal on 17/11/17.
//  Copyright © 2017 Sharad Paghadal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var MyView: SRTabBarViewController! {
        didSet {
            let page1 = ViewController()
            page1.view.backgroundColor = UIColor.red
            let page2 = ViewController()
            page2.view.backgroundColor = UIColor.green
            let page3 = ViewController()
            page3.view.backgroundColor = UIColor.brown
            
            MyView.pages = [page1, page2, page3]
            MyView.titleForViewController = ["Red", "Green","Brown"]
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

