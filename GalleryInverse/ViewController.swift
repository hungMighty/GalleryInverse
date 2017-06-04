//
//  ViewController.swift
//  GalleryInverse
//
//  Created by Fury on 6/4/17.
//  Copyright © 2017 Fury. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        (1 ... 5).forEach {
            DispatchQueue.global(qos: .background).asyncAfter(deadline: .now() + .seconds($0)) {
                DispatchQueue.main.async {
                    print("Hi there")
                }
            }
        }
    }


}

