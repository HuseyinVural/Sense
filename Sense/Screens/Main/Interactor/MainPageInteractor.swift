//
//  MainPageInteractor.swift
//  Sense
//
//  Created by Hüseyin Vural on 4.04.2021.
//

import Foundation

public final class MainPageInteractor: MainPageInteractorInputProtocol {
    weak var output: MainPageInteractorOutputProtocol?
    private var repository: DataRepositoryProtocol
    private var logger: Loggable?

    init(repository: DataRepositoryProtocol) {
        self.repository = repository
    }
    
    public func callMainDetail() {
        repository.main { [weak self] response in
            self?.output?.gotMainDetail(response)
        } fail: { [weak  self] error in
            self?.logger?.log(params: [.nonFatal: error])
        }
    }
}
