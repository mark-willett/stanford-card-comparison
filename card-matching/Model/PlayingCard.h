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
@property (strong, nonatomic) NSString *value;

+(NSArray *) validSuits;
+(NSArray *) validValues;

@end
