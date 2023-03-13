import UIKit
import Flutter
import google_mobile_ads

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
      
      let listTileFactory = ListTileNativeAdFactory()
      FLTGoogleMobileAdsPlugin.registerNativeAdFactory(
            self, factoryId: "listTile", nativeAdFactory: listTileFactory)
        
        GADMobileAds.sharedInstance().requestConfiguration.testDeviceIdentifiers = [ "7840e9d2486894d5a84c60e04d58b4fa", GADSimulatorID ]
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
