//
//  AppCoordinator.swift
//  movies_inc
//
//  Created by Bassuni on 8/14/20.
//  Copyright © 2020 Mahmoud Bassuni. All rights reserved.
//
import UIKit

class AppCoordinator : Coordinator {
    
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    let window : UIWindow?
   
    init(window: UIWindow? , navigationController: UINavigationController) {
        self.window = window
        self.navigationController = navigationController
    }
    
    func start() {
        // preparing root view
        let navigationController = UINavigationController()
        let myCoordinator = MovieCoordinator(navigationController: navigationController)
        addCoordinator(coordinator: myCoordinator)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
          myCoordinator.start()
        
    }
    
}
