//
//  LoginViewModel.swift
//  Vender
//
//  Created by Emincan on 7.01.2023.
//

import UIKit
import RxSwift
import RxCocoa

class LoginViewModel{
    let mailtextPublishSubject = PublishSubject<String>()
    let passwordTextPublishSubject = PublishSubject<String>()
    
    func isValid() -> Observable<Bool> {
        return Observable.combineLatest(mailtextPublishSubject.asObserver().startWith(""), passwordTextPublishSubject.asObserver().startWith("")) { mail,password in
            return mail.count > 3 && password.count > 3
        }.startWith(false)
    }
    
}
