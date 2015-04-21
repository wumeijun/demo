//
//  ViewController.m
//  View Switch
//
//  Created by Maggie on 15/3/19.
//  Copyright (c) 2015年 Maggie. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()
@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.button = [[UIButton alloc]initWithFrame:CGRectMake(200, 200, 100, 50)];
     self.button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.button addTarget:self action:@selector(clicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.button setTitle:@" run " forState:UIControlStateNormal];
    self.button.backgroundColor = [UIColor brownColor];
    [self.view addSubview:self.button];
    
    //禁止自动转换AutoresizingMask
    
    self.button.translatesAutoresizingMaskIntoConstraints = NO;
    //居中
    
    [self.view addConstraint:[NSLayoutConstraint
                              
                              constraintWithItem:self.button
                              
                              attribute:NSLayoutAttributeCenterX
                              
                              relatedBy:NSLayoutRelationEqual
                              
                              toItem:self.view
                              
                              attribute:NSLayoutAttributeCenterX
                              
                              multiplier:1
                              
                              constant:0]];
    
    
    //定义高度是父View的三分之一
    
    [self.view addConstraint:[NSLayoutConstraint
                              
                              constraintWithItem:self.button

                              
                              attribute:NSLayoutAttributeHeight
                              
                              relatedBy:NSLayoutRelationEqual
                              
                              toItem:self.view
                              
                              attribute:NSLayoutAttributeHeight
                              
                              multiplier:0.3
                              
                              constant:0]];
    
    


}

- (NSDictionary *)mapedParams:(NSString *)url
{
    NSMutableDictionary *result1 = [NSMutableDictionary new];
    NSArray *array=[url componentsSeparatedByString:@"?"];
    NSString *str1 = array[1];
    NSArray *keyValues = [str1 componentsSeparatedByString:@"&"];
    for(NSString *str2 in keyValues){
        NSArray *array2=[str2 componentsSeparatedByString:@"="];

        [result1 setValue:[array2 objectAtIndex:1] forKey: [array2 objectAtIndex:0]];
        continue;
    }
    NSLog(@"string:%@",result1);
    return result1;
}

- (NSDictionary *)mapedParams2:(NSString *)url
{
    NSArray *array=[url componentsSeparatedByString:@"?"];
    NSString *string = array[1];

    NSScanner *scanner = [NSScanner scannerWithString:string];
    scanner.charactersToBeSkipped = [NSCharacterSet whitespaceCharacterSet];
    
    NSMutableDictionary *result = [NSMutableDictionary dictionary];
    NSCharacterSet *CharacterSet = [NSCharacterSet characterSetWithCharactersInString:@"=&"];
    NSMutableArray *keyValues = [[NSMutableArray alloc]init];

    while (!scanner.isAtEnd) {
    
        NSString *location;
          if([scanner scanUpToCharactersFromSet:CharacterSet intoString:&location]){
                [keyValues addObject:location];
            }
        if([scanner scanString:@"=" intoString:NULL] || [scanner scanString:@"&" intoString:NULL]);
    }
    for(int i=0 ; i<keyValues.count ;i++){
        NSString *key = keyValues[i];
        NSString *value = keyValues[i+1];
        [result setValue:value forKey:key];

        i++;
    }
    
    NSLog (@"%@",result);
    NSLog (@"%@",keyValues);
    return result;
}

- (NSDictionary *)mapedParams3:(NSString *)url
{
    NSCharacterSet* delimiterSet = [NSCharacterSet characterSetWithCharactersInString:@"&;"];
    NSMutableDictionary* pairs = [NSMutableDictionary dictionary];
    NSScanner* scanner = [[NSScanner alloc] initWithString:url];
    
    [scanner scanUpToString:@"?" intoString:NULL];
    [scanner scanString:@"?" intoString:NULL];
    
    while (![scanner isAtEnd]) {
        NSString* pairString = nil;
        [scanner scanUpToCharactersFromSet:delimiterSet intoString:&pairString];
        [scanner scanCharactersFromSet:delimiterSet intoString:NULL];
        NSArray* kvPair = [pairString componentsSeparatedByString:@"="];
        if (kvPair.count == 2) {
            NSString* key = [kvPair objectAtIndex:0];
            NSString* value = [kvPair objectAtIndex:1];
            [pairs setValue:value forKey:key];
        }
    }
    return [NSDictionary dictionaryWithDictionary:pairs];
}



-(void)clicked:(id)sender{
    NSString *testURL = @"http://xiaojun.com/?ae3&bbb=12&rrrc=66";

    NSDictionary *result = [self mapedParams3:testURL];
//    NSAssert([result[@"ae3"] isEqualToString:@"123"], @"ae3 must equal 123");
    NSAssert([result[@"bbb"] isEqualToString:@"12"], @"bbb must equal 12");
    NSAssert([result[@"rrrc"] isEqualToString:@"66"], @"rrrc must equal 66");
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"成功" message:@"成功" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:@"", nil];
    [alert show];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
