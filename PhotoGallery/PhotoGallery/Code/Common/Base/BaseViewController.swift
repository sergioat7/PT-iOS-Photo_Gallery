//
//  BaseViewController.swift
//  PhotoGallery
//
//  Created by Sergio Aragonés on 29/02/2020.
//  Copyright (c) 2020. All rights reserved.
//

import UIKit

protocol BaseViewProtocol: class {
    
}

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let message = "Showing " + NSStringFromClass(self.classForCoder)
        print(message)
    }
}
