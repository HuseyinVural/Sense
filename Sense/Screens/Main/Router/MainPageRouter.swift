//
//  MainPageRouter.swift
//  Sense
//
//  Created by Hüseyin Vural on 4.04.2021.
//

import Foundation
import UIKit

final class MainPageRouter: MainPageRoutable {
    weak var viewController: MainPageViewController?
    
    /// I did not bind it because it consists of a single module.
    static func assembleModule() -> MainPageViewController {
        fatalError()
    }
    
    func showContentDetai(_ content: ContentInfo) {
        let detail = ContentDetailViewController(nibName: "ContentDetailViewController", bundle: nil)
        detail.content = content
        viewController?.navigationController?.pushViewController(detail, animated: true)
    }
}
