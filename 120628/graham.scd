(
// a window to display things in
w = Window("nothing", Rect(0, 0, 500, 200));
w.alwaysOnTop = true;
w.front;
 ~typeTimes = Array.new;
 ~start= 0;
 
// a button for resetting the clock
b = Button(w, Rect(0, 0, 500, 20));
b.states = [["reset"]];
b.action = {
    AppClock.sched(0, {|time| ~start = time; nil }); // reset the clock
    ~typeTimes.postcs; // post the recorded keystrokes, before resetting the array
    ~typeTimes = Array.new;
    t.string = "";
};
b.valueAction = 0;

// a text field to type in, which will record each keystroke to an array called ~typeTimes
t = TextField(w, Rect(0, 20, 500, 180));
t.keyDownAction = {|key| 
    AppClock.sched(0, {|time|
        time = (time - ~start);
        ~typeTimes = ~typeTimes.add([time, key.value.last]); 
        nil;
    });
};
)