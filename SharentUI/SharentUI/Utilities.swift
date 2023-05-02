//
//  Utilities.swift
//  SharentUI
//
//  Created by aravind-pt6209 on 02/05/23.
//

import Foundation
import AppKit

var isFullScreen =  false

public var imagesSection1 = ["sara","bike","car","sara","sara","sara","sara","sara","sara","sara","sara","sara","sara","sara","sara","sara","sara","sara","sara","sara","sara","sara","sara","sara","sara","sara","sara","sara","sara","sara","sara","sara","sara","sara","sara","sara","sara","sara","sara","sara","sara","sara","sara","sara","sara","sara","sara","sara","sara","sara","sara","sara","sara","sara","sara","sara","sara","sara","sara","sara","sara","sara","sara","sara","sara","sara","sara","sara","sara","sara","sara","sara","sara","sara","sara","sara","sara","sara","sara","sara","sara","sara","sara","sara","sara","sara","sara","sara","sara","sara","sara","sara","sara","sara","sara","sara","sara","sara","sara","sara","sara","sara","sara","sara","sara","sara","sara","sara","sara","sara","sara","sara","sara","sara","sara","sara","sara","sara","sara","sara","sara","sara","sara","sara","sara","sara","sara","sara","sara","sara","sara","sara","sara","sara","sara","sara","sara","sara","sara","sara","sara","sara","sara","sara","sara","sara","sara","sara","sara","sara","sara","sara","sara","sara","sara","sara","sara","sara","sara","sara","sara","sara","sara","sara","sara","sara","sara","sara","sara","sara","sara","sara","sara","sara","sara"]


extension NSImage {
    func tint(color: NSColor) -> NSImage {
        let image = self.copy() as! NSImage
        image.lockFocus()

        color.set()

        let imageRect = NSRect(origin: NSZeroPoint, size: image.size)
        imageRect.fill(using: .sourceAtop)

        image.unlockFocus()

        return image
    }
}
