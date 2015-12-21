//
//  ViewController.m
//  EEJSelectMenuExample
//
//  Created by Ehsan on 12/6/15.
//  Copyright © 2015 Ehsan Jahromi. All rights reserved.
//

#import "ViewController.h"
#import "EEJSelectMenu.h"

@interface ViewController () <EJSelectMenuDelegate>

@property (nonatomic,strong) EEJSelectMenu *selectMenu;
@property (weak, nonatomic) IBOutlet UILabel *selectedLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (IBAction)popUp3Buttons:(UIButton *)sender {
    NSArray *buttonNames = @[@"ROCK",@"PAPER",@"SCISSORS",];
    EEJSelectMenu *pop = [[EEJSelectMenu alloc]init];
    pop.delegate = self;
    pop.buttonNames = buttonNames;
    [self presentViewController:pop animated:NO completion:nil];
}

- (IBAction)popUp4ButtonPressed:(UIButton *)sender {
    NSArray *buttonNames = @[@"COFFEE",@"DECAF",@"TEA",@"WATER"];
    EEJSelectMenu *pop = [[EEJSelectMenu alloc]initWithButtons:buttonNames animationStyle:EJAnimationStyleWiden andDelegate:self];
    [self presentViewController:pop animated:NO completion:nil];
}

- (IBAction)popUp5Buttons:(UIButton *)sender {
    NSArray *buttonNames = @[@"ONE",@"TWO",@"THREE",@"FOUR",@"FIVE"];
    EEJSelectMenu *pop = [[EEJSelectMenu alloc]initWithButtons:buttonNames animationStyle:EJAnimationStyleScale andDelegate:self];
    pop.selectedButtonColor = [UIColor redColor];
    [self presentViewController:pop animated:NO completion:nil];
}

- (IBAction)popUp5ButtonsFromLeft:(UIButton *)sender {
    NSArray *buttonNames = @[@"MONDAY",@"TUESDAY",@"WEDNESDAY",@"THURSDAY",@"FRIDAY"];
    EEJSelectMenu *pop = [[EEJSelectMenu alloc]initWithButtons:buttonNames animationStyle:EJAnimationStyleMoveInFromLeft andDelegate:self];
    [self presentViewController:pop animated:NO completion:nil];
}

- (IBAction)popUp6ButtonsFromRight:(UIButton *)sender {
    NSArray *buttonNames = @[@"ONE",@"TWO",@"THREE",@"FOUR",@"FIVE",@"SIX"];
    EEJSelectMenu *pop = [[EEJSelectMenu alloc]initWithButtons:buttonNames animationStyle:EJAnimationStyleMoveInFromRight andDelegate:self];
    pop.selectedButtonColor = [UIColor yellowColor];
    [self presentViewController:pop animated:NO completion:nil];
}

- (IBAction)popUp6ButtonsAlternate:(UIButton *)sender {
    NSArray *buttonNames = @[@"COKE",@"PEPSI",@"SPRITE",@"DR.PEPPER",@"FANTA",@"WATER"];
    EEJSelectMenu *pop = [[EEJSelectMenu alloc]initWithButtons:buttonNames animationStyle:EJAnimationStyleAlternate andDelegate:self];
    pop.selectedButtonColor = [UIColor greenColor];
    [self presentViewController:pop animated:NO completion:nil];

}

- (void)EJSelectMenuButtonWasPressedWithTitle:(NSString *)title {
    self.selectedLabel.text = title;
}

@end
