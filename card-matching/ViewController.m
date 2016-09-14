//
//  ViewController.m
//  card-matching
//
//  Created by Mark Willett on 13/09/2016.
//  Copyright © 2016 Mark Willett. All rights reserved.
//

#import "ViewController.h"
#import "PlayingSurface.h"

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
        _playingSurface = [[PlayingSurface alloc] init];
    }
    
    return _playingSurface;
}

-(void)setFlipCount:(int)flipCount{
    _flipCount = flipCount;
    self.flipsLabel.text = [NSString stringWithFormat:@"Flips: %d", self.flipCount];
    NSLog(@"Flip count set to: %d", self.flipCount);
}

- (IBAction)touchCardButton:(UIButton *)sender {

    if([sender.currentTitle length] != 0){
        [sender setBackgroundImage:[UIImage imageNamed:@"cardback"]
                          forState:UIControlStateNormal];
        [sender setTitle:@"" forState:UIControlStateNormal];
    } else {
        [sender setBackgroundImage:[UIImage imageNamed:@"cardfront"]
                          forState:UIControlStateNormal];
        [sender setTitle:@"A♣︎" forState:UIControlStateNormal];
    }
    
    self.flipCount++;
    
}


-(IBAction)touchNewGame:(UIButton *)sender{
    [self.playingSurface newGame];
}

@end
