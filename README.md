# ReusableProtocol

[![CI Status](https://img.shields.io/travis/iTofu/ReusableProtocol.svg?style=flat)](https://travis-ci.org/iTofu/ReusableProtocol)
[![Version](https://img.shields.io/cocoapods/v/ReusableProtocol.svg?style=flat)](https://cocoapods.org/pods/ReusableProtocol)
[![License](https://img.shields.io/cocoapods/l/ReusableProtocol.svg?style=flat)](https://cocoapods.org/pods/ReusableProtocol)
[![Platform](https://img.shields.io/cocoapods/p/ReusableProtocol.svg?style=flat)](https://cocoapods.org/pods/ReusableProtocol)
[![Laguage](https://img.shields.io/badge/language-Swift%20%26%20ObjC-orange.svg)](https://github.com/iTofu/ReusableProtocol)
[![CocoaPods](https://img.shields.io/cocoapods/dt/ReusableProtocol.svg)](https://cocoapods.org/pods/ReusableProtocol)
[![LeoDev](https://img.shields.io/badge/blog-LeoDev.me-brightgreen.svg)](https://leodev.me)
[![GitHub stars](https://img.shields.io/github/stars/iTofu/ReusableProtocol.svg?style=social&label=Star)](https://github.com/iTofu/ReusableProtocol)

🎏 ReusableProtocol is a helpful and pure Swift implemented library for registering and reusing cells or views in the table view and collection view. You may never care about what the reuse identifier is.

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

* iOS 8.0+

## Installation

ReusableProtocol is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'ReusableProtocol'
```

## Usage

* Register the cell or view:

  ```swift
  // UITableView
  tableView.register(TableViewCell.self)
  tableView.register(TableViewHeaderView.self)
  
  // UICollectionView
  collectionView.register(CollectionViewCell.self)
  collectionView.register(CollectionHeaderView.self,
                          forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader)
  ```

* Dequeue the cell or view:

  ```swift
  // UITableView
  let cell = tableView.dequeueReusableCell(with: TableViewCell.self, for: indexPath)
  let view = tableView.dequeueReusableHeaderFooterView(with: TableViewHeaderView.self)
  
  // UICollectionView
  let cell = collectionView.dequeueReusableCell(with: CollectionViewCell.self, for: indexPath)
  let view = collectionView.dequeueReusableSupplementaryView(ofKind: kind, 
                                                             viewClass: CollectionHeaderView.self,
                                                             for: indexPath)
  ```

* *Optional*: You may want to register the cell or view from nib:

  ```swift
  // UITableView
  tableView.register(TableViewCell.self, fromNib: true)
  tableView.register(TableViewHeaderView.self, fromNib: true)

  // UICollectionView
  collectionView.register(CollectionViewCell.self, fromNib: true)
  collectionView.register(CollectionHeaderView.self, 
                          forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                          fromNib: true)
  ```

## Author

Leo, leodaxia@gmail.com

## License

ReusableProtocol is available under the MIT license. See the LICENSE file for more info.
