//
//  ContentDetailViewController.swift
//  Sense
//
//  Created by Hüseyin Vural on 4.04.2021.
//

import UIKit

class ContentDetailViewController: UIViewController {
    @IBOutlet private weak var contentTitle: UILabel!
    @IBOutlet private weak var contentDesc: UILabel!
    @IBOutlet private weak var contentDate: UILabel!
    @IBOutlet private weak var contentImage: UIImageView!
    
    var content: ContentInfo?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = false
        contentTitle.text = content?.title
        contentDesc.text = content?.content
        contentDate.text = content?.date
        contentImage.kf.setImage(with: URL(string: content!.images.large)!)
    }
}
