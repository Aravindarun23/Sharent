//
//  OrderCellView.swift
//  SharentUI
//
//  Created by aravind-pt6209 on 12/05/23.
//

import Foundation
import AppKit

class OrderCellView: NSTableCellView {
    
    static var identifier =  "OrderCell"
    
    var productImage = NSImageView()
    var productName = NSTextField(labelWithString: "")
    var sellerName = NSTextField(labelWithString: "")
    var orderDate =  NSTextField(labelWithString: "")
    var status = NSTextField(labelWithString: "")
    
   
    override init(frame frameRect: NSRect) {

        super.init(frame: frameRect)
        addSubview(productImage)
        addSubview(productName)
        addSubview(sellerName)
        addSubview(status)
        addSubview(orderDate)

        productImage.wantsLayer = true
        productName.isEditable = false
        productName.alignment = .left
        productName.lineBreakMode = .byTruncatingTail
        productName.font = .systemFont(ofSize: 15, weight: .medium)
        sellerName.isEditable = false
        sellerName.alignment = .left
        sellerName.lineBreakMode = .byTruncatingTail
        sellerName.font = .systemFont(ofSize: 12, weight: .medium)
        status.isEditable = false
        status.alignment = .left
        status.font = .systemFont(ofSize: 13, weight: .medium)
        orderDate.isEditable = false
        orderDate.alignment = .left
        orderDate.font = .systemFont(ofSize: 13, weight: .medium)
        
        productImage.translatesAutoresizingMaskIntoConstraints = false
        productName.translatesAutoresizingMaskIntoConstraints = false
        sellerName.translatesAutoresizingMaskIntoConstraints = false
        status.translatesAutoresizingMaskIntoConstraints = false
        orderDate.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            productImage.widthAnchor.constraint(equalToConstant: 40),
            productImage.heightAnchor.constraint(equalToConstant: 40),
            productImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            productImage.leadingAnchor.constraint(equalTo: leadingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            productName.leadingAnchor.constraint(equalTo: productImage.trailingAnchor, constant: 20),
            productName.topAnchor.constraint(equalTo: productImage.topAnchor)
        ])
        
        NSLayoutConstraint.activate([
            sellerName.leadingAnchor.constraint(equalTo: productImage.trailingAnchor, constant: 20),
            sellerName.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
        ])
    
        NSLayoutConstraint.activate([
            status.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -4),
            status.leadingAnchor.constraint(greaterThanOrEqualTo: sellerName.trailingAnchor),
            status.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)
        ])

        NSLayoutConstraint.activate([
            orderDate.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -4),
            orderDate.topAnchor.constraint(equalTo: topAnchor, constant: 10),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


class CustomTableRowView: NSTableRowView {
    
       let cornerRadius: CGFloat = 8.0
       let horizontalPadding: CGFloat = 6.0
       
       override func drawBackground(in dirtyRect: NSRect) {
           super.drawBackground(in: dirtyRect)
           
           let drawingRect = NSRect(x: dirtyRect.minX + horizontalPadding,
                                    y: dirtyRect.minY,
                                    width: dirtyRect.width - (horizontalPadding * 2),
                                    height: dirtyRect.height)
           let clipPath = NSBezierPath(roundedRect: drawingRect, xRadius: cornerRadius, yRadius: cornerRadius)
           clipPath.addClip()
           clipPath.fill()
       }
       
    override func drawSelection(in dirtyRect: NSRect) {
        super.drawSelection(in: dirtyRect)
        #colorLiteral(red: 0.2857446671, green: 0.2659824491, blue: 0.2533746064, alpha: 1).setFill()
        dirtyRect.fill()
    }
    
    override func drawSeparator(in dirtyRect: NSRect) {
        super.drawSeparator(in: dirtyRect)
        NSColor.gray.setStroke()
        let line = NSBezierPath()
        line.move(to: NSPoint(x: dirtyRect.minX+13, y: dirtyRect.maxY))
        line.line(to: NSPoint(x: dirtyRect.maxX-13, y: dirtyRect.maxY))
        line.lineWidth = 0.5
        line.stroke()
    }
}

