//
//  MainPageContracts.swift
//  Sense
//
//  Created by Hüseyin Vural on 4.04.2021.
//

import Foundation

protocol MainPageInteractorInputProtocol {
    var output: MainPageInteractorOutputProtocol? { get set }
    func callMainDetail()
}

protocol MainPageInteractorOutputProtocol: AnyObject {
    func gotMainDetail(_ response: MainResponsable)
}

protocol MainPagePresentationOutput: AnyObject {
    func loaded(data: [SectionViewModel])
}

protocol MainPagePresentationInput {
    func viewDidLoad()
    func selectItem(_ data: Any?)
}

protocol MainPagePresentation {
    var view: MainPagePresentationOutput? { get set }
    var interactor: MainPageInteractorInputProtocol? { get set }
    var router: MainPageRoutable? { get set }
}

protocol MainPageRoutable {
    var viewController: MainPageViewController? { get set }

    static func assembleModule() -> MainPageViewController
    func showContentDetai(_ content: ContentInfo)
}
