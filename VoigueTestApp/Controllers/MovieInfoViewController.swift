//
//  MovieInfoViewController.swift
//  VoigueTestApp
//
//  Created by mac on 9/1/22.
//

import UIKit
import RxSwift
import RxCocoa
import Kingfisher

class MovieInfoViewController: UIViewController,Storyboard, UIScrollViewDelegate {
    
    @IBOutlet weak var lblGenere: UILabel!
    @IBOutlet weak var lblMovieTitle: UILabel!
    @IBOutlet weak var lblMovieYear: UILabel!
    @IBOutlet weak var lblTime: UILabel!
    @IBOutlet weak var lblRatings: UILabel!
    @IBOutlet weak var imgMoviePoster: UIImageView!
    
    @IBOutlet weak var lblActors: UILabel!
    @IBOutlet weak var lblWriter: UILabel!
    @IBOutlet weak var lblDirector: UILabel!
    @IBOutlet weak var lblPopularity: UILabel!
    @IBOutlet weak var lblScores: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    var disposeBag = DisposeBag()
    var movieViewModel = MovieViewModel()
    weak var coordinator: MainNavigator?
    var movieTitleId: String?
    var movieInfo: MovieInfo?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.getMovieInfo()
    }
    
    private func getMovieInfo() {
        self.movieViewModel.getMovieInfo(imdbID: self.movieTitleId ?? "").subscribe { info in
            self.lblMovieTitle.text = self.movieViewModel.movieTitle.value
            self.lblMovieYear.text = self.movieViewModel.movieyear.value
            self.lblTime.text = self.movieViewModel.movieHour.value
            self.lblGenere.text = self.movieViewModel.movieGenre.value
            self.lblRatings.text = self.movieViewModel.movieRatings.value
            self.lblDescription.text = self.movieViewModel.moviePlot.value
            
            self.lblActors.text = self.movieViewModel.movieAactors.value
            self.lblWriter.text = self.movieViewModel.movieWriter.value
            self.lblDirector.text = self.movieViewModel.movieDirector.value
            self.lblPopularity.text = self.movieViewModel.moviePopularity.value
            self.lblScores.text = self.movieViewModel.movieScores.value
            
            
            self.downloadImage(with: self.movieViewModel.moviePoster.value)
        }.disposed(by: disposeBag)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
//        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    func downloadImage(`with` urlString : String){
        guard let url = URL.init(string: urlString) else {
            return
        }
        let resource = ImageResource(downloadURL: url)

        KingfisherManager.shared.retrieveImage(with: resource, options: nil, progressBlock: nil) { result in
            switch result {
            case .success(let value):
                DispatchQueue.main.async {
                    self.imgMoviePoster.image = value.image
                }
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }
}
