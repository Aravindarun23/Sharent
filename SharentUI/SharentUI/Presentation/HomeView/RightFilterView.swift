//
//  RightFilterView.swift
//  SharentUI
//
//  Created by aravind-pt6209 on 02/05/23.
//

import Foundation
import AppKit

class FilterVIew: NSView {
    
    var filterView: NSView!
    
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        configureFilterView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureFilterView() {
        filterView = NSView()
        filterView.wantsLayer = true
        filterView.layer?.cornerRadius = 10
        addSubview(filterView)
        filterView.layer?.backgroundColor = .init(red: 0.2, green: 0.2, blue: 1, alpha: 0.15)
        filterView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            filterView.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            filterView.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -20),
            filterView.leftAnchor.constraint(equalTo: leftAnchor),
            filterView.rightAnchor.constraint(equalTo: rightAnchor)
        ])
    }
    
}
