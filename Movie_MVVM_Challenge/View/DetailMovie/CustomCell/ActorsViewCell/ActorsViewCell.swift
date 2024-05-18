//
//  ActorsViewCell.swift
//  Movie_MVVM_Challenge
//
//  Created by Nguyễn Đình Kiên on 18/05/2024.
//

import UIKit

class ActorsViewCell: UITableViewCell, NibLoadable {

    @IBOutlet weak var actorsCollectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupDelegate()
    }

    
    private func setupDelegate() {
        actorsCollectionView.dataSource = self
        actorsCollectionView.delegate = self
        actorsCollectionView.register(UINib(nibName: ActorCell.reusableIdentifier,
                                            bundle: nil), forCellWithReuseIdentifier: ActorCell.reusableIdentifier)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension ActorsViewCell: UICollectionViewDelegate {
    
}

extension ActorsViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        UICollectionViewCell()
    }
    
    
}

extension ActorsViewCell: UICollectionViewDelegateFlowLayout {
    
}
