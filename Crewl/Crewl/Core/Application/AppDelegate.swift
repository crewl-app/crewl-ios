//
//  AppDelegate.swift
//  Crewl
//
//  Created by NomoteteS on 9.02.2023.
//

import Foundation
import Firebase
import NotificationCenter
import GoogleMaps
import GooglePlaces



class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    GMSServices.provideAPIKey("AIzaSyBBQ0dT2vVevclSTtkgZ99mPOG-IZcAcsQ")
    GMSPlacesClient.provideAPIKey("AIzaSyBBQ0dT2vVevclSTtkgZ99mPOG-IZcAcsQ")
    print("SwiftUI_2_Lifecycle_PhoneNumber_AuthApp application is starting up. ApplicationDelegate didFinishLaunchingWithOptions.")
    return true
  }

  func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
    print("\(#function)")
    Auth.auth().setAPNSToken(deviceToken, type: .sandbox)
  }
  
  func application(_ application: UIApplication, didReceiveRemoteNotification notification: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
    print("\(#function)")
    if Auth.auth().canHandleNotification(notification) {
      completionHandler(.noData)
      return
    }
  }
  
  func application(_ application: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any]) -> Bool {
    print("\(#function)")
    if Auth.auth().canHandle(url) {
      return true
    }
    return false
  }
}

extension AppDelegate: MessagingDelegate {
    func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String?) {

      let deviceToken:[String: String] = ["token": fcmToken ?? ""]
        print("Device token: ", deviceToken)
    }
}
