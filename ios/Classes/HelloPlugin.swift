import Alamofire
import Flutter
import UIKit

public class HelloPlugin: NSObject, FlutterPlugin {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(
            name: "hello_plugin",
            binaryMessenger: registrar.messenger()
        )
        let instance = HelloPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }

    public func handle(
        _ call: FlutterMethodCall,
        result: @escaping FlutterResult
    ) {
        switch call.method {
        case "getPlatformVersion":
            result("iOS " + UIDevice.current.systemVersion)

        case "getDistance":
            if let args = call.arguments as? [String: Any],
                let x1 = args["x1"] as? Double,
                let y1 = args["y1"] as? Double,
                let x2 = args["x2"] as? Double,
                let y2 = args["y2"] as? Double
            {
                let distance = distance(x1: x1, y1: y1, x2: x2, y2: y2)
                result(distance)
            } else {
                result(
                    FlutterError(
                        code: "INVALID_ARGUMENT",
                        message: "Missing coordinates",
                        details: nil
                    )
                )
            }

        case "getAppVersionCode":
            if let infoDict = Bundle.main.infoDictionary,
                let versionCode = infoDict["CFBundleVersion"] as? String
            {
                result(Int(versionCode))
            } else {
                result(
                    FlutterError(
                        code: "UNAVAILABLE",
                        message: "Version code not available",
                        details: nil
                    )
                )
            }

        case "ALMF":
            AF.request("https://httpbin.org/get").response { response in
                debugPrint(response)
            }

        default:
            result(FlutterMethodNotImplemented)
        }
    }
}

func distance(x1: Double, y1: Double, x2: Double, y2: Double) -> Double {
    return sqrt(pow(x2 - x1, 2.0) + pow(y2 - y1, 2.0))
}
