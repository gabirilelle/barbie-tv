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
        } else if collectionView == self.upcomingCollectionView {
            return upcomingMovies.count
        } else { return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.popularCollectionView {
            return makePopularCell(indexPath)
        } else if collectionView == self.nowPlayingCollectionView {
            return makeNowPlayingCell(collectionView, indexPath)
        } else if collectionView == self.upcomingCollectionView{
            return makeUpcomingCell(collectionView, indexPath)
        } else {
            return UICollectionViewCell()
        }
    }
    
    
    
    
    
    fileprivate func makePopularCell(_ indexPath: IndexPath) -> UICollectionViewCell {
        let cell = popularCollectionView.dequeueReusableCell(withReuseIdentifier: PopularCollectionViewCell.cellIdentifier, for: indexPath) as? PopularCollectionViewCell
        
        let movie = popularMovies[indexPath.item]
        cell?.setup(title: movie.title, image: UIImage(named: popularMovies[indexPath.item].backdropPath) ?? UIImage())
        
        
        
        return cell ?? PopularCollectionViewCell()
    }
    
    fileprivate func makeNowPlayingCell(_ collectionView: UICollectionView, _ indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NowPlayingCollectionViewCell.cellIdentifier, for: indexPath) as? NowPlayingCollectionViewCell
        
        let year: String = "\(nowPlayingMovies[indexPath.item].releaseDate.prefix(4))"
        
        cell?.setup(title: nowPlayingMovies[indexPath.item].title,
                    year: year,
                    image: UIImage(named: nowPlayingMovies[indexPath.item].posterPath) ?? UIImage())
        
        return cell ?? NowPlayingCollectionViewCell()
    }
    
    fileprivate func makeUpcomingCell(_ collectionView: UICollectionView, _ indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UpcomingCollectionViewCell.cellIdentifier, for: indexPath) as? UpcomingCollectionViewCell
        
        let year: String = "\(upcomingMovies[indexPath.item].releaseDate.prefix(4))"
        
        cell?.setup(title: upcomingMovies[indexPath.item].title,
                    year: year,
                    image: UIImage(named: upcomingMovies[indexPath.item].posterPath) ?? UIImage())
        
        return cell ?? UpcomingCollectionViewCell()
    }
   
}
