
//
//  MusicListCoordinator.swift
//  MusicCoordinator
//
//  Created by Rupinder Kaur on 18/07/22.
//  Copyright © 2022 Rupinder Kaur. All rights reserved.
//

import UIKit

class MusicListCoordinator: Coordinator {
    
    private var presenter: UINavigationController
    private var musicDetailCoordinator: MusicDetailCoordinator?
    private var musicListViewController: MusicListViewController?
    
    
    init(presenter: UINavigationController) {
        self.presenter = presenter
    }
    
    func start() {
        let musicListViewController = MusicListViewController()
        musicListViewController.delegate = self
        self.musicListViewController = musicListViewController
        presenter.pushViewController(musicListViewController, animated: true)
    }
    
}

extension MusicListCoordinator: MusicListViewControllerDelegate {
    
    func musicListViewController(_ controller: MusicListViewController, didSelect music: Track) {
        let musicDetailCoordinator = MusicDetailCoordinator(presenter: presenter, music: music)
        
        self.musicDetailCoordinator = musicDetailCoordinator
        musicDetailCoordinator.start()
    }
    
}

