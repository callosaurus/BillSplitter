//
//  ViewController.m
//  Bill Splitter
//
//  Created by Callum Davies on 2017-02-19.
//  Copyright © 2017 Callum Davies. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *billAmount;
@property (weak, nonatomic) IBOutlet UISlider *numberOfPeople;
@property (weak, nonatomic) IBOutlet UILabel *splitAmount;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)calculateSplitAmount:(UIButton *)sender {
    NSDecimalNumber *billAmountAsNumber = [[NSDecimalNumber alloc] initWithString:self.billAmount.text];
    
    NSDecimalNumber *numberOfPeopleAsNumber = [[NSDecimalNumber alloc] initWithFloat:roundf(self.numberOfPeople.value)];
    
    NSDecimalNumber *convertedNumber = [billAmountAsNumber decimalNumberByDividingBy: numberOfPeopleAsNumber];
    
    NSNumberFormatter *formatter = [NSNumberFormatter new];
    [formatter setNumberStyle:NSNumberFormatterCurrencyStyle];
    
    self.splitAmount.text = [NSString stringWithFormat:@"%@", [formatter stringFromNumber:convertedNumber]];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
