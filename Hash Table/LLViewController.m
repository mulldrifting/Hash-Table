//
//  LLViewController.m
//  Hash Table
//
//  Created by Lauren Lee on 5/19/14.
//  Copyright (c) 2014 Lauren Lee. All rights reserved.
//

#import "LLViewController.h"
#import "LLHashTable.h"
#import "LLHashBucket.h"

@interface LLViewController ()

@end

@implementation LLViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    LLHashTable *hashTable = [[LLHashTable alloc] initWithTableSize:20];
    for (int i = 0; i < 20; i++) {
        NSString *randomKey = [NSString stringWithFormat:@"%d", arc4random() % 1000];
        [hashTable setHashObject:[NSNumber numberWithInteger:arc4random() % 200] forKey:randomKey];
//        NSLog(@"%d",hashTable.count);
    }
    
    for (LLHashBucket *bucket in hashTable.hashArray) {
        LLHashBucket *tempBucket = bucket;
        while (tempBucket.obj) {
            NSLog(@"%@: %@",tempBucket.key, tempBucket.obj);
            tempBucket = tempBucket.next;
        }
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
