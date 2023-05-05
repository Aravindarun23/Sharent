//
//  ProductCellView.swift
//  SharentUI
//
//  Created by aravind-pt6209 on 03/05/23.
//

import Foundation
import AppKit

class CellView: NSCollectionViewItem {

    static let identifier = "collectionCell"
    var productImage =  NSImageView()
    var price = NSTextField(labelWithString: "")
    var productName = NSTextField(labelWithString: "")
    var location = NSTextField(labelWithString: "")
    var likeButton = NSButton()
    var menuButton = NSButton()

    override init(nibName nibNameOrNil: NSNib.Name?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nil, bundle: nil)
        view = NSView()
        view.wantsLayer = true
        view.layer?.backgroundColor = .init(red: 1, green: 1, blue: 1, alpha: 0.1)
        view.layer?.cornerRadius = 9
        configureCellView()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        

    }
    
    func configureCellView() {
        
        
        price.textColor = .systemOrange
        price.font = .systemFont(ofSize: 21)
        productName.font = .systemFont(ofSize: 15)
        location.font = .systemFont(ofSize: 10)
        location.lineBreakMode = .byTruncatingTail
        productName.lineBreakMode = .byTruncatingTail
        var likeImage = NSImage(named: "emptyHeart")
        likeImage?.size = NSSize(width: 15, height: 15)
        likeImage = likeImage?.tint(color: .white)
        let menuImage = NSImage(named: "dotMenu")
        menuImage?.size = NSSize(width: 25, height: 25)
        let locationLogo = NSImageView()
        locationLogo.image = NSImage(named: "location")?.tint(color: .white)
        locationLogo.image?.size = NSSize(width: 13, height: 13)
        menuButton.isBordered = false
        menuButton.image = menuImage
        likeButton.isBordered = false
        likeButton.target = self
        likeButton.action = #selector(addFavourite(_:))
        likeButton.image = likeImage
        
        likeButton.translatesAutoresizingMaskIntoConstraints = false
        menuButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            likeButton.widthAnchor.constraint(equalToConstant: 15),
            likeButton.heightAnchor.constraint(equalToConstant: 15),
            menuButton.widthAnchor.constraint(equalToConstant: 15),
            menuButton.heightAnchor.constraint(equalToConstant: 15),
        ])
        view.addSubview(productImage)
        view.addSubview(price)
        view.addSubview(productName)
        view.addSubview(location)
        view.addSubview(menuButton)
        view.addSubview(likeButton)
        view.addSubview(locationLogo)
        
        
        price.translatesAutoresizingMaskIntoConstraints = false
        productName.translatesAutoresizingMaskIntoConstraints = false
        location.translatesAutoresizingMaskIntoConstraints = false
        productImage.translatesAutoresizingMaskIntoConstraints = false
        likeButton.translatesAutoresizingMaskIntoConstraints = false
        locationLogo.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate(
            [
                productImage.widthAnchor.constraint(equalToConstant: 170),
                productImage.heightAnchor.constraint(equalToConstant: 170),
                productImage.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -40),
                productImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                price.topAnchor.constraint(equalTo: productImage.bottomAnchor, constant: 10),
                price.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40),
                price.widthAnchor.constraint(equalToConstant: 200),
                productName.widthAnchor.constraint(equalToConstant: 200),
                productName.topAnchor.constraint(equalTo: price.bottomAnchor, constant: 5),
                productName.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40),
                location.topAnchor.constraint(equalTo: productName.bottomAnchor, constant: 7),
                location.widthAnchor.constraint(equalToConstant: 200),
                location.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 57),
                likeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor,constant: 106),
                likeButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -13),
                menuButton.centerXAnchor.constraint(equalTo: view.centerXAnchor,constant: 106),
                menuButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -270),
                locationLogo.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40),
                locationLogo.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -28)
            ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func addFavourite(_ sender: NSButton) {
        
        var selectedHeart =  NSImage(named: "selectedHeart")
        selectedHeart?.size = NSSize(width: 15, height: 15)
        selectedHeart = selectedHeart?.tint(color: .systemPink)
        sender.image = selectedHeart
    }
}
