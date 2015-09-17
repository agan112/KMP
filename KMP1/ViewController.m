//
//  ViewController.m
//  KMP1
//
//  Created by mac on 15/9/17.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    char *s="acabaabaabcqacaabc";
    char *p="abaabcac";
    int index=getPiPerIndex(s, p);
    printf("index is :%d",index);
}


void getNext(const char *p,int *next){
    int j=0,k=-1;
    int length=(int)strlen(p);
    next[0]=-1;
    for (; j<length-1; ) {
        if (k==-1||p[j]==p[k]) {
            k++;j++;
           
            next[j]=k;
        }
        else
            k=next[k];
    }
    
}



int getPiPerIndex(char *s,char *p){
    int pLength=(int)strlen(p);
    int sLength=(int)strlen(s);
    int j=-1,t=-1;
    
    int next[pLength];
    getNext(p, next);
    
    for (; t<sLength; ) {
        if (j==-1||p[j]==s[t]) {
            j++;
            t++;
            if (j==pLength)
                break;
            
        }else
            j=next[j];
    }
    if (j==pLength)
        return t-j;
    else
        return -1;
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

@end
