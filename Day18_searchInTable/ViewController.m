//
//  ViewController.m
//  Day18_searchInTable
//
//  Created by Student 12 on 3/21/17.
//  Copyright © 2017 Felix. All rights reserved.
//

#import "ViewController.h"
#import "myTableView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.searchText.delegate=self;
    self.myTableView.delegate=self;
    self.myTableView.dataSource=self;
    
    self.namelist=[NSArray arrayWithObjects:@"Shruti",@"Riya",@"Siya", nil];
    self.phonelist=[NSArray arrayWithObjects:@"0207649387",@"923476958",@"9857498265", nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(self.resultAray.count<=0)
    {
        return self.namelist.count;
    }
    else
        return self.resultAray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    myTableView *cell=[tableView dequeueReusableCellWithIdentifier:@"mycell"];
    NSString *name, *number;
    if (self.resultAray.count<=0) {
        name=[self.namelist objectAtIndex:indexPath.row];
        number=[self.phonelist objectAtIndex:indexPath.row];
    }
    else{
        name=[self.resultAray objectAtIndex:indexPath.row];
        number=[self.phonelist objectAtIndex:indexPath.row];
    }
    cell.nameText.text=name;
    cell.numText.text=number;
    return cell;
}


- (IBAction)searchAction:(id)sender {
    
    UITextField *search=sender;
    if (search==self.searchText && self.searchText.text.length>0){
        NSPredicate *searchPredicate=[NSPredicate predicateWithFormat:@"SELF Contains[c]%@",search];
        NSLog(@"%@",searchPredicate);
        self.resultAray=[self.namelist filteredArrayUsingPredicate:searchPredicate];
        [self.myTableView reloadData];
        NSLog(@"%@",self.resultAray);

    }
    
}

-(bool)textFieldShouldReturn:(UITextField *)textField{
    
    NSString *search=textField.text;
    if(textField==self.searchText && self.searchText.text.length>0)
    {
        NSPredicate *searchPredicate=[NSPredicate predicateWithFormat:@"SELF Contains[c]%@",search];
        NSLog(@"%@",searchPredicate);
        self.resultAray=[self.namelist filteredArrayUsingPredicate:searchPredicate];
        
        [self.myTableView reloadData];
        NSLog(@"%@",self.resultAray);
        
    }
    return YES;
}
-(void)showMyAlertWithTitle:(NSString *)Title andMessage:(NSString *)Message
{
    UIAlertController *alert=[UIAlertController alertControllerWithTitle: Title message: Message preferredStyle: UIAlertControllerStyleAlert];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        nil;
    }];
    
    UIAlertAction *cancelAction=[UIAlertAction actionWithTitle:@"cancel" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        nil;
    }];
    
    [alert addAction:okAction];
    [alert addAction:cancelAction];
    
    [self presentViewController:alert animated:YES completion:^{
        nil;
    }];
    
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self showMyAlertWithTitle:self.title andMessage:@"Hi How r u?"];
}

@end
