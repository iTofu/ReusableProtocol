//
//  TableViewController.swift
//  ReusableProtocol
//
//  Created by LΞO on 2019/7/4.
//  Copyright © 2019 Leo. All rights reserved.
//

import UIKit
import ReusableProtocol

// MARK: - TableViewController

class TableViewController: UIViewController {

  private lazy var hellos = ["😃", "Hello", "Bonjour", "こんにちは", "你好"]

  override func viewDidLoad() {
    super.viewDidLoad()

    view.addSubview(tableView)
    tableView.frame = view.bounds
  }

  private lazy var tableView: UITableView = {
    let tableView = UITableView()
    tableView.backgroundColor = .white
    tableView.sectionHeaderHeight = 50.0
    tableView.dataSource = self
    tableView.delegate = self
    tableView.register(TableViewCell.self)
    tableView.register(TableViewHeaderView.self)
    return tableView
  }()
}

// MARK: - UITableViewDataSource, UITableViewDelegate

extension TableViewController: UITableViewDataSource, UITableViewDelegate {
  func numberOfSections(in tableView: UITableView) -> Int {
    return 6
  }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 5
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(with: TableViewCell.self, for: indexPath)
    cell.render(text: "(\(indexPath.section), \(indexPath.row))    \(hellos[indexPath.row % 5])")
    return cell
  }

  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    let view = tableView.dequeueReusableHeaderFooterView(with: TableViewHeaderView.self)
    view.render(color: Helper.randomColor())
    return view
  }
}

// MARK: - TableViewCell

private class TableViewCell: UITableViewCell {

  func render(text: String) {
    textLabel?.text = text
  }
}

// MARK: - TableViewHeaderView

private class TableViewHeaderView: UITableViewHeaderFooterView {

  override init(reuseIdentifier: String?) {
    super.init(reuseIdentifier: reuseIdentifier)
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  private func setupUI() {

  }

  func render(color: UIColor) {
    contentView.backgroundColor = color
  }
}
