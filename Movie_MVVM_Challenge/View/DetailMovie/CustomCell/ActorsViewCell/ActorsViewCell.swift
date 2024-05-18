//
//  ActorsViewCell.swift
//  Movie_MVVM_Challenge
//
//  Created by Nguyễn Đình Kiên on 18/05/2024.
//

import UIKit

class ActorsViewCell: UITableViewCell, NibLoadable {

    @IBOutlet weak var actorsCollectionView: UICollectionView!
    private var listActors: [ActorCellVM] = []
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
    
    func setupData(with data: [ActorCellVM]) {
        listActors = data
        actorsCollectionView.reloadData()
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
        return listActors.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cellActor = collectionView.dequeueReusableCell(withReuseIdentifier: ActorCell.reusableIdentifier, for: indexPath) as? ActorCell else {
            return UICollectionViewCell()
        }
        cellActor.setupData(with: listActors[indexPath.row])
        return cellActor
    }
}

extension ActorsViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.size.width - 8 * 4) / 3,
                      height: (collectionView.frame.size.height - 8 * 3) /  2)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
    }
    
}
