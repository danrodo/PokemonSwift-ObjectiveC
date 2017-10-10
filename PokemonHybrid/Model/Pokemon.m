//
//  Pokemon.m
//  PokemonHybrid
//
//  Created by Daniel Rodosky on 10/10/17.
//  Copyright © 2017 Daniel Rodosky. All rights reserved.
//

#import "Pokemon.h"

@implementation Pokemon

- (instancetype)initWithName:(NSString *)name identifier:(NSInteger *)identifier abilities:(NSArray<NSString *> *)abilities
{
    self = [super init];
    if(self) {
        _name = name;
        _identifier = identifier;
        _abilities = abilities;
    }
    return self;
}

- (instancetype)init
{
    return [self initWithName:@"" identifier:0 abilities:@[]];
}

@end

@implementation Pokemon (JSONConvertible)

- (instancetype)initWithDictionary:(NSDictionary<NSString *,id> *)dictionary
{
    NSString *name = dictionary[@"name"];
    NSInteger identifier = [dictionary[@"id"] integerValue];
    
    NSArray *abilitiesDictionaryArray = dictionary[@"abilities"];
    NSMutableArray *abilities = [[NSMutableArray alloc] init];
    
    for (NSDictionary *abilityDictionary in abilitiesDictionaryArray) {
        NSDictionary *nestedDictionary = abilityDictionary[@"ability"];
        NSString *abilityName = nestedDictionary[@"name"];
        [abilities addObject: abilityName];
    }
    return [self initWithName: name identifier: identifier abilities: abilities];
}

@end
