//
//  YHBookDetailViewController.m
//  iBook
//
//  Created by zikeys on 2019/12/11.
//  Copyright © 2019 zikeys. All rights reserved.
//

#import "YHBookDetailViewController.h"

@interface YHBookDetailViewController ()

@property (nonatomic, copy) NSString *bookId;

@end

@implementation YHBookDetailViewController

- (instancetype)initWithBookID:(NSString *)bookId {
    
    self = [super init];
    if (self) {
        self.bookId = bookId;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

@end
