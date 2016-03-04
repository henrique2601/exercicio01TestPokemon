//
//  Trainer.swift
//  Exercicio01Test
//
//  Created by Paulo Henrique dos Santos on 01/03/16.
//  Copyright © 2016 Paulo Henrique dos Santos. All rights reserved.
//

import Foundation

class Trainer {
    var name: String
    var age: Int
    var photo: String
    var town: String
    var onHandPokemons: Array<[String: AnyObject]>
    
    init?(json: [String: AnyObject]){
        // alternate type pattern matching syntax you might like to try
        //print(json["onHandPokemons"])
        guard case let (age as Int, name as String, photo as String, town as String, onHandPokemons as Array<[String: AnyObject]>) = (json["age"],json["name"],json["photo"],json["town"],json["onHandPokemons"])
            else {
                print("Oh noes, bad JSON!")
                self.age = 0     // must assign to all values
                self.name = ""  // before returning nil
                self.photo = ""
                self.town = ""
                self.onHandPokemons = []
                return nil
        }
        // now, assign those unwrapped values to self
        self.age = age
        self.name = name
        self.photo = photo
        self.town = town
        self.onHandPokemons = onHandPokemons
        print(self.name)
    }

}
