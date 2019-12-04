package com.reactlibrary;

import android.content.Context;
import android.util.AttributeSet;

import com.github.barteksc.pdfviewer.PDFView;

public class RNPdfReaderView extends PDFView {

  private OnAttachedToWindow onAttachedToWindow;

  public interface OnAttachedToWindow {
    void onAttachedToWindow();
  }

  public RNPdfReaderView(Context context, AttributeSet set) {
    super(context, set);
  }

  @Override
  protected void onAttachedToWindow() {
    super.onAttachedToWindow();
    if (onAttachedToWindow != null) {
      onAttachedToWindow.onAttachedToWindow();
    }
  }

  public void setOnAttachedToWindow(
      OnAttachedToWindow onAttachedToWindow) {
    this.onAttachedToWindow = onAttachedToWindow;
  }
}