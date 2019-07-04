//
//  CollectionViewController.swift
//  ReusableProtocol_Example
//
//  Created by LΞO on 2019/7/4.
//  Copyright © 2019 CocoaPods. All rights reserved.
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

    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    collectionView.backgroundColor = .white
    collectionView.dataSource = self
    collectionView.register(CollectionViewCell.self)
    return collectionView
  }()

  private func randomColorValue() -> CGFloat {
    return CGFloat(arc4random() % (256 / 2) + 256 / 2) / 255
  }
}

// MARK: - UICollectionViewDataSource

extension CollectionViewController: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 20
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(with: CollectionViewCell.self, for: indexPath)
    cell.render(color: UIColor(red: randomColorValue(), green: randomColorValue(), blue: randomColorValue(), alpha: 1.0))
    return cell
  }
}

// MARK: - CollectionViewCell

class CollectionViewCell: UICollectionViewCell {

  override init(frame: CGRect) {
    super.init(frame: frame)

    setupUI()
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func layoutSubviews() {
    super.layoutSubviews()

    colorfulView.frame = bounds
  }

  func render(color: UIColor) {
    colorfulView.backgroundColor = color
  }

  private func setupUI() {
    contentView.addSubview(colorfulView)
  }

  private lazy var colorfulView: UIView = {
    let view = UIView()
    return view
  }()
}
