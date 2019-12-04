#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>
#import <PDFKit/PDFKit.h>

#import "RNPdfReaderManager.h"

#if __has_include(<React/RCTAssert.h>)
#import <React/RCTUtils.h>
#else
#import "React/RCTUtils.h"
#endif



@implementation RNPdfReaderManager {
    BOOL scrollToEnd;
}


RCT_EXPORT_MODULE(RNPdfReader)


+(BOOL)requiresMainQueueSetup {
    return YES;
}


-(UIView *)view API_AVAILABLE(ios(11.0)) {
    
    if (@available(iOS 11.0, *)) {
        PDFView *pdfView = [[PDFView alloc] initWithFrame:[[UIScreen mainScreen]bounds]];
        pdfView.displayMode = kPDFDisplaySinglePageContinuous;
        pdfView.autoScales = YES;
        pdfView.displaysPageBreaks = YES;
        pdfView.displayBox = kPDFDisplayBoxCropBox;
        
        if (@available(iOS 12.0, *)) {
            pdfView.pageShadowsEnabled = YES;
        }
        
        return pdfView;
        
    } else {
        UIWebView *webView = [[UIWebView alloc] initWithFrame:[[UIScreen mainScreen]bounds]];
        webView.delegate = self;
        return webView;
    }
}

- (void)loadPdf:(NSString *)localUri forView:(PDFView *)view  API_AVAILABLE(ios(11.0)) {
    NSURL *targetURL = [NSURL fileURLWithPath:localUri];
    view.document = [[PDFDocument alloc] initWithURL:targetURL];
    
    if (scrollToEnd) {
        [view goToLastPage:nil];
    }
}


-(void)loadWebPdf:(NSString *)localUri forView:(UIWebView *)view {
    NSURL *targetURL = [NSURL URLWithString:localUri];
    NSURLRequest *request = [NSURLRequest requestWithURL:targetURL];
    [view loadRequest:request];
    [view setScalesPageToFit:YES];
}


- (void)webViewDidFinishLoad:(UIWebView *)webView {
    if (scrollToEnd) {
        float pageHeight = 0;
        float lastPage = 0;
        
        NSArray* a = [webView.scrollView subviews];
        for (UIView* view in a) {
            if ([view isKindOfClass:NSClassFromString(@"UIWebPDFView")]) {
                NSArray* b = view.subviews;
                pageHeight = view.bounds.size.height;
                lastPage = b.count;
            }
        }
        
        [webView.scrollView setContentOffset:CGPointMake(0, (lastPage-1)*(pageHeight*1.0 /lastPage)) animated:YES];
    }
}


RCT_CUSTOM_VIEW_PROPERTY(srcLastPage, NSString, UIView) API_AVAILABLE(ios(11.0)) {
    if (@available(iOS 11.0, *)) {
        scrollToEnd = true;
        [self loadPdf:json forView:(PDFView *)view];
    } else {
        scrollToEnd = true;
        [self loadWebPdf:json forView:(UIWebView *)view];
    }
}


RCT_CUSTOM_VIEW_PROPERTY(src, NSString, UIView) API_AVAILABLE(ios(11.0)) {
    if (@available(iOS 11.0, *)) {
        [self loadPdf:json forView:(PDFView *)view];
    } else {
        [self loadWebPdf:json forView:(UIWebView *)view];
    }
}

@end
