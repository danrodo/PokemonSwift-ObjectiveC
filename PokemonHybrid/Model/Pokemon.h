//
//  Pokemon.h
//  PokemonHybrid
//
//  Created by Daniel Rodosky on 10/10/17.
//  Copyright © 2017 Daniel Rodosky. All rights reserved.
//
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN


@interface Pokemon : NSObject

@property (nonatomic, copy, readonly) NSString *name;
@property (nonatomic, readonly) NSInteger identifier;
@property (nonatomic, copy, readonly) NSArray<NSString *> *abilities;

- (instancetype)initWithName:(NSString *)name identifier:(NSInteger *)identifier abilities:(NSArray<NSString *> *)abilities NS_DESIGNATED_INITIALIZER;


@end

@interface Pokemon (JSONConvertible)
- (instancetype)initWithDictionary:(NSDictionary <NSString *, id> *)dictionary;
@end


NS_ASSUME_NONNULL_END
