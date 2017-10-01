//: Playground - noun: a place where people can play

import UIKit


// two cases that we need urls to be build upon
enum URLsFactory {
    case simpleCall(Paths, page: Int, limit: Int)
    case appSimple(Paths)
    
}

// api paths
extension URLsFactory{
    enum Paths: String {
        case mainStream
        case profileGame
        case follow 
    }
}

// url builder
extension URLsFactory {
    var url: URL {
        switch self {
        case .simpleCall(let path, let page, let limit):
            // create query items
            let pageQuery = URLQueryItem(name: "page", value: "\(page)")
            let limitQuery = URLQueryItem(name: "limit", value: "\(limit)")
            // add path to main url
            let url = mainDomain.appendingPathComponent(path.rawValue)
            // create components builder
            var component = URLComponents(url: url, resolvingAgainstBaseURL: true)!
            // add queries
            component.queryItems = [pageQuery, limitQuery]
            return component.url!
        case .appSimple(let path):
            return mainDomain.appendingPathComponent(path.rawValue, isDirectory: true)
        }
    }
}

// main webservice url
extension URLsFactory{
    var mainDomain: URL {
        return URL(string: "www.example.com")!
    }
}

let urlWithPaging = URLsFactory.simpleCall(.profileGame, page: 15, limit: 15).url
let url = URLsFactory.appSimple(.profileGame).url


