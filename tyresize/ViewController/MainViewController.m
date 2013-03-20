//
//  MainViewController.m
//  tyresize
//
//  Created by meng qian on 13-3-8.
//  Copyright (c) 2013年 thinktube. All rights reserved.
//

#import "MainViewController.h"
#import "KBViewController.h"
#import "AppDelegate.h"

@interface MainViewController ()
@property(strong,nonatomic)UIImageView *tempImage;
@property(nonatomic, strong) UIButton *button1;
@property(strong, nonatomic)NSArray *PRMTIMPERIAL;
@property(strong, nonatomic)NSArray *PRMTMETIC;

@end


@implementation MainViewController
@synthesize managedObjectContext = _managedObjectContext;
@synthesize tempImage;
@synthesize button1;
@synthesize PRMTMETIC;
@synthesize PRMTIMPERIAL;



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
    self.title = T(@"tyresize");
    
    
    self.PRMTIMPERIAL = [NSArray arrayWithObjects:
                              T(@"Sidewall(in)"),
                              T(@"Radius(in)"),
                              T(@"Diamter(in)"),
                              T(@"Circumference(in)"),
                              T(@"Rotations/Mile"),
                              T(@"Speedo Diff(%)"),
                              T(@"Speed@60mph"),nil];
    
    self.PRMTMETIC = [[NSArray alloc]initWithObjects:
                             T(@"Sidewall(mm)"),
                             T(@"Radius(mm)"),
                             T(@"Diamter(mm)"),
                             T(@"Circumference(mm)"),
                             T(@"Rotations/KM"),
                             T(@"Speedo Diff(%)"),
                             T(@"Speed@100kph"), nil];
        
    for(int i = 0; i < [PRMTIMPERIAL count]; i++){
        UILabel *label = [[UILabel alloc]init];
        label.font = CUSTOMFONT;
        label.textColor = GREENCOLOR;
        label.text = [PRMTIMPERIAL objectAtIndex:i];
        [label setFrame:CGRectMake(20, 40 *i +20, 200, 30)];
        [self.view addSubview:label];
    }
    
    
    
    
    self.tempImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"tyresize2_zh.png"]];
    self.tempImage.frame = self.view.bounds;
//    [self.view addSubview:self.tempImage];
    
    //button1
    self.button1 = [UIButton buttonWithType:UIButtonTypeCustom];
    self.button1.frame = CGRectZero;
    [self.button1 setTitle:@"" forState:UIControlStateNormal];
    self.button1.alpha = 1;
    self.button1.tag = 0;
    [self.view addSubview:self.button1];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    self.tempImage.frame = CGRectMake(0, 0, 320, 460);
    [self.button1 setFrame:CGRectMake(90, 50, 135, 160)];
    [self.button1 addTarget:self action:@selector(linkAction:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:animated];

}

- (void)linkAction:(UIButton *)sender
{
    KBViewController *controller = [[KBViewController alloc]initWithNibName:nil bundle:nil];
    [self.navigationController pushViewController:controller animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (AppDelegate *)appDelegate
{
	return (AppDelegate *)[[UIApplication sharedApplication] delegate];
}


@end
