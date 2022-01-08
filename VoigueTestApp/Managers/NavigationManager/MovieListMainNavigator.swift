//
//  BookListMainNavigator.swift
//  VoigueTestApp
//
//  Created by mac on 8/1/22.
//

import UIKit

class MainNavigator: Coordinator {
    
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = MovieListViewController.instantiateMain()
        vc.coordinator = self
        vc.title = "MovieList"
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor.red
        navigationController.navigationBar.standardAppearance = appearance
        navigationController.navigationBar.scrollEdgeAppearance = navigationController.navigationBar.standardAppearance
        navigationController.navigationBar.prefersLargeTitles = true
        navigationController.pushViewController(vc, animated: false)
    }
}
