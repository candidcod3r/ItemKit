//
//  MenuViewController.swift
//  ItemKitExample
//
//  Created by Candid Cod3r on 4/15/19.
//  Copyright (c) 2019 Candid Cod3r.
//

import Foundation
import UIKit

class MenuViewController: UIViewController {

    struct Constant {
        static let tableViewCellReuseID = "tableViewCellID"
    }

    let viewControllers: [UIViewController.Type] = [
        TestFixedViewController.self,
        TestFillViewController.self
    ]

    let tableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Test view controllers"
        view.addSubview(tableView)
        tableView.frame = view.bounds

        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: Constant.tableViewCellReuseID)
        tableView.reloadData()
    }

}

extension MenuViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewControllers.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constant.tableViewCellReuseID, for: indexPath)
        let viewControllerClass = viewControllers[indexPath.row]
        cell.textLabel?.text = String(describing: viewControllerClass)
        cell.accessoryType = .detailButton
        return cell
    }
}

extension MenuViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewControllerClass = viewControllers[indexPath.row]
        let viewController = viewControllerClass.init()
        navigationController?.pushViewController(viewController, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }

}
