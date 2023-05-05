//
//  AppDelegate.swift
//  SharentUI
//
//  Created by aravind-pt6209 on 16/02/23.
//

import Cocoa
import SharentBackendMacOS

class AppDelegate: NSObject, NSApplicationDelegate {

    var window : NSWindow!
    var router: Router!

    func applicationWillFinishLaunching(_ notification: Notification) {
        let fileManager = FileManager.default
        let documentsURL = fileManager.urls(for: .downloadsDirectory, in: .userDomainMask)[0]
        let folderURL = documentsURL.appendingPathComponent("2")
        print(folderURL)



        do {
            let fileURLs = try fileManager.contentsOfDirectory(atPath: folderURL.path)
            let imageFileURLs = fileURLs.filter { $0.hasSuffix(".jpg") || $0.hasSuffix(".png") }
            print(imageFileURLs)
            
            // Do something with the imageFileURLs array here
        } catch {
            print("Error while enumerating files \(folderURL.path): \(error.localizedDescription)")
        }

    }
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        window = NSWindow(contentRect: NSRect(x: 0, y: 0, width: NSScreen.main!.frame.width, height: NSScreen.main!.frame.height), styleMask: [.closable, .miniaturizable, .resizable, .titled, .fullSizeContentView], backing: .buffered, defer: true, screen: nil)
        window.titleVisibility = .hidden
        router = Router(window: window)
        window.titlebarSeparatorStyle = .none
        window.titlebarAppearsTransparent = true
        window.delegate = self
//        router.navigateHomePage(user: User(id: 1, name: "sdn", emailId: "dn", password: "djbj", mobileNumber: "jdb", address: "djgh", pincode: "bwjdj"), router: router)
        router.launchLoginPage()
        window.makeKeyAndOrderFront(nil)
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
    
    func applicationSupportsSecureRestorableState(_ app: NSApplication) -> Bool {
        return true
    }

//    func applicationShouldTerminate(_ sender: NSApplication) -> NSApplication.TerminateReply {
//        return .terminateCancel
//    }
    
}

extension AppDelegate: NSWindowDelegate {
    
    func windowWillEnterFullScreen(_ notification: Notification) {
        isFullScreen = true
    }
    
    func windowWillExitFullScreen(_ notification: Notification) {
        isFullScreen = false
    }
}
