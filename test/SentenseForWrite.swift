//
//  File.swift
//  test
//
//  Created by USER on 2018. 11. 13..
//  Copyright © 2018년 USER. All rights reserved.
//

import Foundation

protocol SentenseProtocol {
    var title:String {get set}
    var saveKey:String {get set}
//    var sentenseDic:Dictionary<String, Any>{get set}
    var sentenseDic:[String: String] {get set}
}

struct FirstSentense :SentenseProtocol {
    var title = "1형식 예문"
    var saveKey = "FirstSentense"
//    var sentenseDic: Dictionary<String, Any> =  ["그 소녀는 소리쳤다." : "The girl screamed.",
    var sentenseDic: [String: String] =  ["그 소녀는 소리쳤다." : "The girl screamed.",
                                                 "그 택시는 호텔에 도착했다.":"The taxi arrived at the hotel.",
                                                 "그 가수 주변에는 많은 팬들이 있다.":"There are lots of fans around the singer."]
}

struct SecondSentense :SentenseProtocol {
    var title = "2형식 예문"
    var saveKey = "SecondSentense"
//    var sentenseDic: Dictionary<String, Any> = ["내 사촌은 수학 선생님이다.":"My cousin is a math teacher.",
    var sentenseDic: [String: String] = ["내 사촌은 수학 선생님이다.":"My cousin is a math teacher.",
                                                "그 학생들은 조용히 있었다.":"The students kept quiet.",
                                                "그 음식은 상했다.":"The food went bad.",
                                                "너는 오늘 화나 보인다.":"You look upset today.",
                                                "그 음악은 근사하게 들렸다.":"The music sounded wonderful.",
                                                "이 꽃은 좋은 향기가 난다.":"This flower smells good.",
                                                "레몬은 아주 신맛이 난다.":"Lemons taste very sour.",
                                                "그 스카프는 부드러운 느낌이 난다.":"The scarf feels soft.",
                                                "그는 그의 아버지처럼 보인다. ":"He looks like his father.",
                                                "그건 좋은 계획처럼 들린다. ":"It sounds like a good plan." ]
}

class SentenseForWrite {
    
    static let sharedInstance = SentenseForWrite()
    
    let sentenseArr = [FirstSentense(), SecondSentense()] as [Any]
    
    func saveComplet(target:SentenseProtocol, sentenseKey:String)  {
        
        var completDic: [String:Bool]?
        if UserDefaults.standard.dictionary(forKey: target.saveKey) == nil  {
            completDic = [:]
            for key in target.sentenseDic.keys {
                completDic![key] = false
            }
        }else {
            completDic = UserDefaults.standard.dictionary(forKey: target.saveKey) as? [String : Bool]
        }
        
        for key in (completDic?.keys)! {
            if key == sentenseKey {
                completDic![key] = true
                continue
            }
        }
        UserDefaults.standard.set(completDic, forKey: target.saveKey)
    }
    
//    func getOriginSentense(key:String) -> String {
//        return ""
//    }
    
    func getProgress(target:SentenseProtocol) -> Double {
        
        let completDic = UserDefaults.standard.dictionary(forKey: target.saveKey) //as? [String : Bool]
        if completDic == nil {
            return 0
        } else {
            var completCnt = 0.0
            for (_, value) in completDic! {
                if value as! Bool {
                    completCnt += 1
                }
            }
            let allCnt:Double = Double(completDic!.count)
            let progress = (100/allCnt) * completCnt
            return progress
        }
    }

    func getNoNextCompletKey(target:SentenseProtocol) -> String {
        
        var completDic: [String:Bool]?
        if UserDefaults.standard.dictionary(forKey: target.saveKey) == nil  {
            return ""
        }else {
            completDic = UserDefaults.standard.dictionary(forKey: target.saveKey) as? [String : Bool]
            
            for key in (completDic?.keys)! {
                if !completDic![key]! {
                    return key
                }
            }
        }
        return ""
    }
    
//    func getNoRandomCompletKey(target:SentenseProtocol) -> String {
//        
//        let completDic = UserDefaults.standard.dictionary(forKey: target.saveKey) as? [String : Bool]
//        if completDic == nil  {
//            return ""
//        }else {
//            let index: Int = Int(arc4random_uniform(UInt32(completDic!.count)))
//            let value = Array((completDic?.values)!)[index]
//            if value {
//                return Array((completDic?.keys)!)[index]
//            }
//        }
//        return ""
//    }
//    
//    func getNoNextCompletKey(target:SentenseProtocol, cnt:Int) -> String {
//        
//        var completDic: [String:Bool]?
//        if UserDefaults.standard.dictionary(forKey: target.saveKey) == nil  {
//            return ""
//        }else {
//            completDic = UserDefaults.standard.dictionary(forKey: target.saveKey) as? [String : Bool]
//            
//            for key in (completDic?.keys)! {
//                if !completDic![key]! {
//                    return key
//                }
//            }
//        }
//        return ""
//    }
    
//    private func isComplet(target:NSDictionary, cnt:Int) -> Bool {
//
//        let index: Int = Int(arc4random_uniform(UInt32(target.count)))
////        let value = target.allValues[index] //target.value[index]
//        let key = (Bool)target.allKeys[index]
////        return (key, value)
//        return key
//    }
    
}





