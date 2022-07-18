//
//  MusicDetailViewController.swift
//  MusicCoordinator
//
//  Created by Rupinder Kaur on 18/07/22.
//  Copyright © 2022 Rupinder Kaur. All rights reserved.
//

import UIKit

class MusicDetailViewController: UITableViewController {
    
    var music: Track? {
        didSet {
            title = music?.title
            tableView.reloadData()
        }
    }
    
    init() {
        super.init(style: .plain)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    private func setupTableView() {
        navigationController?.navigationBar.prefersLargeTitles = false
        
        tableView.tableFooterView = UIView()
        tableView.register(MusicDetailTableViewCell.nib, forCellReuseIdentifier: "DetailCell")
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 44.0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch (indexPath.row) {
            
        case (0):
            let cell = tableView.dequeueReusableCell(withIdentifier: "DetailCell", for: indexPath) as! MusicDetailTableViewCell
            cell.subTitleLabel.text = music?.subtitle
            cell.type.text = music?.type
            return cell
            
        default:
            fatalError()
        }
    }
}
