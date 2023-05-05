//
//  SearchProductView.swift
//  SharentUI
//
//  Created by aravind-pt6209 on 07/03/23.
//

import Foundation
import AppKit
import SharentBackendMacOS


class SearchProductView: NSView {
    
    var collectionView: NSView!
    var productCollectionView: NSCollectionView
    var productScrollView: NSScrollView
    var layout: NSCollectionViewFlowLayout
    var productNotFound: NSImageView
    var products: [Product] = []
    
    let searchProductPresenter: SearchProductPresenterContract
    
    init(searchProductPresenter: SearchProductPresenterContract) {
        self.searchProductPresenter = searchProductPresenter
        productCollectionView = NSCollectionView()
        productScrollView = NSScrollView()
        layout = NSCollectionViewFlowLayout()
        productNotFound = NSImageView()
        super.init(frame: NSRect())
    }
    
    
    override func viewDidMoveToSuperview() {
        configureCollectionView()
        searchProductPresenter.viewDidLoad(productName: "", pincode: "614602", filter: nil, range: nil)
    }

    required init?(coder decoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCollectionView() {
       
        collectionView = NSView()
        collectionView.wantsLayer = true
        collectionView.layer?.cornerRadius = 10
        productCollectionView.dataSource = self
        productCollectionView.delegate = self
        collectionView.layer?.backgroundColor = .init(red: 0.219607383, green: 0.2196081877, blue: 0.2367719412, alpha: 0.15)
        addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -20),
            collectionView.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            collectionView.rightAnchor.constraint(equalTo: rightAnchor, constant: -12)
        
        ])
        
        layout.sectionInset = NSEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        layout.minimumLineSpacing = 40
        productCollectionView.collectionViewLayout = layout
        productCollectionView.backgroundColors = [.clear]
        productScrollView.documentView = productCollectionView
        
        productScrollView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.addSubview(productScrollView)

        NSLayoutConstraint.activate( [
            productScrollView.leftAnchor.constraint(equalTo: collectionView.leftAnchor),
            productScrollView.topAnchor.constraint(equalTo: collectionView.topAnchor),
            productScrollView.rightAnchor.constraint(equalTo: collectionView.rightAnchor),
            productScrollView.bottomAnchor.constraint(equalTo: collectionView.bottomAnchor),
                ])
        
        productCollectionView.register(CellView.self, forItemWithIdentifier: NSUserInterfaceItemIdentifier(CellView.identifier))
        productNotFound.image = NSImage(named: "productNotFoundError")
        productNotFound.image?.size = NSSize(width: 300, height: 150)
    }
}


extension SearchProductView: NSCollectionViewDataSource {

    func collectionView(_ collectionView: NSCollectionView, numberOfItemsInSection section: Int) -> Int {
            return products.count
    }


    func collectionView(_ collectionView: NSCollectionView, itemForRepresentedObjectAt indexPath: IndexPath) -> NSCollectionViewItem {
        
        let cell = collectionView.makeItem(withIdentifier: NSUserInterfaceItemIdentifier(CellView.identifier), for: indexPath) as! CellView
        cell.productImage.image = NSImage(named: products[indexPath.item].name)
        let number = products[indexPath.item].price
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        let formattedNumber = formatter.string(from: NSNumber(value: number)) ?? ""
        cell.price.stringValue = formattedNumber
        cell.productName.stringValue = products[indexPath.item].name
        cell.location.stringValue = ((products[indexPath.item].seller.address).uppercased())
        cell.identifier = NSUserInterfaceItemIdentifier(CellView.identifier)
        return cell
    }
}

extension  SearchProductView: NSCollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: NSCollectionView, layout collectionViewLayout: NSCollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> NSSize {
            return NSSize(width: 250, height: 300)
    }
}


extension SearchProductView: SearchProductViewContract {
    
    func load(products: [Product]) {
        productCollectionView.backgroundView = nil
        self.products = products
        productCollectionView.reloadData()
    }
    
    func failure(error: Error) {
        self.products = []
        productCollectionView.reloadData()
        productCollectionView.backgroundView = productNotFound
    }
}


