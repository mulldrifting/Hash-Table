//
//  LLHashTable.m
//  Hash Table
//
//  Created by Lauren Lee on 5/19/14.
//  Copyright (c) 2014 Lauren Lee. All rights reserved.
//

#import "LLHashTable.h"
#import "LLHashBucket.h"

@implementation LLHashTable

- (id)initWithTableSize:(NSInteger)size
{
    if (self = [super init]) {
        self.tableSize = size;
        self.hashArray = [NSMutableArray new];
        self.count = 0;
        
        for (int i = 0; i < self.tableSize; i++) {
            LLHashBucket *bucket = [LLHashBucket new];
            [self.hashArray addObject:bucket];
        }
    }
    return self;
}

- (NSInteger)hash:(NSString *)key
{
    NSInteger total = 0;
    for (int i = 0; i < key.length; i++) {
        NSInteger asc = [key characterAtIndex:i];
        total += asc;
    }
    
    NSInteger index = total % self.tableSize;
    return index;
}

- (void)setHashObject:(id)obj forKey:(NSString *)key
{
    LLHashBucket *bucket = [LLHashBucket new];
    NSInteger index = [self hash:key];
    bucket.obj = obj;
    bucket.key = key;
    bucket.next = self.hashArray[index];
    self.hashArray[index] = bucket;
    self.count++;
    NSLog(@"%d",self.count);
    [self checkSize];
}

- (id)objectForKey:(NSString *)key
{
    NSInteger index = [self hash:key];
    LLHashBucket *bucket = self.hashArray[index];
    while (bucket) {
        if ([bucket.key isEqual:key]) {
            return bucket.obj;
        }
        bucket = bucket.next;
    }
    return nil;
}

- (void)deleteObjectForKey:(NSString *)key
{
    NSInteger index = [self hash:key];
    LLHashBucket *bucket = self.hashArray[index];
    while (bucket) {
        if ([bucket.key isEqual:key]) {
            self.hashArray[index] = bucket.next;
            self.count--;
            return;
        }
        else if ([bucket.next.key isEqual:key])
        {
            bucket.next = bucket.next.next;
            self.count--;
            return;
        }
        else {
            bucket = bucket.next;
        }
    }
    NSLog(@"Cannot delete object for key %@, doesn't exist", key);
}

- (void)checkSize
{
    if (self.count > .7 * self.tableSize) {
        
        self.tableSize = self.tableSize * 2;

        
        NSMutableArray *oldArray = self.hashArray;
        self.hashArray = [NSMutableArray new];
        
        for (int i = 0; i < self.tableSize; i++) {
            LLHashBucket *bucket = [LLHashBucket new];
            [self.hashArray addObject:bucket];
        }
        
        self.count = 0;

        for (LLHashBucket *headBucket in oldArray) {
            LLHashBucket *bucket = headBucket;
            while (bucket.obj) {
                [self setHashObject:bucket.obj forKey:bucket.key];
                bucket = bucket.next;
            }
        }
    }
}


@end
