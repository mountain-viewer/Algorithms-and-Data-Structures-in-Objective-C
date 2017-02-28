//
//  Sorter.h
//  Sorter
//
//  Created by whoami on 2/26/17.
//  Copyright © 2017 Mountain Viewer. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Sorter : NSObject {
  NSMutableArray *_data;
}

- (instancetype) initWithData: (NSMutableArray *) data;
- (NSString *) description;
- (void) setData: (NSMutableArray *) data;
- (NSMutableArray *) data;
- (void) shuffleData;
- (CFTimeInterval) time;

- (void) quickSort;
- (void) mergeSort;
- (void) heapSort;
- (void) insertionSort;
- (void) selectionSort;
- (void) bubbleSort;

@end
