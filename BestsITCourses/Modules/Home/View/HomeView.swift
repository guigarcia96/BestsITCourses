//
//  HomeView.swift
//  BestsITCourses
//
//  Created by Guilherme Moraes on 30/05/21.
//

import UIKit

protocol HomeViewDelegate: AnyObject {
    func didTap(a categorie: Categories)
}

class HomeView: UIView {

    private let cellId = "cellID"
    private let spacing:CGFloat = 16
    var viewModel = HomeViewModel()
    weak var delegate: HomeViewDelegate?

    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
        layout.minimumLineSpacing = spacing
        layout.minimumInteritemSpacing = spacing
        var collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.register(HomeCollectionViewCell.self, forCellWithReuseIdentifier:cellId )
        return collectionView
    }()
    
 

    init() {
        super.init(frame: .zero)
        configure()
        setupUI()
        setupConstraints()
        reloadData()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI() {
        backgroundColor = .white
    }

    private func configure() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }

    private func setupConstraints() {
        addSubviews([collectionView])
    
        collectionView
            .topToSuperview(10)
            .leadingToSuperview(4)
            .trailingToSuperview(4)
            .bottomToSuperview(0, toSafeArea: true)
            
    }

    func reloadData() {
        collectionView.reloadData()
    }
}

extension HomeView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.categories.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        guard let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as? HomeCollectionViewCell else {return UICollectionViewCell()}
        myCell.setup(viewModel.categories[indexPath.row])
        return myCell

    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let categorie = viewModel.categories[indexPath.row]
        delegate?.didTap(a: categorie)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let numberOfItemsPerRow:CGFloat = 2
        let spacingBetweenCells:CGFloat = 16
        
        let totalSpacing = (2 * self.spacing) + ((numberOfItemsPerRow - 1) * spacingBetweenCells) //Amount of total spacing in a row
        
        let width = (collectionView.bounds.width - totalSpacing)/numberOfItemsPerRow
        return CGSize(width: width, height: width)
        
        
    }

}
