//
//  MainPageViewController.swift
//  Sense
//
//  Created by Hüseyin Vural on 3.04.2021.
//

import UIKit

class MainPageViewController: UIViewController {
    
    @IBOutlet private weak var collectionView: UICollectionView!
    private var presenter: MainPagePresenter?
    private var collectionManager: CollectionManager? = CollectionManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindCollection()
        loadModule()
        presenter?.viewDidLoad()
        bindSelectAction()
    }
    
    private func bindCollection() {
        collectionView.register(UINib(nibName: StoryItemViewCell.reuseIdentifier, bundle: nil),
                                forCellWithReuseIdentifier: StoryItemViewCell.reuseIdentifier)
        collectionView.delegate = collectionManager
        collectionView.dataSource = collectionManager
    }
    
    private func bindSelectAction() {
        collectionManager?.didSelect = { [weak self] data in
            self?.presenter?.selectItem(data)
        }
    }
    
    private func loadModule() {
        presenter = MainPagePresenter()
        presenter?.view = self
        let interactor = MainPageInteractor(repository: DataRepository(NetworkProvider()))
        collectionManager?.didSelect = nil
        presenter?.interactor = interactor
        interactor.output = presenter
        let router = MainPageRouter()
        router.viewController = self
        presenter?.router = router
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        view.setGradientBackground()
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        self.collectionView.reloadData()
    }
}

extension MainPageViewController: MainPagePresentationOutput {
    func loaded(data: [SectionViewModel]) {
        DispatchQueue.main.async {
            self.collectionManager?.set(data: data)
            self.collectionView.reloadData()
        }
    }
}
