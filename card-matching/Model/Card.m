//
//  Card.m
//  card-matching
//
//  Created by Mark Willett on 13/09/2016.
//  Copyright © 2016 Mark Willett. All rights reserved.
//

#import "Card.h"

@implementation Card

-(int) match:(Card *)otherCard{
    int score = 0;
    if([otherCard.contents isEqualToString:self.contents]){
            score = 1;
    }
    return score;
}

@end
