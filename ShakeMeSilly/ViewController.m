//
//  ViewController.m
//  ShakeMeSilly
//
//  Created by John Daratzikis on 05/03/2017.
//  Copyright © 2017 ioannisdaratzikis. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    time = 10;
    score = 0;
    mode = 0;
    image = 1;
    
    self.timerLabel.text = [NSString stringWithFormat:@"%i", time];
    self.scoreLabel.text = [NSString stringWithFormat:@"%i", score];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)startGame:(id)sender {

    if (time == 10) {
    
        timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(updateCounter) userInfo:nil repeats:YES];
        
        self.startButton.enabled = NO;
        self.startButton.alpha = 0.5;
        
        mode = 1;
    }
    
    if (time == 0) {
    
        time = 10;
        score = 0;
        
        self.timerLabel.text = [NSString stringWithFormat:@"%i", time];
        self.scoreLabel.text = [NSString stringWithFormat:@"%i", score];
        
        [self.startButton setTitle:@"Start Game" forState:UIControlStateNormal];
    }

}

-(void)updateCounter {

    time -= 1;
    
    self.timerLabel.text = [NSString stringWithFormat:@"%i", time];
    
    if (time == 0) {
    
        [timer invalidate];
        
        self.startButton.enabled = YES;
        self.startButton.alpha = 1.0;
        
        [self.startButton setTitle:@"Restart Game" forState:UIControlStateNormal];
        mode = 0;
    
    }

}

-(void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event {

    if (event.subtype == UIEventSubtypeMotionShake){
    
        if (mode == 1) {
        
            score += 1;
            
            self.scoreLabel.text = [NSString stringWithFormat:@"%i", score];
            
            image += 1;
            
            if (image == 5) {
            
                image = 1;
                
            }
            
            NSString *img = [NSString stringWithFormat:@"Maracas%i.png", image];
            self.imageView.image = [UIImage imageNamed:img];
        }
        
    }

}

@end
