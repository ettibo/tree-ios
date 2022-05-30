//
//  TreeDetailsViewController.swift
//  Tree
//
//  Created by Thibaud Huchon on 11/05/2021.
//

import UIKit
import Resolver

protocol TreeDetailsViewControllerProtocol {
    func displayItems(viewHolder: TreeDetailsViewHolder)
}

class TreeDetailsViewController: UIViewController, TreeDetailsViewControllerProtocol {
    
    @Injected private var interactor: TreeDetailsInteractorProtocol
    
    var request: Tree?
    
    var tableView: UITableView = UITableView()
    var viewHolder: TreeDetailsViewHolder?
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureTableView()
        setup()
        if let request = request {
            interactor.processRequest(request: request)
        }
    }
    
    // MARK: Setup
    
    private func setup() {
        interactor.presenter.viewController = self
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
    
    // MARK: Display
    
    func displayItems(viewHolder: TreeDetailsViewHolder) {
        self.viewHolder = viewHolder
        tableView.reloadData()
    }
}


extension TreeDetailsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        viewHolder?.tableView(tableView, cellForRowAt: indexPath) ?? UITableViewCell()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewHolder?.items.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
