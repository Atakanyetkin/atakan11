//
//  AppDelegate.swift
//  Font Changer
//
//  Created by Y. Yılmaz Erdoğmuş on 05.12.2022.
//

import UIKit

@main
final class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        Constant.shared.getValuesFromPlist()
        configureWindow(destinationVC: HomeVC())
        return true
    }

    func configureWindow(destinationVC: UIViewController) {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.overrideUserInterfaceStyle = .light
        window?.makeKeyAndVisible()
        window?.rootViewController = destinationVC
    }
}
