//
//  AppDelegate.swift
//  SharentUI
//
//  Created by aravind-pt6209 on 16/02/23.
//

import Cocoa
import SharentBackendMacOS
@main
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet var window: NSWindow!
    var router: Router?


    func applicationDidFinishLaunching(_ aNotification: Notification) {
        router = Router(window: window)
        router?.searchProductView()
        // Insert code here to initialize your application
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    func applicationSupportsSecureRestorableState(_ app: NSApplication) -> Bool {
        return true
    }

}

