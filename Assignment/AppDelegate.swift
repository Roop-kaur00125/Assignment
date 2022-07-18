//
//  AppDelegate.swift
//  Assignment
//
//  Created by Rupinder kaur on 18/07/22.
//

import UIKit
import CoreData

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var applicationCoordinator: ApplicationCoordinator?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        let appCordinator = ApplicationCoordinator(window: window)
        self.window = window
        self.applicationCoordinator = appCordinator
        
        appCordinator.start()
        CoreDataStack.shared.saveContext()
        return true
    }
}

