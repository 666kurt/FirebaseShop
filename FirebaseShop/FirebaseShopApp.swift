import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}

@main
struct FirebaseShopApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject var vm = ShopViewModel.shared
    
    var body: some Scene {
        WindowGroup {
            ShopScreen()
                .environmentObject(vm)
        }
    }
}
