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

-(NSMutableArray *) cards{
    if(!_cards){
        _cards = [[NSMutableArray alloc] init];
    }
    return _cards;
}

-(void) addCard:(Card *)newCard{
    [self.cards addObject:newCard];
}

-(void) reloadDeck{
    [self emptyDeck];
    
    for(NSString *suit in [PlayingCard validSuits]){
        for(NSString *value in [PlayingCard validValues]){
            PlayingCard *card = [[PlayingCard alloc] init];
            [card setSuit:suit];
            [card setValue:value];
            NSString* cardContents = [[NSString alloc] init];
            
            
            cardContents = card.value;
            [cardContents stringByAppendingString:card.suit];
            card.contents = cardContents;
            [self addCard:card];
        }
    }
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
