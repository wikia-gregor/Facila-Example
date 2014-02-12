//
// Created by Aleksander Balicki on 10/02/14.
// Copyright (c) 2014 Wikia. All rights reserved.
//
//


#import <Facila/FacilaDispatcher.h>
#import "FEAWikiListViewController.h"
#import "FEAAppDelegate.h"


static NSString *const identifier = @"cell";

@interface FEAWikiListViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *wikis;

@end

@implementation FEAWikiListViewController {

}

- (void)loadView { 
    self.view = [[UIView alloc] initWithFrame:CGRectZero];
    self.view.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
}

- (void)viewDidLoad {

    self.title = @"Wiki List";

    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero];
    self.tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    self.tableView.dataSource = self;
    self.tableView.delegate = self;


    [self loadData];

    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:identifier];
    [self.view addSubview:self.tableView];
}

- (void)loadData {

    NSURL *url = [[NSURL alloc] initWithString:@"http://www.wikia.com/api/v1/Wikis/List?hub=Gaming&lang=en&limit=25&batch=1"];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
    
    [NSURLConnection sendAsynchronousRequest:urlRequest queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        NSDictionary *responseDict = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
        self.wikis = responseDict[@"items"];
        [self.tableView reloadData];
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.wikis.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];

    cell.textLabel.text = self.wikis[(NSUInteger) indexPath.row][@"name"];

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    [((FEAAppDelegate *) [UIApplication sharedApplication].delegate).dispatcher callAction:@"openAboutWiki" withParams:@{@"id":self.wikis[(NSUInteger) indexPath.row][@"id"]}];

    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}

@end