//
//  ID+Ex.swift
//  TravelTalk
//
//  Created by J Oh on 6/2/24.
//

import UIKit

extension UITableViewCell {
    static var id: String {
        String(describing: self)
    }
}

extension UIViewController {
    static var id: String {
        String(describing: self)
    }
}
