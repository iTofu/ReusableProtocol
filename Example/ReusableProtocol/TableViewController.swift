//
//  TableViewController.swift
//  ReusableProtocol_Example
//
//  Created by LΞO on 2019/7/4.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit
import ReusableProtocol

// MARK: - TableViewController

class TableViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()

    view.addSubview(tableView)
    tableView.frame = view.bounds
  }

  private lazy var tableView: UITableView = {
    let tableView = UITableView()
    tableView.backgroundColor = .white
    tableView.dataSource = self
    tableView.register(TableViewCell.self)
    return tableView
  }()
}

extension TableViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 20
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(with: TableViewCell.self)
    cell.render(text: "😃    Hi    你好    \(indexPath.row)")
    return cell
  }
}

// MARK: - TableViewCell

private class TableViewCell: UITableViewCell {

  func render(text: String) {
    textLabel?.text = text
  }
}
