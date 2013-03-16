//
//  KBViewController.m
//  tyresize
//
//  Created by meng qian on 13-3-8.
//  Copyright (c) 2013年 thinktube. All rights reserved.
//

#import "KBViewController.h"

@interface KBViewController ()
@property(strong, nonatomic)UIImageView *tempImage;
@end

@implementation KBViewController
@synthesize tempImage;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.title = @"轮胎知识";
    self.tempImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"tyresize.png"]];
    self.tempImage.frame = CGRectMake(0, 0, 320, 416);
    [self.view addSubview:self.tempImage];    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
