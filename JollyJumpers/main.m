//
//  main.m
//  JollyJumpers


#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSString *line = @"9 8 9 7 10 6 12 17 24 38";
        
        NSArray *sepArray = [line componentsSeparatedByString: @" "];
        
        NSInteger n = [[sepArray objectAtIndex:0] integerValue];
        
        NSMutableArray *absDifMutArray = [[NSMutableArray alloc]init];
        
        BOOL jolly = YES;
        
        // build array of abolute differences
        NSInteger i = 1;
        for (i = 1; i < sepArray.count - 1; i++) {
            NSInteger dif = [[sepArray objectAtIndex:i] integerValue] - [[sepArray objectAtIndex:i + 1] integerValue];
            // no abs() allowed
            if (dif < 0) {
                dif = -dif;
            }
            [absDifMutArray addObject:[NSString stringWithFormat:@"%ld", dif]];
        }
        NSLog(@"absDifMutArray: %@", absDifMutArray);
        
        // build n-1 target differences
        NSInteger j = 1;
        for (j = 1; j < n; j++) {
            NSLog(@"J : %ld", j);
            
            if (![absDifMutArray containsObject:[NSString stringWithFormat: @"%ld", j]]) {
                jolly = NO;
            }
        }
        
        // print findings
        if(jolly) {
            NSLog(@"Jolly");
        }
        else {
            NSLog(@"Not Jolly");
        }
        
        
    }
    return 0;
}
