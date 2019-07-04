//
//  ReusableProtocol.swift
//  ReusableProtocol
//
//  Created by LΞO on 2019/7/4.
//
//  Copyright (c) 2019 Leo <leodaxia@gmail.com>
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.

import UIKit


// MARK: - ReusableView

protocol ReusableView {
  static var defaultReuseIdentifier: String { get }
}

extension ReusableView where Self: UIView {
  static var defaultReuseIdentifier: String {
    return NSStringFromClass(self).components(separatedBy: ".").last!
  }
}

extension UITableViewCell: ReusableView {}
extension UITableViewHeaderFooterView: ReusableView {}
extension UICollectionReusableView: ReusableView {}


// MARK: - UITableView

public extension UITableView {
  func register<T: UITableViewCell>(_ cellClass: T.Type, fromNib: Bool = false) {
    if fromNib {
      register(UINib(nibName: cellClass.defaultReuseIdentifier, bundle: nil),
               forCellReuseIdentifier: cellClass.defaultReuseIdentifier)
    } else {
      register(cellClass,
               forCellReuseIdentifier: cellClass.defaultReuseIdentifier)
    }
  }

  func register<T: UITableViewHeaderFooterView>(_ viewClass: T.Type, fromNib: Bool = false) {
    if fromNib {
      register(UINib(nibName: viewClass.defaultReuseIdentifier, bundle: nil),
               forHeaderFooterViewReuseIdentifier: viewClass.defaultReuseIdentifier)
    } else {
      register(viewClass,
               forHeaderFooterViewReuseIdentifier: viewClass.defaultReuseIdentifier)
    }
  }

  func dequeueReusableCell<T: UITableViewCell>(with cellClass: T.Type) -> T {
    guard let cell = dequeueReusableCell(withIdentifier: cellClass.defaultReuseIdentifier) as? T else {
      fatalError("Couldn't dequeue cell with identifier: \(cellClass.defaultReuseIdentifier)")
    }
    return cell
  }

  func dequeueReusableCell<T: UITableViewCell>(with cellClass: T.Type, for indexPath: IndexPath) -> T {
    guard let cell = dequeueReusableCell(withIdentifier: cellClass.defaultReuseIdentifier, for: indexPath) as? T else {
      fatalError("Couldn't dequeue cell with identifier: \(cellClass.defaultReuseIdentifier) for indexPath: \(indexPath)")
    }
    return cell
  }

  func dequeueReusableHeaderFooterView<T: UITableViewHeaderFooterView>(with viewClass: T.Type) -> T {
    guard let view = dequeueReusableHeaderFooterView(withIdentifier: viewClass.defaultReuseIdentifier) as? T else {
      fatalError("Couldn't dequeue view with identifier: \(viewClass.defaultReuseIdentifier)")
    }
    return view
  }
}


// MARK: - UICollectionView

public extension UICollectionView {
  func register<T: UICollectionViewCell>(_ cellClass: T.Type, fromNib: Bool = false) {
    if fromNib {
      register(UINib(nibName: cellClass.defaultReuseIdentifier, bundle: nil),
               forCellWithReuseIdentifier: cellClass.defaultReuseIdentifier)
    } else {
      register(cellClass,
               forCellWithReuseIdentifier: cellClass.defaultReuseIdentifier)
    }
  }

  func register<T: UICollectionReusableView>(_ viewClass: T.Type, forSupplementaryViewOfKind kind: String, fromNib: Bool = false) {
    if fromNib {
      register(UINib(nibName: viewClass.defaultReuseIdentifier, bundle: nil),
               forSupplementaryViewOfKind: kind,
               withReuseIdentifier: viewClass.defaultReuseIdentifier)
    } else {
      register(viewClass,
               forSupplementaryViewOfKind: kind,
               withReuseIdentifier: viewClass.defaultReuseIdentifier)
    }
  }

  func dequeueReusableCell<T: UICollectionViewCell>(with cellClass: T.Type, for indexPath: IndexPath) -> T {
    guard let cell = dequeueReusableCell(withReuseIdentifier: cellClass.defaultReuseIdentifier, for: indexPath) as? T else {
      fatalError("Couldn't dequeue cell with identifier: \(cellClass.defaultReuseIdentifier) for indexPath: \(indexPath)")
    }
    return cell
  }

  func dequeueReusableSupplementaryView<T: UICollectionReusableView>(ofKind elementKind: String, viewClass: T.Type, for indexPath: IndexPath) -> T {
    guard let view = dequeueReusableSupplementaryView(ofKind: elementKind, withReuseIdentifier: viewClass.defaultReuseIdentifier, for: indexPath) as? T else {
      fatalError("Couldn't dequeue view with identifier: \(viewClass.defaultReuseIdentifier) for indexPath: \(indexPath)")
    }
    return view
  }
}

