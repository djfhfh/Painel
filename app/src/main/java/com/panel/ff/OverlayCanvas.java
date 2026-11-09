package com.panel.ff;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.view.View;

public class OverlayCanvas extends View {
    private Paint paintBox, paintText;

    public OverlayCanvas(Context context) {
        super(context);
        paintBox = new Paint();
        paintBox.setColor(Color.RED);
        paintBox.setStyle(Paint.Style.STROKE);
        paintBox.setStrokeWidth(3f);

        paintText = new Paint();
        paintText.setColor(Color.GREEN);
        paintText.setTextSize(30f);
    }

    @Override
    protected void onDraw(Canvas canvas) {
        super.onDraw(canvas);
        canvas.drawRect(200, 200, 500, 800, paintBox);
        canvas.drawText("ESP Box [FF]", 200, 190, paintText);
    }
}
