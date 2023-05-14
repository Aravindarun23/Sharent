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

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        window = NSWindow(contentRect: NSRect(x: 0, y: 0, width: NSScreen.main!.frame.width, height: NSScreen.main!.frame.height), styleMask: [.closable, .miniaturizable, .resizable, .titled, .fullSizeContentView], backing: .buffered, defer: true, screen: nil)
        window.titleVisibility = .hidden
        router = Router(window: window)
        window.titlebarSeparatorStyle = .none
        window.titlebarAppearsTransparent = true
        window.delegate = self
//        router.getProductBookedDateView()
        router.navigateHomePage(user: User(id: 1, name: "sdn", emailId: "dn", password: "djbj", mobileNumber: "jdb", address: "djgh", pincode: "bwjdj"), router: router)
//        router.launchLoginPage()
//        router.getProductBookedDateView()
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
