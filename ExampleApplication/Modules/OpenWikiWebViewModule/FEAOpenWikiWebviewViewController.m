//
// Created by Aleksander Balicki on 13/02/14.
// Copyright (c) 2014 Wikia. All rights reserved.
//
//


#import "FEAOpenWikiWebviewViewController.h"


@interface FEAOpenWikiWebviewViewController ()

@property(nonatomic, copy) NSString *url;

@end

@implementation FEAOpenWikiWebviewViewController {

}
- (instancetype)initWithURL:(NSString *)string {
    self = [super init];
    if (self) {
        self.url = string;
    }
    
    return self;
}

- (void)loadView {
    self.view = [[UIView alloc] initWithFrame:CGRectZero];
    self.view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    UIWebView *webView = [[UIWebView alloc] initWithFrame:CGRectZero];
    webView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:webView];

    [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.url]]];
}

@end