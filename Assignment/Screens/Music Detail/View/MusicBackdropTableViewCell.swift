//
//  MusicBackdropTableViewCell.swift
//  MusicKit
//
//  Created by Rupinder Kaur on 18/07/22.
//  Copyright © 2018 Rupinder Kaur. All rights reserved.
//

import UIKit

public class MusicBackdropTableViewCell: UITableViewCell {
    
    @IBOutlet weak var backdropImageView: UIImageView!
    
    public static var nib: UINib {
        return UINib(nibName: "MusicBackdropTableViewCell", bundle: Bundle(for: MusicBackdropTableViewCell.self))
    }
    
    public var imageURL: URL? {
        didSet {
//            backdropImageView.kf.setImage(with: imageURL)
        }
    }
    
    public override func awakeFromNib() {
        super.awakeFromNib()
//        backdropImageView.kf.indicatorType = .activity

    }
    
}
