//
//  Sorter.m
//  Sorter
//
//  Created by whoami on 2/26/17.
//  Copyright © 2017 Mountain Viewer. All rights reserved.
//

#import "Sorter.h"
#import <QuartzCore/QuartzCore.h>

#include <stdlib.h>

@implementation Sorter

- (void) setData:(NSMutableArray *)data {
  _data = data;
}

- (NSMutableArray *) data {
  return _data;
}

- (void) shuffleData {
  // Maintain two parts: the left part is shuffled, the right is for choosing next element
  for (int i = 0; i < [_data count]; ++i) {
    int randomIndex = arc4random() % ([_data count] - i) + i;
    
    id tmp = [_data objectAtIndex: i];
    [_data replaceObjectAtIndex: i withObject: [_data objectAtIndex: randomIndex]];
    [_data replaceObjectAtIndex: randomIndex withObject: tmp];
  }
}

- (void) quickSort {
  
}

- (void) mergeSortWithParameters: (int) left
                     rightBorder: (int) right {
  
}

- (void) mergeSort {
  [self mergeSortWithParameters: 0 rightBorder: (int)[_data count]];
}

- (void) heapSort {
  
}

- (void) selectionSort {
  for (int i = 0; i < [_data count]; ++i) {
    int min_idx = i;
    for (int j = i + 1; j < [_data count]; ++j) {
      if ([_data objectAtIndex: j] < [_data objectAtIndex: min_idx]) {
        min_idx = j;
      }
    }
    [_data exchangeObjectAtIndex: min_idx withObjectAtIndex: i];
  }
}

- (void) bubbleSort {
  for (int i = 0; i < [_data count]; ++i) {
    for (int j = 0; j < [_data count] - 1; ++j) {
      if ([_data objectAtIndex: j] > [_data objectAtIndex: j + 1]) {
        id tmp = [_data objectAtIndex: j + 1];
        [_data replaceObjectAtIndex: j + 1 withObject: [_data objectAtIndex: j]];
        [_data replaceObjectAtIndex: j withObject: tmp];
      }
    }
  }
}

- (void) insertionSort {
  for (int i = 1; i < [_data count]; ++i) {
    int zip = i - 1;
    id currentElement = [_data objectAtIndex: i];
    while (zip >= 0 && [_data objectAtIndex: zip] > currentElement) {
      [_data replaceObjectAtIndex: zip + 1 withObject: [_data objectAtIndex: zip]];
      zip -= 1;
    }
    
    [_data replaceObjectAtIndex: zip + 1 withObject: currentElement];
  }
}

- (CFTimeInterval) time {
  return CACurrentMediaTime();
}

@end
