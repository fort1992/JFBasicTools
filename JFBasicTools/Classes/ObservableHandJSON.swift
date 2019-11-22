//
//  ObservableHandJSON.swift
//  BaseFrame_Swift
//
//  Created by zx on 2019/3/5.
//  Copyright © 2019 zx. All rights reserved.
//

import Foundation
import RxSwift
import Moya
import HandyJSON
extension ObservableType where E == Response {
    public func maphandyJsonModel<T: HandyJSON>(_ type: T.Type) -> Observable<T> {
        return flatMap { response -> Observable<T> in
            return Observable.just(response.mapHandyJsonModelNew(T.self))
        }
    }
}
extension Response {
    func mapHandyJsonModelNew<T: HandyJSON>(_ type: T.Type) -> T {
        let jsonString = String.init(data: data, encoding: .utf8)
        if let modelT = JSONDeserializer<T>.deserializeFrom(json: jsonString) {
            return modelT
        }
        return JSONDeserializer<T>.deserializeFrom(json: "{\"msg\":\"请求有误\"}")!
    }
}
