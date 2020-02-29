//
//  BaseRouter.swift
//  PhotoGallery
//
//  Created by Sergio Aragonés on 29/02/2020.
//  Copyright (c) 2020. All rights reserved.
//

import UIKit

class BaseRouter {
    
    func push(viewController: UIViewController, animated: Bool = true) {
        
        UIViewController.getCurrentNavigationController()?.pushViewController(viewController, animated: animated)
    }
}
