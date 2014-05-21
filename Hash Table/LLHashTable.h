//
//  LLHashTable.h
//  Hash Table
//
//  Created by Lauren Lee on 5/19/14.
//  Copyright (c) 2014 Lauren Lee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LLHashTable : NSObject

@property (nonatomic) NSInteger tableSize;
@property (strong, nonatomic) NSMutableArray *hashArray;
@property (nonatomic) NSInteger count;

- (id)initWithTableSize:(NSInteger)size;
- (void)setHashObject:(id)obj forKey:(NSString *)key;
- (id)objectForKey:(NSString *)key;

@end
