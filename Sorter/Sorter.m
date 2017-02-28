//
//  Sorter.m
//  Sorter
//
//  Created by whoami on 2/26/17.
//  Copyright © 2017 Mountain Viewer. All rights reserved.
//

#import "Sorter.h"
#import <QuartzCore/QuartzCore.h>
#import "Heap.h"

#include <stdlib.h>

@implementation Sorter

- (NSString *) description {
  return [[NSString alloc] initWithFormat: @"The sorter instance holds %@ data array", _data];
}

- (instancetype) initWithData:(NSMutableArray *)data {
  self = [super init];
  
  
  if (self) {
    _data = data;
  }
  
  return self;
}

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

- (void) quickSortWithParameters: (int) left
                     rightBorder: (int) right {
  if (right - left < 1) {
    return;
  }
  
  int pivot_idx = arc4random() % (right - left + 1) + left;
  id pivot = [_data objectAtIndex: pivot_idx];
  
  int low = left;
  int high = right;
  
  while (low <= high) {
    while ([_data objectAtIndex: low] < pivot) {
      low += 1;
    }
    
    while ([_data objectAtIndex: high] > pivot) {
      high -= 1;
    }
    
    if (low <= high) {
      [_data exchangeObjectAtIndex: low withObjectAtIndex: high];
      low += 1;
      high -= 1;
    }
  }
  
  [self quickSortWithParameters: left rightBorder: high];
  [self quickSortWithParameters: low rightBorder: right];
}

- (void) quickSort {
  [self quickSortWithParameters: 0 rightBorder: (int) [_data count] - 1];
}

- (void) mergeSortWithParameters: (int) left
                     rightBorder: (int) right {
  
  if (right - left < 1) {
    return;
  }
  
  int middle = (left + right) / 2;
  
  [self mergeSortWithParameters: left rightBorder: middle];
  [self mergeSortWithParameters: middle + 1 rightBorder: right];
  
  NSMutableArray *auxiliaryArray = [[NSMutableArray alloc] init];
  
  int ptr1 = 0;
  int ptr2 = 0;
  
  while (ptr1 + left <= middle && ptr2 + middle + 1 <= right) {
    if ([_data objectAtIndex: ptr1 + left] < [_data objectAtIndex: ptr2 + middle + 1]) {
      [auxiliaryArray addObject: [_data objectAtIndex: ptr1 + left]];
      ptr1 += 1;
    } else if ([_data objectAtIndex: ptr1 + left] > [_data objectAtIndex: ptr2 + middle + 1]) {
      [auxiliaryArray addObject: [_data objectAtIndex: ptr2 + middle + 1]];
      ptr2 += 1;
    }
  }
  
  while (ptr1 + left <= middle) {
    [auxiliaryArray addObject: [_data objectAtIndex: ptr1 + left]];
    ptr1 += 1;
  }
  
  while (ptr2 + middle + 1 <= right) {
    [auxiliaryArray addObject: [_data objectAtIndex: ptr2 + middle + 1]];
    ptr2 += 1;
  }
  
  for (int i = left; i <= right; ++i) {
    [_data replaceObjectAtIndex: i withObject: [auxiliaryArray objectAtIndex: i - left]];
  }
}

- (void) mergeSort {
  [self mergeSortWithParameters: 0 rightBorder: (int)[_data count] - 1];
}

- (void) heapSort {
  Heap *heap = [[Heap alloc] init];
  
  NSMutableArray *auxiliary = [[NSMutableArray alloc] init];
  [heap setTree: auxiliary];
  
  for (id elem in _data) {
    [heap pushElement: elem];
  }
  
  for (int i = 0; i < [_data count]; ++i) {
    [_data replaceObjectAtIndex: i withObject: [heap extractMinimum]];
  }
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
