//
//  CoreDataHelp.swift
//  Pokemon
//
//  Created by Andrzej Palec on 11/06/2017.
//  Copyright © 2017 Andrzej Palec. All rights reserved.
//

import UIKit
import CoreData

func addAllPokemon() {
    
    createPokemon(name: "Maxíčekbublifuk", imageName: "max512")
    createPokemon(name: "Mad Bob", imageName: "robik512")
    createPokemon(name: "Hadzik Fizlik", imageName: "hadzi512")
    createPokemon(name: "Jollipuff", imageName: "joll512")
    createPokemon(name: "Jirkazombie", imageName: "jirka512")
    createPokemon(name: "AndrzejTovarnik", imageName: "andrzej512")
    createPokemon(name: "Venonat", imageName: "venonat")
    createPokemon(name: "Mew", imageName: "mew")
    createPokemon(name: "Meowth", imageName: "meowth")
    createPokemon(name: "Bullbasaur", imageName: "bullbasaur")
    createPokemon(name: "Caterpie", imageName: "caterpie")
    createPokemon(name: "Charmander", imageName: "charmander")
    createPokemon(name: "Dratini", imageName: "dratini")
    createPokemon(name: "Eevee", imageName: "eevee")
    createPokemon(name: "Jigglypuff", imageName: "jigglypuff")
    createPokemon(name: "Mankey", imageName: "mankey")
    createPokemon(name: "Pidgey", imageName: "pidgey")
    createPokemon(name: "Pikachu", imageName: "pikachu")
    createPokemon(name: "Rattata", imageName: "rattata")
    createPokemon(name: "Snorlax", imageName: "snorlax")
    createPokemon(name: "Squirtle", imageName: "squirtle")
    createPokemon(name: "Weedle", imageName: "weedle")
    createPokemon(name: "Zubat", imageName: "zubat")
    
    (UIApplication.shared.delegate as! AppDelegate).saveContext()
}

func createPokemon(name: String, imageName: String) {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    let pokemon = Pokemon(context: context)
    pokemon.name = name
    pokemon.imageName = imageName
    
}

func getAllPokemon() -> [Pokemon] {
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    do {
        let pokemons = try context.fetch(Pokemon.fetchRequest()) as! [Pokemon]
        
        if pokemons.count == 0 {
            addAllPokemon()
            return getAllPokemon()
        }
        return pokemons
    } catch {}
    
    return []
    
}

func getAllCaughtPokemons() -> [Pokemon] {
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    let fetchRequest = Pokemon.fetchRequest() as NSFetchRequest<Pokemon>
    
    fetchRequest.predicate = NSPredicate(format: "caught == %@", true as CVarArg)
    
    do {
        
        let pokemons = try context.fetch(fetchRequest) as [Pokemon]
        
        return pokemons
    } catch{}
    return []
}

func getAllUncaughtPokemons() -> [Pokemon] {
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    let fetchRequest = Pokemon.fetchRequest() as NSFetchRequest<Pokemon>
    
    fetchRequest.predicate = NSPredicate(format: "caught == %@", false as CVarArg)
    
    do {
        
        let pokemons = try context.fetch(fetchRequest) as [Pokemon]
        
        return pokemons
    } catch{}
    return []
}

