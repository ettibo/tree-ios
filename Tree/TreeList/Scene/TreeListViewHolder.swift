//
//  TreeListViewHolder.swift
//  Tree
//
//  Created by Thibaud Huchon on 11/05/2021.
//

import UIKit

struct TreeListViewHolder {
    let treeList: [Tree]
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: TreeListTableViewCell.cellIdentifier, for: indexPath) as? TreeListTableViewCell {
            let tree = treeList[indexPath.row]
            cell.treeLabel.text = tree.name
            return cell
        }
        return UITableViewCell()
    }
}
