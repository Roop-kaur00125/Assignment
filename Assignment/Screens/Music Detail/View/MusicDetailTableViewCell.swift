//
//  MusicDetailTableViewCell.swift
//  MusicKit
//
//  Created by Rupinder Kaur on 18/07/22.
//  Copyright © 2022 Rupinder Kaur. All rights reserved.
//

import UIKit

public class MusicDetailTableViewCell: UITableViewCell {

    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var type: UILabel!

    public static var nib: UINib {
        return UINib(nibName: "MusicDetailTableViewCell", bundle: Bundle(for: MusicDetailTableViewCell.self))
    }
}
