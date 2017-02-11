//
//  main.m
//  Algorithms
//
//  Created by whoami on 2/10/17.
//  Copyright © 2017 Mountain Viewer. All rights reserved.
//

#include <stdio.h>

#import <Foundation/Foundation.h>
#import "SegmentTree.h"

int main(int argc, const char * argv[]) {
  @autoreleasepool {
    NSMutableArray *data = [[NSMutableArray alloc] init];
    
    printf("Enter the number of elements: ");
    
    int elementsCount = 0;
    scanf("%d", &elementsCount);
    
    printf("\n");
    for (int i = 0; i < elementsCount; ++i) {
      printf("Enter the %d element: ", i + 1);
      
      int element = 0;
      scanf("%d", &element);
      
      NSNumber *number = [NSNumber numberWithInt: element];
      [data addObject: number];
    }
    printf("\n");
    
    printf("The whole array is: ");
    for (int i = 0; i < [data count]; ++i) {
      printf("%d ", [data[i] intValue]);
    }
    printf("\n\n");
    
    SegmentTree *segmentTree = [[SegmentTree alloc] init];
    [segmentTree setData: data];
    [segmentTree buildTree];
    
    printf("Enter the number of queries: ");
    
    int queriesCount = 0;
    scanf("%d", &queriesCount);
    printf("\n");
    
    while (queriesCount > 0) {
      printf("Enter the left and right borders for the query: ");
      
      int left = 0, right = 0;
      scanf("%d %d", &left, &right);
      
      left -= 1;
      right -= 1;
      
      Query query;
      initQuery(&query, left, right);
      
      printf("%lld\n", [segmentTree getSegmentSum: query]);
      queriesCount -= 1;
    }
  }
  return 0;
}
