//
//  NetWork.m
//  Health
//
//  Created by yuntu on 14-4-3.
//  Copyright (c) 2014年 yutu. All rights reserved.
//

#import "NetWork.h"
#import "LMDateArray.h"
#import "JSON.h"
#import "JSONKit.h"
#import "LMData.h"
@implementation NetWork
+(void)sendUserData:(void (^)(NSDictionary *))completeblock
{
    NSString* strURL=[NSString stringWithFormat:@"%@saveuserinfo.ashx",API];//上传数据
    NSURL* url=[NSURL URLWithString:strURL];
    //ASIHTTPRequest* request=[ASIHTTPRequest requestWithURL:url];
    NSLog(@"输出网址%@",strURL);
    NSArray *postArray=[PostData sendUserData];//科普知识
    ASIHTTPRequest * requests = [ASIHTTPRequest requestWithURL:url];
    requests.tag=102;
    NSString *jsonString = [LMDateArray dataJson:postArray];
    NSLog(@"请求内容%@",jsonString);
    [requests setRequestMethod:@"POST"];
    [requests setResponseEncoding:NSUTF8StringEncoding];
    if (jsonString) {
        [requests appendPostData:[jsonString dataUsingEncoding:NSUTF8StringEncoding]];
    }
    [NetWork asy_request:requests dataHandleBlock:^(ASIHTTPRequest * requestBlock){
        if ( nil != requestBlock.error )
        {
            dispatch_async(dispatch_get_main_queue(), ^{
                completeblock(nil);
            });
        }
        
        NSDictionary *dict = [requestBlock.responseString objectFromJSONString];
        NSMutableDictionary *newDict = [NSMutableDictionary dictionary];
        
        NSLog(@"dict = %@",dict);
        //NSDictionary *arrayDict=[[dict objectForKey:@"data"] JSONValue];
        NSString *stringDict=[dict objectForKey:@"data"];
        NSDictionary *dictID = [stringDict objectFromJSONString];
        NSString *stringMessage=[dict objectForKey:@"message"];
        if ( 1 == [[dict objectForKey:@"result"] intValue] && [dict isKindOfClass:[NSDictionary class]])
        {
            newDict =[NSMutableDictionary dictionaryWithObjectsAndKeys:@"1",@"success",dictID,@"data", nil];
        }else
        {
            newDict =[NSMutableDictionary dictionaryWithObjectsAndKeys:@"0",@"success",stringMessage,@"message", nil];
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            
            completeblock(newDict);
            
        });
    }];
}
+(void)getHistoryData:(void (^)(NSDictionary *))completeblock
{
    NSString* strURL=[NSString stringWithFormat:@"%@gettestrecord.ashx",API];//上传数据
    NSURL* url=[NSURL URLWithString:strURL];
    //ASIHTTPRequest* request=[ASIHTTPRequest requestWithURL:url];
    NSLog(@"输出网址%@",strURL);
    NSArray *postArray=[PostData getHistoryData];//历史数据
    ASIHTTPRequest * requests = [ASIHTTPRequest requestWithURL:url];
    requests.tag=103;
    NSString *jsonString = [LMDateArray dataJson:postArray];
    NSLog(@"请求内容%@",jsonString);
    [requests setRequestMethod:@"POST"];
    [requests setResponseEncoding:NSUTF8StringEncoding];
    if (jsonString) {
        [requests appendPostData:[jsonString dataUsingEncoding:NSUTF8StringEncoding]];
    }
    [NetWork asy_request:requests dataHandleBlock:^(ASIHTTPRequest * requestBlock){
        if ( nil != requestBlock.error )
        {
            dispatch_async(dispatch_get_main_queue(), ^{
                completeblock(nil);
            });
        }
        
        NSDictionary *dict = [requestBlock.responseString objectFromJSONString];
        NSMutableDictionary *newDict = [NSMutableDictionary dictionary];
        
        NSLog(@"dict = %@",dict);
        NSArray *array=[[dict objectForKey:@"data"] JSONValue];
        NSMutableArray *attayNew=[LMData dataAnalysisArray:@"HistoryModel" andArray:array];
        NSString *stringMessage=[dict objectForKey:@"message"];
        if ( 1 == [[dict objectForKey:@"result"] intValue] && [dict isKindOfClass:[NSDictionary class]])
        {
            newDict =[NSMutableDictionary dictionaryWithObjectsAndKeys:@"1",@"success",attayNew,@"data", nil];
        }else
        {
            newDict =[NSMutableDictionary dictionaryWithObjectsAndKeys:@"0",@"success",stringMessage,@"message", nil];
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            
            completeblock(newDict);
            
        });
    }];
}
//将自我测试结果上传给服务器
+(void)sendMytextResultData:(void (^)(NSDictionary *))completeblock
{
    NSString* strURL=[NSString stringWithFormat:@"%@savetest.ashx",API];//上传数据
    NSURL* url=[NSURL URLWithString:strURL];
    //ASIHTTPRequest* request=[ASIHTTPRequest requestWithURL:url];
    NSLog(@"输出网址%@",strURL);
    NSArray *postArray=[PostData resuleMyDataAndType:@"2"];//历史数据
    ASIHTTPRequest * requests = [ASIHTTPRequest requestWithURL:url];
    requests.tag=103;
    NSString *jsonString = [LMDateArray dataJson:postArray];
    NSLog(@"请求内容%@",jsonString);
    [requests setRequestMethod:@"POST"];
    [requests setResponseEncoding:NSUTF8StringEncoding];
    if (jsonString) {
        [requests appendPostData:[jsonString dataUsingEncoding:NSUTF8StringEncoding]];
    }
    [NetWork asy_request:requests dataHandleBlock:^(ASIHTTPRequest * requestBlock){
        if ( nil != requestBlock.error )
        {
            dispatch_async(dispatch_get_main_queue(), ^{
                completeblock(nil);
            });
        }
        NSDictionary *dict = [requestBlock.responseString objectFromJSONString];
        NSMutableDictionary *newDict = [NSMutableDictionary dictionary];
        
        NSLog(@"dict = %@",dict);
        NSString *stringid=[dict objectForKey:@"data"];
        NSDictionary *attayNew=[stringid objectFromJSONString];
        NSString *stringMessage=[dict objectForKey:@"message"];
        if ( 1 == [[dict objectForKey:@"result"] intValue] && [dict isKindOfClass:[NSDictionary class]])
        {
            newDict =[NSMutableDictionary dictionaryWithObjectsAndKeys:@"1",@"success",attayNew,@"data", nil];
        }else
        {
            newDict =[NSMutableDictionary dictionaryWithObjectsAndKeys:@"0",@"success",stringMessage,@"message", nil];
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            
            completeblock(newDict);
            
        });
    }];
}
//将生活质量测试上传给服务器
+(void)sendLifetextResultData:(void (^)(NSDictionary *))completeblock
{
    NSString* strURL=[NSString stringWithFormat:@"%@savetest.ashx",API];//上传数据
    NSURL* url=[NSURL URLWithString:strURL];
    //ASIHTTPRequest* request=[ASIHTTPRequest requestWithURL:url];
    NSLog(@"输出网址%@",strURL);
    NSArray *postArray=[PostData resuleLifeDataAndType:@"1"];//历史数据
    ASIHTTPRequest * requests = [ASIHTTPRequest requestWithURL:url];
    requests.tag=103;
    NSString *jsonString = [LMDateArray dataJson:postArray];
    NSLog(@"请求内容%@",jsonString);
    [requests setRequestMethod:@"POST"];
    [requests setResponseEncoding:NSUTF8StringEncoding];
    if (jsonString) {
        [requests appendPostData:[jsonString dataUsingEncoding:NSUTF8StringEncoding]];
    }
    [NetWork asy_request:requests dataHandleBlock:^(ASIHTTPRequest * requestBlock){
        if ( nil != requestBlock.error )
        {
            dispatch_async(dispatch_get_main_queue(), ^{
                completeblock(nil);
            });
        }
        
        NSDictionary *dict = [requestBlock.responseString objectFromJSONString];
        NSMutableDictionary *newDict = [NSMutableDictionary dictionary];
        
        NSLog(@"dict = %@",dict);
        NSString *stringid=[dict objectForKey:@"data"];
        NSDictionary *attayNew=[stringid objectFromJSONString];
        NSString *stringMessage=[dict objectForKey:@"message"];
        if ( 1 == [[dict objectForKey:@"result"] intValue] && [dict isKindOfClass:[NSDictionary class]])
        {
            newDict =[NSMutableDictionary dictionaryWithObjectsAndKeys:@"1",@"success",attayNew,@"data", nil];
        }else
        {
            newDict =[NSMutableDictionary dictionaryWithObjectsAndKeys:@"0",@"success",stringMessage,@"message", nil];
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            
            completeblock(newDict);
            
        });
    }];

}
+(void)getScienceData:(void (^)(NSDictionary *))completeblock
{
    NSString* strURL=[NSString stringWithFormat:@"%@getintroduction.ashx",API];//上传数据
    NSURL* url=[NSURL URLWithString:strURL];
    //ASIHTTPRequest* request=[ASIHTTPRequest requestWithURL:url];
    NSLog(@"输出网址%@",strURL);
    NSArray *postArray=[PostData productDataAndType:@"1"];//科普知识
    ASIHTTPRequest * requests = [ASIHTTPRequest requestWithURL:url];
    requests.tag=101;
    NSString *jsonString = [LMDateArray dataJson:postArray];
    NSLog(@"请求内容%@",jsonString);
    [requests setRequestMethod:@"POST"];
    [requests setResponseEncoding:NSUTF8StringEncoding];
    if (jsonString) {
        [requests appendPostData:[jsonString dataUsingEncoding:NSUTF8StringEncoding]];
    }
    [NetWork asy_request:requests dataHandleBlock:^(ASIHTTPRequest * requestBlock){
        if ( nil != requestBlock.error )
        {
            dispatch_async(dispatch_get_main_queue(), ^{
                completeblock(nil);
            });
        }
        
        NSDictionary *dict = [requestBlock.responseString objectFromJSONString];
        NSMutableDictionary *newDict = [NSMutableDictionary dictionary];
        
        NSLog(@"dict = %@",dict);
        NSDictionary *arrayDict=[[dict objectForKey:@"data"] JSONValue];
       // NSString *stringDict=[dict objectForKey:@"data"];
        NSMutableArray *attayNew=[LMData dataAnalysisDictionary:@"ScienceModel" andDictionry:arrayDict];
        NSString *stringMessage=[dict objectForKey:@"message"];
        if ( 1 == [[dict objectForKey:@"result"] intValue] && [dict isKindOfClass:[NSDictionary class]])
        {
            newDict =[NSMutableDictionary dictionaryWithObjectsAndKeys:@"1",@"success",attayNew,@"data", nil];
        }else
        {
            newDict =[NSMutableDictionary dictionaryWithObjectsAndKeys:@"0",@"success",stringMessage,@"message", nil];
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            
            completeblock(newDict);
            
        });
    }];
}
+(void)getProductData:(void(^)(NSDictionary *))completeblock
{
    NSString* strURL=[NSString stringWithFormat:@"%@getintroduction.ashx",API];//上传数据
    NSURL* url=[NSURL URLWithString:strURL];
    //ASIHTTPRequest* request=[ASIHTTPRequest requestWithURL:url];
    NSLog(@"输出网址%@",strURL);
    NSArray *postArray=[PostData productDataAndType:@"2"];//产品介绍
    ASIHTTPRequest * requests = [ASIHTTPRequest requestWithURL:url];
    requests.tag=101;
    NSString *jsonString = [LMDateArray dataJson:postArray];
    NSLog(@"请求内容%@",jsonString);
    [requests setRequestMethod:@"POST"];
    [requests setResponseEncoding:NSUTF8StringEncoding];
    if (jsonString) {
        [requests appendPostData:[jsonString dataUsingEncoding:NSUTF8StringEncoding]];
    }
    [NetWork asy_request:requests dataHandleBlock:^(ASIHTTPRequest * requestBlock){
        if ( nil != requestBlock.error )
        {
            dispatch_async(dispatch_get_main_queue(), ^{
                completeblock(nil);
            });
        }
        
        NSDictionary *dict = [requestBlock.responseString objectFromJSONString];
        NSMutableDictionary *newDict = [NSMutableDictionary dictionary];
        
        NSLog(@"dict = %@",dict);
        NSDictionary *arrayDict=[[dict objectForKey:@"data"] JSONValue];
        // NSString *stringDict=[dict objectForKey:@"data"];
        NSMutableArray *attayNew=[LMData dataAnalysisDictionary:@"ScienceModel" andDictionry:arrayDict];
        NSString *stringMessage=[dict objectForKey:@"message"];
        if ( 1 == [[dict objectForKey:@"result"] intValue] && [dict isKindOfClass:[NSDictionary class]])
        {
            newDict =[NSMutableDictionary dictionaryWithObjectsAndKeys:@"1",@"success",attayNew,@"data", nil];
        }else
        {
            newDict =[NSMutableDictionary dictionaryWithObjectsAndKeys:@"0",@"success",stringMessage,@"message", nil];
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            
            completeblock(newDict);
            
        });
    }];
}
+ (void)asy_request:(ASIHTTPRequest *)request dataHandleBlock:(void(^)(ASIHTTPRequest *))dataHandleBlock
{
    __weak ASIHTTPRequest *bRequest = request;
    dispatch_async(kBgQueue, ^{
        [bRequest startSynchronous];
        dataHandleBlock(request);
    });
}
@end
