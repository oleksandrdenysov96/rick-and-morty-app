//
//  Extentions.swift
//  RickAndMorty
//
//  Created by Oleksandr Denysov on 09.11.2023.
//

import Foundation
import UIKit

extension UIView {
    
    
    func addSubviews(_ views: UIView...) {
        views.forEach {
            addSubview($0)
        }
    }
}
