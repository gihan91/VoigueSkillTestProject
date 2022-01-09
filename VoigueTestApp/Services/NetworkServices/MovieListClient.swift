//
//  MovieListClient.swift
//  VoigueTestApp
//
//  Created by mac on 8/1/22.
//

import UIKit
import RxSwift
import RxCocoa
import Alamofire

class MovieListClient {
    private static func request<T: Codable> (_ urlConvertible: URLRequestConvertible) -> Observable<T> {
        return Observable<T>.create { observer in
            let request = AF.request(urlConvertible)
                .validate(statusCode: 200..<300)
                .responseDecodable { (response: AFDataResponse<T>) in
                    switch response.result {
                    case .success(let value):
                        observer.onNext(value)
                        observer.onCompleted()
                    case .failure(let error):
                        observer.onError(error)
                        APIErrorManager.handleError(statusCode: response.response?.statusCode ?? error.responseCode ?? 0)
                    }
                }
            return Disposables.create {
                request.cancel()
            }
        }.asObservable()
    }
    
    static func getMovieList() -> Observable<MovieModel> {
        return request(MovieListService.getMovieList(parameters: ["apikey": "523b6c1c", "s": "Marvel", "type": "movie"]))
    }
}
