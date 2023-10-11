package processing.book.layouts;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import processing.android.PFragment;

public class MainActivity extends AppCompatActivity {
    MySketch sketch;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        sketch = new MySketch();
        PFragment fragment = new PFragment(sketch);
        fragment.setLayout(R.layout.activity_main, R.id.activity_main, this);
    }
}