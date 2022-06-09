//
//  ViewController.swift
//  Project1
//
//  Created by Selen Yanar on 9.06.2022.
//

import UIKit

class ViewController: UIViewController {
    
    var pictures = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items {
            if item.hasPrefix("nssl") {
                //this is a picture to load
                pictures.append(item)
            }
        }
        
        print(pictures)
        
    }
}

