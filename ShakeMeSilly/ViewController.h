//
//  ViewController.h
//  ShakeMeSilly
//
//  Created by John Daratzikis on 05/03/2017.
//  Copyright © 2017 ioannisdaratzikis. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController {

    NSTimer *timer;
    int time;
    int score;
    int mode;
    int image;

}

@property (weak, nonatomic) IBOutlet UILabel *timerLabel;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIButton *startButton;

- (IBAction)startGame:(id)sender;

@end

