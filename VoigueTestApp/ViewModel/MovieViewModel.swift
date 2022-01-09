//
//  MovieViewModel.swift
//  VoigueTestApp
//
//  Created by mac on 8/1/22.
//

import Foundation
import RxCocoa
import RxSwift

class MovieViewModel {
    
    let disposeBag = DisposeBag()
    let movieList = BehaviorRelay<[Search]>(value: [Search]())
    let movieTitle = BehaviorRelay<String>(value: "")
    let moviePoster = BehaviorRelay<String>(value: "")
    let movieyear = BehaviorRelay<String>(value: "")
    let movieGenre = BehaviorRelay<String>(value: "")
    let movieHour = BehaviorRelay<String>(value: "")
    let movieRatings = BehaviorRelay<String>(value: "")
    let moviePlot = BehaviorRelay<String>(value: "")
    
    let movieScores = BehaviorRelay<String>(value: "")
    let movieReviews = BehaviorRelay<String>(value: "")
    let moviePopularity = BehaviorRelay<String>(value: "")
    
    let movieDirector = BehaviorRelay<String>(value: "")
    let movieWriter = BehaviorRelay<String>(value: "")
    let movieAactors = BehaviorRelay<String>(value: "")
    
    func getMovieList() -> Observable<MovieModel> {
        return Observable.create { [unowned self] (observer)  ->  Disposable in
            MovieListClient.getMovieList().subscribe{ list in
                observer.onNext(list)
                observer.onCompleted()
                self.movieList.accept(list.search)
            }onError: { error in
                observer.onError(error)
            }.disposed(by: disposeBag)
            return Disposables.create()
        }
    }
    
    func getMovieInfo(imdbID: String) -> Observable<MovieInfo> {
        return Observable.create { [unowned self] (observer) -> Disposable in
            return MovieListClient.getMovieListInfo(imdbID: imdbID).asObservable().subscribe { movieObj in
                observer.onNext(movieObj)
                self.movieTitle.accept(movieObj.title!)
                self.movieyear.accept(movieObj.year!)
                self.moviePoster.accept(movieObj.poster!)
                self.movieGenre.accept(movieObj.genre!)
                self.movieHour.accept(movieObj.runtime!)
                self.movieRatings.accept(movieObj.imdbRating)
                self.moviePlot.accept(movieObj.plot!)
                
                self.movieScores.accept(movieObj.metascore)
                self.moviePopularity.accept(movieObj.imdbVotes)
                
                self.movieDirector.accept(movieObj.director!)
                self.movieWriter.accept(movieObj.writer!)
                self.movieAactors.accept(movieObj.actors!)
                observer.onCompleted()
            } onError: { error in
                observer.onError(error)
            }
        }
    }
}
