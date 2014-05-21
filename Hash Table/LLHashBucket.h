//
//  LLHashBucket.h
//  Hash Table
//
//  Created by Lauren Lee on 5/19/14.
//  Copyright (c) 2014 Lauren Lee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LLHashBucket : NSObject

@property (strong, nonatomic) LLHashBucket *next;
@property (strong, nonatomic) id obj;
@property (copy, nonatomic) NSString *key;

@end
