//
//  PlayingCard.m
//  card-matching
//
//  Created by Mark Willett on 14/09/2016.
//  Copyright © 2016 Mark Willett. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard

-(void) setSuit:(NSString *)suit{
    if([[PlayingCard validSuits] containsObject:suit]){
        _suit = suit;
    }
}

-(void) setRank:(NSString *) value{
    if([[PlayingCard validValues] containsObject:value]){
        _value = value;
    }
}

+(NSArray *) validSuits{
    return @[@"♠︎",@"♣︎",@"♥︎",@"♦︎"];
}

+(NSArray *) validValues{
        return @[@"A",@"1",@"2",@"3",@"4",@"5",@"6",
                 @"7",@"8",@"9",@"10",@"J",@"Q",@"K"];
}

@end
