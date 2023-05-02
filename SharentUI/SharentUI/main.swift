//
//  main.swift
//  SharentUI
//
//  Created by aravind-pt6209 on 01/05/23.
//

import Foundation
import AppKit

let app = NSApplication.shared

let delegate = AppDelegate()
app.delegate = delegate

_ = NSApplicationMain(CommandLine.argc, CommandLine.unsafeArgv)
