//
//  SearchBlogNetwork.swift
//  SearchDaumBlog
//
//  Created by 박경춘 on 2023/03/26.
//

import Foundation
import RxSwift

enum SearchNetworkError: Error {
    case invalidJSON
    case networkError
    case invalidURL
}


class SearchBlogNetwork {
    private let session: URLSession
    let api = SearchBlogAPI()
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    func searchBlog(query: String) -> Single<Result<DKBlog, SearchNetworkError>> {
        guard let url = api.searchBlog(query: query).url else { return .just(.failure(.invalidURL))}
        
        let request = NSMutableURLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("KakaoAK d6a49c35060874c69554ac9162b6b64f", forHTTPHeaderField: "Authorization")
        
        return session.rx.data(request: request as URLRequest)
            .map { data in
                do {
                    let blogData = try JSONDecoder().decode(DKBlog.self, from: data)
                    return .success(blogData)
                }
                catch {
                    return .failure(.invalidJSON)
                }
            }
            .catch { _ in
                    .just(.failure(.networkError))
            }
            .asSingle()
    }
}
