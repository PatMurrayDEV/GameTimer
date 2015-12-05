//
//  AppDelegate.swift
//  PictionaryTimer
//
//  Created by Patrick Murray on 5/12/2015.
//  Copyright © 2015 Patrick Murray. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var secondaryWindow: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        
        
        
        //Subscribing to a UIScreenDidConnect/DisconnectNotification to react to changes in the status of connected screens.
        let screenConnectionStatusChangedNotification = NSNotificationCenter.defaultCenter()
        screenConnectionStatusChangedNotification.addObserver(self, selector:("screenConnectionStatusChanged"), name:UIScreenDidConnectNotification, object:nil)
        screenConnectionStatusChangedNotification.addObserver(self, selector:("screenConnectionStatusChanged"), name:UIScreenDidDisconnectNotification, object:nil)
        
        //Initial check on how many screens are connected to the device on launch of the application.
        if (UIScreen.screens().count > 1) {
            self.screenConnectionStatusChanged()
        }

        
        return true
    }


    //Managing connection and disconnection of screens.
    func screenConnectionStatusChanged () {
        if (UIScreen.screens().count == 1) {
            secondaryWindow!.rootViewController = nil
            
        }   else {
            let screens : Array = UIScreen.screens()
            let newScreen : AnyObject! = screens.last
            
            secondaryScreenSetup(newScreen as! UIScreen)
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewControllerWithIdentifier("externalScreen") as! SecondaryViewController
            
            secondaryWindow!.rootViewController = vc
            secondaryWindow!.makeKeyAndVisible()
        }
        
    }
    
    //Here we set up the secondary screen.
    func secondaryScreenSetup (screen : UIScreen) {
        let newWindow : UIWindow = UIWindow(frame: screen.bounds)
        newWindow.screen = screen
        newWindow.hidden = false
        
        secondaryWindow = newWindow
    }

    
    
    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

