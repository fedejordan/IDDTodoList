//
//  AppDelegate.swift
//  IDDTodoList
//
//  Created by Federico Jordan on 24/09/2019.
//  Copyright © 2019 PedidosYa. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var sharedDependenciesContainer: SharedDependenciesContainer!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        sharedDependenciesContainer = SharedDependenciesContainer()

        let loginBuilder = sharedDependenciesContainer.loginBuilder
        let initialViewController = loginBuilder.flowViewController(navigatorListener: self)

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = UINavigationController(rootViewController: initialViewController)
        window?.makeKeyAndVisible()

        return true
    }

}

extension AppDelegate: LoginNavigatorListener {

    func userDidLogin() {
        if let rootViewController = window?.rootViewController {
            let notesListBuilder = sharedDependenciesContainer.notesListBuilder
            let notesViewController = notesListBuilder.flowViewController()
            let initialViewController = UINavigationController(rootViewController: notesViewController)
            rootViewController.present(initialViewController, animated: true, completion: nil)
        }
    }


}
