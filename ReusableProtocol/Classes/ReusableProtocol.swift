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

public protocol ReusableView {

  /// The default reuse identifier
  static var defaultReuseIdentifier: String { get }
}

public extension ReusableView where Self: UIView {

  /// The default reuse identifier
  static var defaultReuseIdentifier: String {
    return NSStringFromClass(self).components(separatedBy: ".").last!
  }
}

extension UITableViewCell: ReusableView {}
extension UITableViewHeaderFooterView: ReusableView {}
extension UICollectionReusableView: ReusableView {}


// MARK: - UITableView

public extension UITableView {

  /// Registers a class for use in creating new table cells.
  ///
  /// - Parameters:
  ///   - cellClass: The class of a cell that you want to use in the table (must be a UITableViewCell subclass).
  ///   - fromNib: Whether it comes from nib or not. Default is `false`.
  func register<T: UITableViewCell>(_ cellClass: T.Type, fromNib: Bool = false) {
    if fromNib {
      register(UINib(nibName: cellClass.defaultReuseIdentifier, bundle: nil),
               forCellReuseIdentifier: cellClass.defaultReuseIdentifier)
    } else {
      register(cellClass,
               forCellReuseIdentifier: cellClass.defaultReuseIdentifier)
    }
  }

  /// Registers a class for use in creating new table header or footer views.
  ///
  /// - Parameters:
  ///   - viewClass: The class of the header or footer view that you want to register. You must specify either UITableViewHeaderFooterView or a subclass of it.
  ///   - fromNib: Whether it comes from nib or not. Default is `false`.
  func register<T: UITableViewHeaderFooterView>(_ viewClass: T.Type, fromNib: Bool = false) {
    if fromNib {
      register(UINib(nibName: viewClass.defaultReuseIdentifier, bundle: nil),
               forHeaderFooterViewReuseIdentifier: viewClass.defaultReuseIdentifier)
    } else {
      register(viewClass,
               forHeaderFooterViewReuseIdentifier: viewClass.defaultReuseIdentifier)
    }
  }

  /// Returns a reusable table-view cell object located by its class.
  ///
  /// - Parameter cellClass: The class of a cell that you want to reuse in the table (must be a UITableViewCell subclass).
  /// - Returns: A UITableViewCell object with its class or nil if no such object exists in the reusable-cell queue.
  func dequeueReusableCell<T: UITableViewCell>(with cellClass: T.Type) -> T? {
    guard let cell = dequeueReusableCell(withIdentifier: cellClass.defaultReuseIdentifier) as? T? else {
      fatalError("Couldn't dequeue cell with identifier: \(cellClass.defaultReuseIdentifier)")
    }
    return cell
  }

  /// Returns a reusable table-view cell object for its class and adds it to the table.
  ///
  /// - Parameters:
  ///   - cellClass: The class of a cell that you want to reuse in the table (must be a UITableViewCell subclass).
  ///   - indexPath: The index path specifying the location of the cell. Always specify the index path provided to you by your data source object. This method uses the index path to perform additional configuration based on the cell’s position in the table view.
  /// - Returns: A UITableViewCell object with its class. This method always returns a valid cell.
  func dequeueReusableCell<T: UITableViewCell>(with cellClass: T.Type, for indexPath: IndexPath) -> T {
    guard let cell = dequeueReusableCell(withIdentifier: cellClass.defaultReuseIdentifier, for: indexPath) as? T else {
      fatalError("Couldn't dequeue cell with identifier: \(cellClass.defaultReuseIdentifier) for indexPath: \(indexPath)")
    }
    return cell
  }

  /// Returns a reusable header or footer view located by its class.
  ///
  /// - Parameter viewClass: The class of the header or footer view that you want to reuse. You must specify either UITableViewHeaderFooterView or a subclass of it.
  /// - Returns: A UITableViewHeaderFooterView object with its class. This method always returns a valid header or footer view.
  func dequeueReusableHeaderFooterView<T: UITableViewHeaderFooterView>(with viewClass: T.Type) -> T {
    guard let view = dequeueReusableHeaderFooterView(withIdentifier: viewClass.defaultReuseIdentifier) as? T else {
      fatalError("Couldn't dequeue view with identifier: \(viewClass.defaultReuseIdentifier)")
    }
    return view
  }
}


// MARK: - UICollectionView

public extension UICollectionView {
  
  /// Register a class for use in creating new collection view cells.
  ///
  /// - Parameters:
  ///   - cellClass: The class of a cell that you want to use in the collection view.
  ///   - fromNib: Whether it comes from nib or not. Default is `false`.
  func register<T: UICollectionViewCell>(_ cellClass: T.Type, fromNib: Bool = false) {
    if fromNib {
      register(UINib(nibName: cellClass.defaultReuseIdentifier, bundle: nil),
               forCellWithReuseIdentifier: cellClass.defaultReuseIdentifier)
    } else {
      register(cellClass,
               forCellWithReuseIdentifier: cellClass.defaultReuseIdentifier)
    }
  }

  /// Registers a class for use in creating supplementary views for the collection view.
  ///
  /// - Parameters:
  ///   - viewClass: The class to use for the supplementary view.
  ///   - elementKind: The kind of supplementary view to create. This value is defined by the layout object. This parameter must not be nil.
  ///   - fromNib: Whether it comes from nib or not. Default is `false`.
  func register<T: UICollectionReusableView>(_ viewClass: T.Type, forSupplementaryViewOfKind elementKind: String, fromNib: Bool = false) {
    if fromNib {
      register(UINib(nibName: viewClass.defaultReuseIdentifier, bundle: nil),
               forSupplementaryViewOfKind: elementKind,
               withReuseIdentifier: viewClass.defaultReuseIdentifier)
    } else {
      register(viewClass,
               forSupplementaryViewOfKind: elementKind,
               withReuseIdentifier: viewClass.defaultReuseIdentifier)
    }
  }

  /// Returns a reusable cell object located by its class.
  ///
  /// - Parameters:
  ///   - cellClass: The class to use for the cell.
  ///   - indexPath: The index path specifying the location of the cell. The data source receives this information when it is asked for the cell and should just pass it along. This method uses the index path to perform additional configuration based on the cell’s position in the collection view.
  /// - Returns: A valid UICollectionReusableView object.
  func dequeueReusableCell<T: UICollectionViewCell>(with cellClass: T.Type, for indexPath: IndexPath) -> T {
    guard let cell = dequeueReusableCell(withReuseIdentifier: cellClass.defaultReuseIdentifier, for: indexPath) as? T else {
      fatalError("Couldn't dequeue cell with identifier: \(cellClass.defaultReuseIdentifier) for indexPath: \(indexPath)")
    }
    return cell
  }

  /// Returns a reusable supplementary view located by its class and kind.
  ///
  /// - Parameters:
  ///   - elementKind: The kind of supplementary view to retrieve. This value is defined by the layout object. This parameter must not be nil.
  ///   - viewClass: The class to use for the supplementary view.
  ///   - indexPath: The index path specifying the location of the supplementary view in the collection view. The data source receives this information when it is asked for the view and should just pass it along. This method uses the information to perform additional configuration based on the view’s position in the collection view.
  /// - Returns: A valid UICollectionReusableView object.
  func dequeueReusableSupplementaryView<T: UICollectionReusableView>(ofKind elementKind: String, viewClass: T.Type, for indexPath: IndexPath) -> T {
    guard let view = dequeueReusableSupplementaryView(ofKind: elementKind, withReuseIdentifier: viewClass.defaultReuseIdentifier, for: indexPath) as? T else {
      fatalError("Couldn't dequeue view with identifier: \(viewClass.defaultReuseIdentifier) for indexPath: \(indexPath)")
    }
    return view
  }
}

