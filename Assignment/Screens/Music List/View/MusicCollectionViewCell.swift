//
//  MusicCollectionViewCell.swift
//  MusicKit
//
//  Created by Rupinder Kaur on 18/07/22.
//  Copyright © 2022 Rupinder Kaur. All rights reserved.
//

import UIKit

public class MusicCollectionViewCell: UICollectionViewCell {
   

    @IBOutlet weak var titleLabel: UILabel!
    
    public static var nib: UINib {
        return UINib(nibName: "MusicCollectionViewCell", bundle: Bundle(for: MusicCollectionViewCell.self))
    }

 
    override public func awakeFromNib() {
        super.awakeFromNib()
        titleLabel.textColor = .black
    }
    
    public override func prepareForReuse() {
        super.prepareForReuse()
        titleLabel.isHidden = false
        
    }
}
