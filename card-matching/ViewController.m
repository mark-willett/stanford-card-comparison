//
//  ViewController.m
//  card-matching
//
//  Created by Mark Willett on 13/09/2016.
//  Copyright © 2016 Mark Willett. All rights reserved.
//

#import "ViewController.h"
#import "PlayingSurface.h"
#import "Card.h"

@interface ViewController ()
@property (nonatomic) int flipCount;
@property (strong, nonatomic) IBOutlet UILabel *flipsLabel;
@property (strong, nonatomic) PlayingSurface* playingSurface;
@property (strong, nonatomic) IBOutlet UIButton *reloadGameButton;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@end

@implementation ViewController

-(PlayingSurface *)playingSurface{
    if(!_playingSurface){
        int uniqueCardsNeeded = ([self.cardButtons count] / 2);
        _playingSurface = [[PlayingSurface alloc] initWithDeck:uniqueCardsNeeded];
    }
    
    return _playingSurface;
}

-(void)setFlipCount:(int)flipCount{
    _flipCount = flipCount;
    self.flipsLabel.text = [NSString stringWithFormat:@"Flips: %d", self.flipCount];
}

- (IBAction)touchCardButton:(UIButton *)sender {
    int cardButtonIndex = [self.cardButtons indexOfObject:sender];
    Card* chosenCard = self.playingSurface.drawnCards[cardButtonIndex];
    [self.playingSurface selectCard:chosenCard];
    
    NSLog(@"chosenButtonIndex: %d", cardButtonIndex);
    
    [self updateUI];
    self.flipCount++;
    
}

-(void)updateUI{
    for(int index = 0; index < [self.cardButtons count]; index++){
        Card* currentCard = self.playingSurface.drawnCards[index];
        
        [self.cardButtons[index] setTitle:[self checkLabel:currentCard] forState:UIControlStateNormal];
        [self.cardButtons[index] setBackgroundImage:[self checkBackground:currentCard] forState: UIControlStateNormal];
    }
}

-(NSString *)checkLabel:(Card*) card{
    
    if([card isMatched]){
        return card.contents;
    }
    
    if(self.playingSurface.selectedCard == card){
        return card.contents;
    }
    
    return @"";
}

-(UIImage *)checkBackground:(Card*) card{
    
    if([card isMatched]){
        NSLog(@"Card %d is matched", index);
        return [UIImage imageNamed:@"cardfront"];
    }
    
    if(self.playingSurface.selectedCard == card){
        NSLog(@"Card %d is selected", index);
        return [UIImage imageNamed:@"cardfront"];
    }
    
    NSLog(@"Card %d isn't matched", index);
    return [UIImage imageNamed:@"cardback"];
}

-(IBAction)touchNewGame:(UIButton *)sender{
    int uniqueCardsNeeded = ([self.cardButtons count] / 2);
    _playingSurface = [[PlayingSurface alloc] initWithDeck:uniqueCardsNeeded];
    self.flipCount = 0;
    [self updateUI];
}

@end
