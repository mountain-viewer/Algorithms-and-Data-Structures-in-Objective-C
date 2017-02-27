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
    
    NSLog(@"Shuffled array: %f time elapsed", finish - start);
    
    start = [sorter time];
    [sorter bubbleSort];
    finish = [sorter time];
    
    NSLog(@"Bubble-sorted array: %f time elapsed", finish - start);
    
    [sorter shuffleData];
    
    start = [sorter time];
    [sorter selectionSort];
    finish = [sorter time];
    
    NSLog(@"Selection-sorted array %f time elapsed", finish - start);
    
    [sorter shuffleData];
    
    start = [sorter time];
    [sorter insertionSort];
    finish = [sorter time];
    
    NSLog(@"Insertion-sorted array %f time elapsed", finish - start);
    
    [sorter shuffleData];
    
    start = [sorter time];
    [sorter mergeSort];
    finish = [sorter time];
    
    NSLog(@"Merge-sorted array %f time elapsed", finish - start);
    
    [sorter shuffleData];
    
    start = [sorter time];
    [sorter quickSort];
    finish = [sorter time];
    
    NSLog(@"Quick-sorted array %f time elapsed", finish - start);
    
    [sorter shuffleData];
    
    start = [sorter time];
    [sorter heapSort];
    finish = [sorter time];
    
    NSLog(@"Heap-sorted array %f time elapsed", finish - start);
  }
  return 0;
}
