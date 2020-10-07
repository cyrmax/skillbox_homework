import UIKit
import AVFoundation
import CoreData
import MobileCoreServices


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
/*
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default, options: [.duckOthers, .allowBluetooth, .allowAirPlay, .allowBluetoothA2DP])
        }
        catch let error {
            print("", "audio Session error", error.localizedDescription)
print("error starting")
//            return false
        }
*/
        if let options = launchOptions {
            let url = options[UIApplication.LaunchOptionsKey.url] as! URL
openBook(url)
            UserDefaults.standard.set(true, forKey: "shouldOpenLastBook")
//return true
        }
        UIApplication.shared.beginReceivingRemoteControlEvents()
//        return true
        window = UIWindow(frame: UIScreen.main.bounds)
let nav = UINavigationController(rootViewController: mainScreenViewController())
        nav.title = "Black Reader"
        window?.rootViewController = nav
        window?.makeKeyAndVisible()
        return true
    }

    func speak(_ string: String) {
let synth = AVSpeechSynthesizer()
        synth.speak(AVSpeechUtterance(string: string))
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
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "blackReader", managedObjectModel: bookModel)
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

}


