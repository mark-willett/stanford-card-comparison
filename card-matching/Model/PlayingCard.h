//
//  PlayingCard.h
//  card-matching
//
//  Created by Mark Willett on 14/09/2016.
//  Copyright © 2016 Mark Willett. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card

@property (strong, nonatomic) NSString *suit;
@property (strong, nonatomic) NSString *rank;


-(instancetype) initWithSuit:(NSString *) suit
                     andRank:(NSString *) rank;
+(NSArray *) validSuits;
+(NSArray *) validRanks;

@end
