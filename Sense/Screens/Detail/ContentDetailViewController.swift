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
        contentDate.text = Date.from(unixTime: content?.date)
        
        if let image = content?.images.large, let url = URL(string: image) {
            contentImage.kf.setImage(with: url)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false
    }
}
