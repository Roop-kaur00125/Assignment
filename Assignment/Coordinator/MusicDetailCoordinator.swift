//
//  MusicDetailCoordinator.swift
//  MusicCoordinator
//
//  Created by Rupinder Kaur on 18/07/22.
//  Copyright © 2022 Rupinder Kaur. All rights reserved.
//

import UIKit

class MusicDetailCoordinator: Coordinator {
    
    private let presenter: UINavigationController
    private var musicDetailViewController: MusicDetailViewController?
    private let music: Track
    
    
    init(presenter: UINavigationController, music: Track) {
        self.presenter = presenter
        self.music = music
    }
    
    
    func start() {
        let musicDetailViewController = MusicDetailViewController()
        musicDetailViewController.music = music
        self.musicDetailViewController = musicDetailViewController
        
        presenter.pushViewController(musicDetailViewController, animated: true)
        
    }
}
