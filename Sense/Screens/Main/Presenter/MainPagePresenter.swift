//
//  MainPagePresenter.swift
//  Sense
//
//  Created by Hüseyin Vural on 4.04.2021.
//

import Foundation

class MainPagePresenter: MainPagePresentation {
    weak var view: MainPagePresentationOutput?
    var interactor: MainPageInteractorInputProtocol?
    var router: MainPageRoutable?
    var parser: MainPageSectionParser = MainPageSectionParser()
}

extension MainPagePresenter: MainPagePresentationInput {
    func viewDidLoad() {
        interactor?.callMainDetail()
    }
    
    func selectItem(_ data: Any?) {
        guard let content = data as? ContentInfo else {
            return
        }
        
        router?.showContentDetai(content)
    }
}

extension MainPagePresenter: MainPageInteractorOutputProtocol {
    func gotMainDetail(_ response: MainResponsable) {
        view?.loaded(data: parser.parse(response))
    }
}


