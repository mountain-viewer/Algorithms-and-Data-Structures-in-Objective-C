//
//  main.m
//  Sorter
//
//  Created by whoami on 2/26/17.
//  Copyright © 2017 Mountain Viewer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Sorter.h"

int main(int argc, const char * argv[]) {
  @autoreleasepool {
    NSMutableArray *array = [[NSMutableArray alloc] init];
    
    int n = 0;
    scanf("%d", &n);
    
    for (int i = 0; i < n; ++i) {
      [array addObject: [NSNumber numberWithInteger: (i + 1)]];
    }
    
    Sorter *sorter = [[Sorter alloc] init];
    
    [sorter setData: array];
    
    CFTimeInterval start = [sorter time];
    [sorter shuffleData];
    CFTimeInterval finish = [sorter time];
    
    NSLog(@"%f time elapsed", finish - start);
    NSLog(@"Shuffled array: %@", [sorter data]);
    
    start = [sorter time];
    [sorter bubbleSort];
    finish = [sorter time];
    
    NSLog(@"%f time elapsed", finish - start);
    NSLog(@"Bubble-sorted array: %@", [sorter data]);
    
    
    [sorter shuffleData];
    
    start = [sorter time];
    [sorter selectionSort];
    finish = [sorter time];
    
    NSLog(@"%f time elapsed", finish - start);
    NSLog(@"Selection-sorted array: %@", [sorter data]);
    
    
    [sorter shuffleData];
    
    start = [sorter time];
    [sorter insertionSort];
    finish = [sorter time];
    
    NSLog(@"%f time elapsed", finish - start);
    NSLog(@"Insertion-sorted array: %@", [sorter data]);
  }
  return 0;
}
