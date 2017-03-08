//
//  ViewController.m
//  PWTableView
//
//  Created by Student P_08 on 16/12/16.
//  Copyright © 2016 Pallavi Wani. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSString *string = @"http://www.json-generator.com/api/json/get/ctILPMfuPS?indent=4";
    NSURL *url=[NSURL URLWithString:string];
    NSURLSession *session=[NSURLSession sharedSession];
    NSURLSessionDataTask *datatask=[session dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error){
        if(data !=nil)
        {
            NSError *error;
            array=[NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
            NSLog(@"%@",array);
            if ([array count]) {
                [_tblaction reloadData];
            }
        }else{
            NSLog(@"%@",error.localizedDescription);
        }
    }];
    
    [datatask resume];

}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
    return array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    NSString *string=@"btlcell";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"btlcell"];
    if(cell==nil)
    {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:string];
    }
    cell.textLabel.text=[[array objectAtIndex:indexPath.row]valueForKey:@"company"];
    cell.accessoryType=UITableViewCellAccessoryCheckmark;
    cell.imageView.image=[UIImage imageNamed:@"images2.jpg"];
    return cell;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
