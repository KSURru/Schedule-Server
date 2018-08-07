//
//  Sender.swift
//  Serv
//
//  Created by Nikita Arutyunov on 07.08.2018.
//

import Foundation
import SwiftProtobuf

protocol ServSenderProtocol: class {
    
    func send(serializedWeek: Data)

}

class ServSender: ServSenderProtocol {
    
    func send(serializedWeek: Data) {
        
        dump(serializedWeek)
        
    }
    
}
