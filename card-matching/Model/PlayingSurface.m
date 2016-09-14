//
//  PlayingSurface.m
//  card-matching
//
//  Created by Mark Willett on 14/09/2016.
//  Copyright © 2016 Mark Willett. All rights reserved.
//

#import "PlayingSurface.h"


@interface PlayingSurface()

@property (strong, nonatomic) Deck* deck;
@property (nonatomic, getter = isCardSelected) BOOL cardSelected;
@property (strong, nonatomic) Card* selectedCard;

@end

@implementation PlayingSurface

-(NSMutableArray *)drawnCards{
    if(!_drawnCards){
        _drawnCards = [[NSMutableArray alloc] init];
    }
    return _drawnCards;
}

-(void)newGame:(NSInteger)cardCount{
    [self.deck reloadDeck];
    
    for(NSInteger index = 0; index < cardCount; index++){
        Card* newCard = [[Card alloc] init];
        newCard = [self.deck drawRandomCard];
        [self.drawnCards addObject:newCard];
        [self.drawnCards addObject:newCard];
    }
}

-(Card *)getRandomCard{
    unsigned index = arc4random() % [self.drawnCards count];
    Card* returnCard = [[Card alloc]init];
    returnCard = self.drawnCards[index];
    [self.drawnCards removeObject:returnCard];
    return returnCard;
}

-(void)selectCard:(Card *) card{
    if(self.isCardSelected){
        NSInteger matchValue = [self.selectedCard match:card];
        if(matchValue == 1){
            [card setMatched:YES];
            [self.selectedCard setMatched:YES];
        }
    } else {
        self.cardSelected = YES;
        self.selectedCard = card;
    }
}

@end
