//
//  ViewController.swift
//  GalleryInverse
//
//  Created by Fury on 6/4/17.
//  Copyright © 2017 Fury. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var inactiveQueue: DispatchQueue!

    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
//        (1 ... 5).forEach {
//            DispatchQueue.global(qos: .background).asyncAfter(deadline: .now() + .seconds($0)) {
//                DispatchQueue.main.async {
//                    print("Hi there")
//                }
//            }
//        }
        
//        let praQueue1 = DispatchQueue(label: "com.hung1", qos: .userInteractive)
//        let praQueue2 = DispatchQueue(label: "com.hung2", qos: .background)
//        praQueue2.async {
//            for i in 0..<10 {
//                print("background queue", i)
//            }
//        }
//        praQueue1.async {
//            for i in 0..<10 {
//                print("user queue", i)
//            }
//        }
        
        callOnConcurrentQueue()
        inactiveQueue.activate()
    }
    
    private func callOnConcurrentQueue() {
        let localQueue = DispatchQueue(label: "com.anotherQueue", qos: .default, attributes: [.concurrent, .initiallyInactive])
        inactiveQueue = localQueue
        inactiveQueue.async {
            for _ in 0..<10 {
                print("First")
            }
        }
        inactiveQueue.async {
            for _ in 0..<10 {
                print("Second")
            }
        }
        inactiveQueue.async {
            for _ in 0..<10 {
                print("Third")
            }
        }
    }

}

