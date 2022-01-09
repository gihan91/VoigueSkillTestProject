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
}
