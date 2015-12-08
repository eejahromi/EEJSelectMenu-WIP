//
//  ViewController.m
//  EJSelectMenuExample
//
//  Created by Ehsan on 12/6/15.
//  Copyright © 2015 Ehsan Jahromi. All rights reserved.
//

#import "ViewController.h"
#import "EJSelectMenu.h"

// TODO: images on buttons
@interface ViewController () <EJSelectMenuDelegate>

@property (nonatomic,strong) EJSelectMenu *selectMenu;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}


- (IBAction)popUp4ButtonPressed:(UIButton *)sender {

    NSArray *buttonNames = @[@"one",@"two",@"three",@"four"];
    EJSelectMenu *pop = [[EJSelectMenu alloc]initWithButtons:buttonNames animationStyle:EJAnimationStyleScale andDelegate:self];
    [self presentViewController:pop animated:NO completion:nil];
}


@end
