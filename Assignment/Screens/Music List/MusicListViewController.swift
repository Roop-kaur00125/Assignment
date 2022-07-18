//
//  ViewController.swift
//  MusicCoordinator
//
//  Created by Rupinder Kaur on 18/07/22.
//  Copyright © 2022 Rupinder Kaur. All rights reserved.
//

import UIKit
import CoreData

protocol MusicListViewControllerDelegate: AnyObject {
    
    func musicListViewController(_ controller: MusicListViewController, didSelect music: Track)
    
}

class MusicListViewController: UICollectionViewController {
    
    weak var delegate: MusicListViewControllerDelegate?
    
    var viewModel: musicViewModel!
   
    
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = musicViewModel()
        attemptFetchData()
        setupCollectionView()
    }
    
    func attemptFetchData() {
        viewModel.fetchList()
        viewModel.didFinishFetch = {
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
    private func setupCollectionView() {
        title = "Musics"
        collectionView.register(MusicCollectionViewCell.nib, forCellWithReuseIdentifier: "Cell")

        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        let screenWidth = UIScreen.main.bounds.width
        
        layout.minimumInteritemSpacing = 1
        layout.minimumLineSpacing = 2
        layout.sectionInset.top = 1
        layout.sectionInset.bottom = 1
        
        let itemWidth: CGFloat = (screenWidth / 3.0).rounded(.down)
        let itemSize = CGSize(width: itemWidth - 1.0 , height: (itemWidth * 3) / 2)
        layout.itemSize = itemSize
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let count = viewModel.trackDetails?.count else {
            return 0
        }
        return count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! MusicCollectionViewCell
        cell.backgroundColor = .white
        guard let trackDetails = viewModel.trackDetails else {
            return cell
        }
        let music = trackDetails[indexPath.row]
        cell.titleLabel.text = music.title
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let music = viewModel.trackDetails![indexPath.item]
        delegate?.musicListViewController(self, didSelect: music)
    }
}

