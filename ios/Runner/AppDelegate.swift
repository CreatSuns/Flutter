import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

    override func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        let controller : FlutterViewController = window?.rootViewController as! FlutterViewController;
        let tokenChannel = FlutterMethodChannel(name: "material.flutter.io/deviceToken", binaryMessenger: (controller as? FlutterBinaryMessenger)!);
        tokenChannel.setMethodCallHandler { (call, result) in
            if (call.method == "getDviceTokenNative") {
                let aa = deviceToken.base64EncodedString()
                result(aa as Any);
            }
        }
    }
}
