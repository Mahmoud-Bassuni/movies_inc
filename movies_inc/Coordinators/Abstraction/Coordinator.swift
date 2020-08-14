//
//  Coordinator.swift
//  movies_inc
//
//  Created by Bassuni on 8/14/20.
//  Copyright © 2020 Mahmoud Bassuni. All rights reserved.
//

import UIKit

protocol Coordinator : class  {
    var navigationController: UINavigationController { get }
    var childCoordinators: [Coordinator] { get set }
    func start()
}

extension Coordinator {
    
    func addCoordinator(coordinator : Coordinator) {
        childCoordinators.append(coordinator)
    }
    
    func removeCoordinator(coordinator : Coordinator) {
        childCoordinators =  childCoordinators.filter({$0 !== coordinator})
    }
}

