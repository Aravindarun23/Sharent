//
//  ProductBookedDatesView.swift
//  SharentUI
//
//  Created by aravind-pt6209 on 14/05/23.
//

import Foundation
import AppKit
import SharentBackendMacOS

class ProductBookedDatesView: NSView {
    
    let getProductBookedDatePresenter: GetProductBookedDatePresenterContract
    let product: Product
    var layout = NSCollectionViewFlowLayout()
    var collectionView = NSCollectionView()
    var section1:[String?] = []
    var section2:[String?] = []
    var section1Header = ""
    var section2Header = ""
    var totalDates = [String]()
    var bookedDates = [String]()
    weak var detailViewDelegate: ProductDetailView?
    
    init(getProductBookedDatePresenter: GetProductBookedDatePresenterContract, product: Product) {
        self.getProductBookedDatePresenter = getProductBookedDatePresenter
        self.product = product
        super.init(frame: NSRect())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidMoveToSuperview() {
        if superview != nil {
            getProductBookedDatePresenter.viewDidLoad(productId: product.id)
            addCollectionView()
            getAvailableDates()
        }
    }
 
   func addCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
       collectionView.isSelectable = true
        collectionView.collectionViewLayout = layout
       collectionView.allowsMultipleSelection = true
       layout.minimumInteritemSpacing = 7
       layout.sectionInset = NSEdgeInsets(top: 2, left: 0, bottom: 9, right: 0)
       collectionView.backgroundColors = [.clear]
        collectionView.register(DateView.self, forItemWithIdentifier: NSUserInterfaceItemIdentifier(DateView.identifier))
       collectionView.register(NSTextField.self, forSupplementaryViewOfKind: NSCollectionView.elementKindSectionHeader, withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "HeaderView"))
       addSubview(collectionView)
       collectionView.translatesAutoresizingMaskIntoConstraints = false
       NSLayoutConstraint.activate([
        collectionView.topAnchor.constraint(equalTo: topAnchor),
        collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
        collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
        collectionView.trailingAnchor.constraint(equalTo: trailingAnchor)])
    }
    
    func getAvailableDates() {
        
        let month =  ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
        let calendar = Calendar.current
        let startDate = Date()
        let dateRange = calendar.range(of: .day, in: .month, for: startDate)!
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"

        let dates = dateRange.compactMap { calendar.date(byAdding: .day, value: $0, to: startDate) }
        totalDates = dates.map { formatter.string(from: $0) }
        
        
        for range in 0..<totalDates.count {
            
            let dateString  = totalDates[range]
            if range == 0 {
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "yyyy-MM-dd"
                let date = dateFormatter.date(from: dateString)!
                let weekday = calendar.component(.weekday, from: date)
                for _ in 1..<weekday {
                    section1.append(nil)
                }
                let monthIndex = Int(String(dateString.dropLast(3)).suffix(2))
                section1Header = month[monthIndex!-1]
                
            }
            
            else if Int(String(dateString.suffix(2))) == 1 {
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "yyyy-MM-dd"
                let date = dateFormatter.date(from: dateString)!
                let weekday = calendar.component(.weekday, from: date)
                for _ in 1..<weekday {
                    section2.append(nil)
                }
                
                let monthIndex = Int(String(dateString.dropLast(3)).suffix(2))
                section2Header = month[monthIndex!-1]
                for index in range..<totalDates.count {
                    section2.append(totalDates[index])
                }
                break
            }
            section1.append(dateString)
        }
    }
}



extension ProductBookedDatesView: NSCollectionViewDataSource {
    
    func collectionView(_ collectionView: NSCollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return section1.count
        }
        return section2.count
    }
    
    func collectionView(_ collectionView: NSCollectionView, itemForRepresentedObjectAt indexPath: IndexPath) -> NSCollectionViewItem {
        let cell = collectionView.makeItem(withIdentifier: NSUserInterfaceItemIdentifier(DateView.identifier), for: indexPath) as! DateView
        
        if indexPath.section == 0 {
            if let date = section1[indexPath.item]  {
                if bookedDates.contains(date) {
                    cell.date.stringValue = "\(Int(date.suffix(2))!)"
                    cell.date.textColor = .white

                    cell.view.layer?.backgroundColor = .init(red: 1, green: 0, blue: 0, alpha: 0.3)
                    return cell
                }
                cell.date.stringValue = "\(Int(date.suffix(2))!)"
                cell.date.textColor = .white
                cell.view.layer?.backgroundColor = .init(red: 0, green: 1, blue: 0, alpha: 0.3)
                return cell
            }
            cell.view.layer?.backgroundColor = .clear
            cell.date.stringValue = ""
            return cell
          }
        else {
            if let date = section2[indexPath.item]  {
                if bookedDates.contains(date) {
                    cell.date.stringValue = "\(Int(date.suffix(2))!)"
                    cell.date.textColor = .white
                    cell.view.layer?.backgroundColor = .init(red: 1, green: 0, blue: 0, alpha: 0.3)
                    return cell
                }
                cell.date.stringValue = "\(Int(date.suffix(2))!)"
                cell.date.textColor = .white
                cell.view.layer?.backgroundColor = .init(red: 0, green: 1, blue: 0, alpha: 0.3)
                return cell
            }
            cell.view.layer?.backgroundColor = .clear
            cell.date.stringValue = ""
            return cell
        }
    }
}


extension ProductBookedDatesView: NSCollectionViewDelegateFlowLayout, NSCollectionViewDelegate {

    func collectionView(_ collectionView: NSCollectionView, layout collectionViewLayout: NSCollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> NSSize {
        return NSSize(width: 35, height: 35)
    }
    
    func collectionView(_ collectionView: NSCollectionView, layout collectionViewLayout: NSCollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> NSSize {
           return NSSize(width: collectionView.bounds.width, height: 25)
    }
    
    func numberOfSections(in collectionView: NSCollectionView) -> Int {
        2
    }
    
   func collectionView(_ collectionView: NSCollectionView, viewForSupplementaryElementOfKind kind: NSCollectionView.SupplementaryElementKind, at indexPath: IndexPath) -> NSView {
       let view = collectionView.makeSupplementaryView(ofKind: NSCollectionView.elementKindSectionHeader, withIdentifier: NSUserInterfaceItemIdentifier("HeaderView"), for: indexPath) as? NSTextField
       view?.isBordered = false
       view?.isEditable = false
       view?.textColor = .gray
       view?.backgroundColor = .clear
       view?.alignment = .center
       if indexPath.section == 0 {
           view?.stringValue = section1Header
       }
       else  {
           view?.stringValue = section2Header
       }
       return view!
   }
}


class DateView: NSCollectionViewItem {

    static let identifier = "dateCell"
    var date = NSTextField()

    override init(nibName nibNameOrNil: NSNib.Name?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nil, bundle: nil)
        view = NSView()
        view.wantsLayer = true
        view.layer?.backgroundColor = .init(red: 0, green: 0, blue: 0, alpha: 0.2)
        view.layer?.cornerRadius = 17.5
        configureDateCellView()
    }
    
    func configureDateCellView() {
        date.refusesFirstResponder = true
        date.backgroundColor = .clear
        date.isEditable = false
        date.isSelectable = false
        date.isBordered = false
        date.isHighlighted = false
        view.addSubview(date)
        date.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(
            [date.centerXAnchor.constraint(equalTo: view.centerXAnchor),
             date.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ProductBookedDatesView: GetProductBookedDateViewContract {
    
    func load(dateList: [String]) {
        bookedDates = dateList
        collectionView.reloadData()
        detailViewDelegate?.configurePopUpDates()
    }
}
