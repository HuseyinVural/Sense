//
//  SelectableCell.swift
//  Sense
//
//  Created by Hüseyin Vural on 4.04.2021.
//

import Foundation

protocol SelectableCell: AnyObject {
    var didSelect: ((_ info: Any?) -> Void)? { get set }
}
