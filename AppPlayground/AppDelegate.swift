//
//  AppDelegate.swift
//  AppPlayground
//
//  Created by Kevin Carter on 2/2/17.
//  Copyright © 2017 Kevin Carter. All rights reserved.
//

import UIKit
import Firebase
import FBSDKCoreKit
import Batch
import FirebaseAuth

@objc
class NotificationDelegate: NSObject, UNUserNotificationCenterDelegate {
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        // Handle your notification action/open here
         BatchPush.handle(userNotificationCenter: center, didReceive: response)
    }
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
       
        BatchPush.handle(userNotificationCenter: center, willPresent: notification, willShowSystemForegroundAlert: true)
        // Since you set willShowSystemForegroundAlert to true, you should call completionHandler([.alert, .sound, .badge])
        // If set to false, you'd call completionHandler([])
    }
}


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let notificationDelegate = NotificationDelegate()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        FIRApp.configure()
        FBSDKApplicationDelegate.sharedInstance().application(application, didFinishLaunchingWithOptions: launchOptions)
        // Start Batch.
        UNUserNotificationCenter.current().delegate = notificationDelegate
        //TODO: - switch to live api key before store release
        Batch.start(withAPIKey: Constants.apiKeys.developmentBatch) // dev
        // Register for push notifications
        BatchPush.registerForRemoteNotifications()
        
        // Connect FIR + Batch
        let firebaseAuthData = FIRAuth.auth()?.currentUser
        Network.connectBatchWithFirebase(firebaseUserId: firebaseAuthData?.uid)
        return true
    }
    
    func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
        return FBSDKApplicationDelegate.sharedInstance().application(application, open: url, sourceApplication: sourceApplication, annotation: annotation)
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
        FBSDKAppEvents.activateApp()
        
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

