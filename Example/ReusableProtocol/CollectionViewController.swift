//
//  CollectionViewController.swift
//  ReusableProtocol
//
//  Created by LΞO on 2019/7/4.
//  Copyright © 2019 Leo. All rights reserved.
//

import UIKit

// MARK: - CollectionViewController

class CollectionViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()

    view.addSubview(collectionView)
    collectionView.frame = view.bounds
  }

  private lazy var collectionView: UICollectionView = {
    let margin: CGFloat = 10.0
    let itemWidth = (view.bounds.width - margin) / 2

    let layout = UICollectionViewFlowLayout()
    layout.itemSize = CGSize(width: itemWidth, height: itemWidth)
    layout.minimumLineSpacing = margin
    layout.minimumInteritemSpacing = margin
    layout.headerReferenceSize = CGSize(width: view.bounds.width, height: 50.0)

    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    collectionView.backgroundColor = .white
    collectionView.dataSource = self
    collectionView.register(CollectionViewCell.self)
    collectionView.register(CollectionHeaderView.self,
                            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader)
    return collectionView
  }()
}

// MARK: - UICollectionViewDataSource

extension CollectionViewController: UICollectionViewDataSource {
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 3
  }

  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 10
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(with: CollectionViewCell.self, for: indexPath)
    cell.render(color: Helper.randomColor())
    return cell
  }

  func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
    let view = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                               viewClass: CollectionHeaderView.self,
                                                               for: indexPath)
    view.render(text: "😈    \(indexPath.section)")
    return view
  }
}

// MARK: - CollectionViewCell

private class CollectionViewCell: UICollectionViewCell {

  func render(color: UIColor) {
    contentView.backgroundColor = color
  }
}

// MARK: - CollectionHeaderView

private class CollectionHeaderView: UICollectionReusableView {

  override init(frame: CGRect) {
    super.init(frame: frame)

    setupUI()
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func layoutSubviews() {
    super.layoutSubviews()

    let margin: CGFloat = 15.0
    titleLabel.frame = CGRect(x: margin, y: 0.0, width: bounds.width - margin * 2, height: bounds.height)
  }

  private func setupUI() {
    backgroundColor = .lightGray

    addSubview(titleLabel)
  }

  func render(text: String) {
    titleLabel.text = text
  }

  private lazy var titleLabel: UILabel = {
    let label = UILabel()
    label.textColor = .white
    return label
  }()
}
