//
//  Executer.swift
//  place-your-orderTests
//
//  Created by Livia Vasconcelos on 01/05/19.
//  Copyright © 2019 Livia Vasconcelos. All rights reserved.
//

struct Action {
    let block: () -> ()
    
    func call() {
        block()
    }
}

func execute(action: Action, _ setup: () -> () ) {
    setup()
    action.block()
}
