//
//  FeaturedViewController+UICollectionViewDataSource.swift
//  Barbie tv
//
//  Created by Gabrielle on 12/07/22.
//

import UIKit

extension FeaturedViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == self.popularCollectionView {
            return popularMovies.count
        } else if collectionView == self.nowPlayingCollectionView {
            return nowPlayingMovies.count
        }
        else if collectionView == self.upcomingCollectionView {
            return nowPlayingMovies.count
        }
        else {
            return 0
        }
    }
    
    fileprivate func makePopularCell(_ indexPath: IndexPath) -> UICollectionViewCell {
        let cell = popularCollectionView.dequeueReusableCell(withReuseIdentifier: PopularCollectionViewCell.cellIdentifier, for: indexPath) as? PopularCollectionViewCell
        
        cell?.titleLabel.text = popularMovies[indexPath.item].title
        cell?.imageView.image = UIImage(named: popularMovies[indexPath.item].backdrop)
        
        return cell ?? PopularCollectionViewCell()
    }
    
    fileprivate func makeNowPlayingCell(_ collectionView: UICollectionView, _ indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NowPlayingCollectionViewCell.cellIdentifier, for: indexPath) as? NowPlayingCollectionViewCell
        
        cell?.titleLabel.text = nowPlayingMovies[indexPath.item].title
        let year: String = "\(nowPlayingMovies[indexPath.item].releaseDate.prefix(4))"
        cell?.dateLabel.text = year
        cell?.image.image = UIImage(named: nowPlayingMovies[indexPath.item].poster)
        
        return cell ?? NowPlayingCollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.popularCollectionView {
            return makePopularCell(indexPath)
        } else if collectionView == self.nowPlayingCollectionView {
            return makeNowPlayingCell(collectionView, indexPath)
        } else {
            return UICollectionViewCell()
        }
        
    }
}
