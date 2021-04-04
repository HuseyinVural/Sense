//
//  ConfigurableCell.swift
//  Sense
//
//  Created by Hüseyin Vural on 4.04.2021.
//

import Foundation
import UIKit

protocol ConfigurableCell: AnyObject {
    func configure(_ data: Any?, size: CGSize)
}
