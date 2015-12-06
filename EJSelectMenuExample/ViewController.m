//
//  ViewController.m
//  EJSelectMenuExample
//
//  Created by Ehsan on 12/6/15.
//  Copyright © 2015 Ehsan Jahromi. All rights reserved.
//

#import "ViewController.h"
#import "MenuViewController.h"

@interface ViewController () <EJMenuDelegate>

@property (nonatomic,strong) MenuViewController *selectMenu;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)popUp4ButtonPressed:(UIButton *)sender {
    MenuViewController *menu = [[MenuViewController alloc]init];
    NSArray *butttonNames = @[@"one",@"two",@"three",@"four"];
    menu.buttonNames = butttonNames;
    menu.delegate = self;
    
    [self presentViewController:menu animated:NO completion:nil];
}
@end
