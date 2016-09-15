//
//  Deck.m
//  card-matching
//
//  Created by Mark Willett on 13/09/2016.
//  Copyright © 2016 Mark Willett. All rights reserved.
//

#import "Deck.h"
#import "PlayingCard.h"

@interface Deck()

@property (strong, nonatomic) NSMutableArray *cards;

@end

@implementation Deck

-(instancetype) initWithCards{
    self = [self init];
    
    if(self){
        [self fillDeck];
    }
    
    return self;
}

-(NSMutableArray *) cards{
    if(!_cards){
        _cards = [[NSMutableArray alloc] init];
    }
    return _cards;
}

-(void) fillDeck{
    for(NSString *suit in [PlayingCard validSuits]){
        for(NSString *rank in [PlayingCard validRanks]){
            PlayingCard *card = [[PlayingCard alloc] initWithSuit:suit andRank:rank];
            [self addCard:card];
        }
    }
}

-(void) addCard:(Card *)newCard{
    [self.cards addObject:newCard];
}

-(void) reloadDeck{
    [self emptyDeck];
    [self fillDeck];
}

-(void) emptyDeck{
    [self.cards removeAllObjects];
}

-(Card *) drawRandomCard{
    if([self.cards count] == 0){
        [self reloadDeck];
    }
    
    unsigned index = arc4random() % [self.cards count];
    Card* randomCard = self.cards[index];
    [self.cards removeObject:randomCard];
    return randomCard;
}

@end
