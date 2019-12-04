package com.reactlibrary;

import com.facebook.react.uimanager.SimpleViewManager;
import com.facebook.react.uimanager.ThemedReactContext;
import com.facebook.react.uimanager.annotations.ReactProp;

import java.io.File;

import com.reactlibrary.RNPdfReaderView.OnAttachedToWindow;

public class RNPdfReaderManager extends SimpleViewManager<RNPdfReaderView> {

  private static final String REACT_CLASS = "RNPdfReader";

  @Override
  public String getName() {
    return REACT_CLASS;
  }

  @Override
  protected RNPdfReaderView createViewInstance(ThemedReactContext context) {
    return new RNPdfReaderView(context, null);
  }

  @ReactProp(name = "src")
  @SuppressWarnings("unused")
  public void setSrc(final RNPdfReaderView view, final String uri) {
    displayPdf(view, uri, false);
  }

  @ReactProp(name = "srcLastPage")
  @SuppressWarnings("unused")
  public void setSrcLastPage(final RNPdfReaderView view, final String uri) {
    displayPdf(view, uri, true);
  }

  private void displayPdf(final RNPdfReaderView view, final String uri, final boolean lastPage) {
    final String fileUri = uri.replace("file:", "");
    view.setOnAttachedToWindow(new OnAttachedToWindow() {
      @Override
      public void onAttachedToWindow() {
        // We do not know the document page number, and assume that there will not be a scan with 1000 pages or more
        int displayPage = lastPage? 1000 : 0;
        view.fromFile(new File(fileUri))
            .defaultPage(displayPage)
            .load();
      }
    });
  }
}