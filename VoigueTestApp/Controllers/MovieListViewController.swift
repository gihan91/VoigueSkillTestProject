//
//  MovieListViewController.swift
//  VoigueTestApp
//
//  Created by mac on 8/1/22.
//

import UIKit
import RxSwift
import RxCocoa

class MovieListViewController: UIViewController, Storyboard, UIScrollViewDelegate, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var moviesCollection: UICollectionView!
    
    weak var coordinator: MainNavigator?
    var disposeBag = DisposeBag()
    var movieViewModel = MovieViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupDelegates()
        self.bindData()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.moviesCollection.reloadData()
    }
    
    private func setupDelegates() {
        self.moviesCollection.rx.setDelegate(self).disposed(by: disposeBag)
        let nibName = UINib(nibName: "MoviewListCollectionViewCell", bundle:nil)
        moviesCollection.register(nibName, forCellWithReuseIdentifier: "MoviewListCollectionViewCell")
    }
    
    private func getMovieList() {
        self.movieViewModel.getMovieList().asObservable().subscribe { _ in }.disposed(by:disposeBag)
    }
    
    private func bindData() {
        movieViewModel.movieList.bind(to: moviesCollection.rx.items(cellIdentifier: "MoviewListCollectionViewCell", cellType: MoviewListCollectionViewCell.self)
        ) { row, model, cell in
            cell.lblMovieTitle.text = model.title
            cell.downloadImage(with: model.poster)
            
        }.disposed(by: disposeBag)
        
        self.getMovieList()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
        {
           return CGSize(width: 160, height: 285)
        }
    
    
}
