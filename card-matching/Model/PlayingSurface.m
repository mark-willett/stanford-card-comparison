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
@property (nonatomic) int tableCardCount;

@end

@implementation PlayingSurface

-(instancetype) initWithDeck:(int) tableCardCount{
    self = [self init];
    
    if(self){
        self.deck = [[Deck alloc] initWithCards];
        self.tableCardCount = tableCardCount;
        self.cardSelected = NO;
        [self layTable];
    }
    
    return self;
}

-(NSMutableArray *)drawnCards{
    if(!_drawnCards){
        NSLog(@"Creating a new mutable array for drawn cards");
        _drawnCards = [[NSMutableArray alloc] init];
    }
    return _drawnCards;
}

-(void)layTable{
    NSMutableArray* unshuffled = [[NSMutableArray alloc] init];
    
    for(int i = 0; i < self.tableCardCount; i++){
        Card* randomCard = [self.deck drawRandomCard];
        NSLog(@"Drew card: %@", randomCard.contents);
        [unshuffled addObject:randomCard];
        Card* cardCopy = [[Card alloc] init];
        [cardCopy setContents:randomCard.contents];
        [unshuffled addObject:cardCopy];
    }
    
    for(int i = 0; i < (self.tableCardCount * 2); i++){
        Card* randomTableCard = [self getRandomCard:unshuffled];
        NSLog(@"Added %@ to the table", randomTableCard.contents);
        [self.drawnCards addObject:randomTableCard];
    }
    
}

-(void)newGame{
    [self.deck reloadDeck];
    [self layTable];
}

-(Card *)getRandomCard:(NSMutableArray *) cards{
    unsigned index = arc4random() % [cards count];
    Card* returnCard = cards[index];
    [cards removeObjectAtIndex:index];
    return returnCard;
}

-(void)selectCard:(Card *) card{
    
    //card is already selected
    if(self.isCardSelected){
        //same card was clicked again
        if(card == self.selectedCard){
            self.cardSelected = NO;
            self.selectedCard = nil;
        //different card clicked
        } else {
            //different card clicked
            int matchValue = [self.selectedCard match:card];
            //cards match
            if(matchValue == 1){
                [self.selectedCard setMatched:YES];
                [card setMatched:YES];
            }
            
            //deselect the currently held card
            self.cardSelected = NO;
            self.selectedCard = nil;
        }
        
    //no card is selected
    } else {
        //hold the card
        self.cardSelected = YES;
        self.selectedCard = card;
    }
}

@end
