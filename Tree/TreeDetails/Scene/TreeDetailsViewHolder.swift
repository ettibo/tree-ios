//
//  TreeDetailsViewHolder.swift
//  Tree
//
//  Created by Thibaud Huchon on 11/05/2021.
//

import UIKit

struct TreeDetailsViewHolder {
    let items: [String]
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: TreeListTableViewCell.cellIdentifier, for: indexPath) as? TreeListTableViewCell {
            cell.treeLabel.text = items[indexPath.row]
            return cell
        }
        return UITableViewCell()
    }
}

