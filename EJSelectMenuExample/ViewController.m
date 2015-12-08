//
//  ViewController.m
//  EJSelectMenuExample
//
//  Created by Ehsan on 12/6/15.
//  Copyright © 2015 Ehsan Jahromi. All rights reserved.
//

#import "ViewController.h"
#import "MenuViewController.h"
// TODO: name changes
// TODO: images on buttons
@interface ViewController () <EJMenuDelegate>

@property (nonatomic,strong) MenuViewController *selectMenu;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}


- (IBAction)popUp4ButtonPressed:(UIButton *)sender {
//    MenuViewController *menu = [[MenuViewController alloc]init];
//    menu.buttonNames = @[@"one",@"two",@"three",@"four"];
//    menu.delegate = self;
//    menu.animationStyle = AnimationStyleFadeIn;
    
    NSArray *buttonNames = @[@"one",@"two",@"three"];
    MenuViewController *pop = [[MenuViewController alloc]initWithButtons:buttonNames animationStyle:AnimationStyleAlternate andDelegate:self];
    [self presentViewController:pop animated:NO completion:nil];
}



@end
