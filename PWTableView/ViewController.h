//
//  ViewController.h
//  PWTableView
//
//  Created by Student P_08 on 16/12/16.
//  Copyright © 2016 Pallavi Wani. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ViewController : UIViewController<UITableViewDelegate ,UITableViewDataSource>
{
    
        NSArray *array;
    
}

@property (weak, nonatomic) IBOutlet UITableView *tblaction;


@end

