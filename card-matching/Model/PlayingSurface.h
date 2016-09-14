//
//  PlayingSurface.h
//  card-matching
//
//  Created by Mark Willett on 14/09/2016.
//  Copyright © 2016 Mark Willett. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"
#import "Card.h"

@interface PlayingSurface : NSObject

@property (strong, nonatomic) NSMutableArray* drawnCards;
@property (strong, nonatomic) Card* selectedCard;

-(void) newGame:(NSInteger)cardCount;
-(Card *) getRandomCard;
-(void) selectCard:(Card *) card;


@end
