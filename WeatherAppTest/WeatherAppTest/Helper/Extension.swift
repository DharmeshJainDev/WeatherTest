//
//  Extension.swift
//  WeatherTest
//
//  Created by Dharmesh Kochar on 26/10/23.
//

import UIKit

extension UITableView {
    // Register Table View Cell Nib
    func registerCell(with identifier: UITableViewCell.Type) {
        self.register(UINib(nibName: "\(identifier.self)", bundle: nil),
                      forCellReuseIdentifier: "\(identifier.self)")
    }

    // Register Header Footer View Nib
    func registerHeaderFooter(with identifier: UITableViewHeaderFooterView.Type) {
        self.register(UINib(nibName: "\(identifier.self)", bundle: nil), forHeaderFooterViewReuseIdentifier: "\(identifier.self)")
    }

    // Dequeue Table View Cell
    func dequeueCell <T: UITableViewCell> (with identifier: T.Type, indexPath: IndexPath? = nil) -> T {
        if let index = indexPath {
            guard let cell = self.dequeueReusableCell(withIdentifier: "\(identifier.self)", for: index) as? T else { return T() }
            return cell
        } else {
            guard let cell = self.dequeueReusableCell(withIdentifier: "\(identifier.self)") as? T else { return T() }
            return cell
        }
    }

    // Dequeue Header Footer View
    func dequeueHeaderFooter <T: UITableViewHeaderFooterView> (with identifier: T.Type) -> T {
        guard let cell = self.dequeueReusableHeaderFooterView(withIdentifier: "\(identifier.self)") as? T else { return T()}
        return cell
    }
}
