//
//  ViewController.m
//  MVCDemo
//
//  Created by yupao on 9/12/16.
//  Copyright © 2016 penoty. All rights reserved.
//

#import "ViewController.h"
#import "TableViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIWindow *mainWindow = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [mainWindow setTintColor:[UIColor whiteColor]];
    [[[UIApplication sharedApplication] delegate] setWindow:mainWindow];
    
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:[[TableViewController alloc] init]];
    [mainWindow setRootViewController:navigationController];
    [mainWindow makeKeyAndVisible];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
