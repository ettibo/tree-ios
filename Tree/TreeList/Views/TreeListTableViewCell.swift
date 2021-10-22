//
//  TreeListTableViewCell.swift
//  Tree
//
//  Created by Thibaud Huchon on 11/05/2021.
//

import UIKit

class TreeListTableViewCell: UITableViewCell {
    
    static let cellIdentifier = "TreeListTableViewCell"
    
    var treeLabel: UILabel!
    
    // MARK: Lifecycle
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    // MARK: Configure
    
    private func configure() {
        let margin = CGFloat(8)
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(label)
        label.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: margin).isActive = true
        label.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -margin).isActive = true
        label.topAnchor.constraint(equalTo: contentView.topAnchor, constant: margin).isActive = true
        label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -margin).isActive = true
        treeLabel = label
    }
}
