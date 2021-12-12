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
    weak var viewModel: HomeViewModel?
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

    private lazy var errorMessage: UILabel = {
        let message = UILabel()
        message.isHidden = true
        message.font = message.font.withSize(18)
        message.numberOfLines = 0
        message.text = "Problema de conexão com o servidor"
        return message
    }()

    private lazy var errorButton: UIButton = {
        let button = UIButton()
        button.isHidden = true
        button.setTitle("Tentar Novamente", for: .normal)
        button.backgroundColor = .black
        return button
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
        addSubviews([collectionView, errorButton, errorMessage])

        collectionView
            .topToSuperview(10)
            .leadingToSuperview(4)
            .trailingToSuperview(4)
            .bottomToSuperview(0, toSafeArea: true)

        errorMessage
            .centerVerticalToSuperView()
            .leadingToSuperview(8)
            .trailingToSuperview(8)

        errorButton
            .topToBottom(of: errorMessage, margin: 16)
            .centerHorizontalToSuperView()
            .widthTo(160)
            .heightTo(40)

    }

    func reloadData() {
        collectionView.reloadData()
    }

    func setupError() {
        errorButton.isHidden = false
        errorMessage.isHidden = false
    }
}

extension HomeView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.categories.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let category = viewModel?.categories[indexPath.row] else { return UICollectionViewCell() }
        guard let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as? HomeCollectionViewCell else {return UICollectionViewCell()}
        myCell.setup(category)
        return myCell

    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let category = viewModel?.categories[indexPath.row] else { return }
        delegate?.didTap(a: category)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let numberOfItemsPerRow:CGFloat = 2
        let spacingBetweenCells:CGFloat = 16

        let totalSpacing = (2 * self.spacing) + ((numberOfItemsPerRow - 1) * spacingBetweenCells)

        let width = (collectionView.bounds.width - totalSpacing)/numberOfItemsPerRow
        return CGSize(width: width, height: width)

    }

}
