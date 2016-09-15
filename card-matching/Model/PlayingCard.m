//
//  PlayingCard.m
//  card-matching
//
//  Created by Mark Willett on 14/09/2016.
//  Copyright © 2016 Mark Willett. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard

-(instancetype) initWithSuit:(NSString *) suit
                    andRank:(NSString *) rank {
    self = [super init];
    
    if(self){
        [self setSuit:suit];
        [self setRank:rank];
        NSString* newContents = [NSString stringWithFormat:@"%@%@", self.rank, self.suit];
        [self setContents:newContents];
    }
    
    return self;
}

-(void) setSuit:(NSString *)suit{
    if([[PlayingCard validSuits] containsObject:suit]){
        _suit = suit;
    }
}

-(void) setRank:(NSString *) rank{
    if([[PlayingCard validRanks] containsObject:rank]){
        _rank = rank;
    }
}

+(NSArray *) validSuits{
    return @[@"♠︎",@"♣︎",@"♥︎",@"♦︎"];
}

+(NSArray *) validRanks{
        return @[@"A",@"2",@"3",@"4",@"5",@"6",
                 @"7",@"8",@"9",@"10",@"J",@"Q",@"K"];
}

@end
