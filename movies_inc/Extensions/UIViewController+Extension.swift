//
//  UIViewController+Extension.swift
//  movies_inc
//
//  Created by Bassuni on 8/14/20.
//  Copyright © 2020 Mahmoud Bassuni. All rights reserved.
//

import UIKit
extension UIViewController {
    static func instantiate<T>(storyboard : String) -> T {
        let storyBoard = UIStoryboard(name: storyboard, bundle: .main)
        let controller = storyBoard.instantiateViewController(identifier: "\(T.self)") as! T
        return controller
    }
}
