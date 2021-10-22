//
//  ViewController.swift
//  Tree
//
//  Created by Thibaud Huchon on 11/05/2021.
//

import UIKit

class TreeListViewController: UIViewController {
    
    private let interactor = TreeListInteractor()
    let router = TreeListRouter()
    
    var tableView: UITableView = UITableView()
    var viewHolder: TreeListViewHolder?
    var spinner = UIActivityIndicatorView(style: .large)

    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        configureTableView()
        configureActivityIndicatorView()
        interactor.fetchData()
    }
    
    // MARK: Setup
    
    private func setup() {
        interactor.presenter.viewController = self
        router.viewController = self
    }
    
    // MARK: Configure
    
    private func configureTableView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        tableView.register(TreeListTableViewCell.self, forCellReuseIdentifier: TreeListTableViewCell.cellIdentifier)
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    private func configureActivityIndicatorView() {
        spinner.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(spinner)

        spinner.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        spinner.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    // MARK: Display
    
    func displayTreeList(viewHolder: TreeListViewHolder) {
        self.viewHolder = viewHolder
        tableView.reloadData()
    }
    
    func displayLoader() {
        spinner.startAnimating()
    }
    
    func hideLoader() {
        spinner.stopAnimating()
    }
}

extension TreeListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        viewHolder?.tableView(tableView, cellForRowAt: indexPath) ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewHolder?.treeList.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        interactor.onTreeSelected(tree: viewHolder?.treeList[indexPath.row])
    }
}
