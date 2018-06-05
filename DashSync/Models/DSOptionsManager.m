//
//  DSOptionsManager.m
//  DashSync
//
//  Created by Sam Westrich on 6/5/18.
//

#import "DSOptionsManager.h"

#define OPTION_KEEP_HEADERS @"OPTION_KEEP_HEADERS"
#define OPTION_KEEP_HEADERS_DEFAULT FALSE
#define OPTION_SYNC_FROM_GENESIS @"OPTION_SYNC_FROM_GENESIS"
#define OPTION_SYNC_FROM_GENESIS_DEFAULT FALSE

@implementation DSOptionsManager

+ (instancetype)sharedInstance
{
    static id singleton = nil;
    static dispatch_once_t onceToken = 0;
    
    dispatch_once(&onceToken, ^{
        singleton = [self new];
    });
    
    return singleton;
}

-(instancetype)init {
    if (!(self = [super init])) return nil;
    

    return self;
}

-(void)setKeepHeaders:(BOOL)keepHeaders {
    [[NSUserDefaults standardUserDefaults] setBool:keepHeaders forKey:OPTION_KEEP_HEADERS];
}

-(BOOL)keepHeaders {
    if ([[NSUserDefaults standardUserDefaults] objectForKey:OPTION_KEEP_HEADERS]) {
    return [[NSUserDefaults standardUserDefaults] boolForKey:OPTION_KEEP_HEADERS];
    } else {
        return OPTION_KEEP_HEADERS_DEFAULT;
    }
}

-(void)setSyncFromGenesis:(BOOL)syncFromGenesis {
    [[NSUserDefaults standardUserDefaults] setBool:syncFromGenesis forKey:OPTION_SYNC_FROM_GENESIS];
}

-(BOOL)syncFromGenesis {
    if ([[NSUserDefaults standardUserDefaults] objectForKey:OPTION_SYNC_FROM_GENESIS]) {
        return [[NSUserDefaults standardUserDefaults] boolForKey:OPTION_SYNC_FROM_GENESIS];
    } else {
        return OPTION_SYNC_FROM_GENESIS_DEFAULT;
    }
}

@end