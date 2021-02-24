import controlP5.*;

class Clock{

  ArrayList<Integer> timer_array = new ArrayList<Integer>();
  int sec = 0;
  int min = 0;
  int hr = 0;
  
  int timer_status = 0; // 0 = clear, 1= start, -1 = pause
  int[] time_started = new int[3];
  
  int Icon = 0; // 0 = time 
  
  Clock(){
    
    setTimerArray();
    
  }
  
  void setTimerArray(){
    timer_array.add(0);
    timer_array.add(0);
    timer_array.add(0);
    timer_array.add(0);
    timer_array.add(0);
    timer_array.add(0);
    sec = Integer.valueOf(Integer.toString(timer_array.get(1))+Integer.toString(timer_array.get(0)));
    min = Integer.valueOf(Integer.toString(timer_array.get(3))+Integer.toString(timer_array.get(2)));
    hr  = Integer.valueOf(Integer.toString(timer_array.get(5))+Integer.toString(timer_array.get(4)));
  
  }
  
  void SetTimer(int sec, int min, int hr){
    this.sec = sec;
    this.min = min;
    this.hr = hr;
  }
  
  void Start_Timer(){
    timer_status = 1;
    time_started[2] = second();
    time_started[1] = minute();
    time_started[0] = hour();
  }
  
  
  void Pause_Timer(){
    timer_status = -1;
  }
  
  String getSecString(){
      if(this.sec < 10 && this.sec >= 0){
        return "0"+this.sec;
      }  
      else{
        return ""+this.sec;
      }
  }
  
    String getMinString(){
      if(this.min < 10 && this.min >= 0){
        return "0"+this.min;
      }  
      else{
        return ""+this.min;
      }
  }
  
    String getHrString(){
      if(this.hr < 10 && this.hr >= 0){
        return "0"+this.hr;
      }  
      else{
        return ""+this.hr;
      }
  }
  
  String getTime(){
    return getHrString()+" : "+getMinString()+" : "+getSecString();
  }
  
  void pushTimer(int digit){
    
    timer_array.add(0, digit);    
    sec = Integer.valueOf(Integer.toString(timer_array.get(1))+Integer.toString(timer_array.get(0)));
    min = Integer.valueOf(Integer.toString(timer_array.get(3))+Integer.toString(timer_array.get(2)));
    hr  = Integer.valueOf(Integer.toString(timer_array.get(5))+Integer.toString(timer_array.get(4)));
  }  
  
  void clearTimer(){
    timer_array.clear();
    setTimerArray();
    
  }
  
  void preStart(){
    
    //Reset sec, min to correct vals
    if(sec > 60){
      sec = sec - 60;
      min = min+1;
    }   
    if(min > 60)
    {
      min = min - 60;
      hr = hr + 1;
    }    
    if(hr > 24){
      hr = 24;
    }
    this.Start_Timer();
  }
  
  
}




void myFunc0(){
  myClock.pushTimer(0);
}
void myFunc1(){  
  myClock.pushTimer(1);
}
void myFunc2(){
  myClock.pushTimer(2);
}
void myFunc3(){
  myClock.pushTimer(3);
}
void myFunc4(){
  myClock.pushTimer(4);
}
void myFunc5(){
  myClock.pushTimer(5);
}
void myFunc6(){
  myClock.pushTimer(6);
}
void myFunc7(){
  myClock.pushTimer(7);
}
void myFunc8(){
  myClock.pushTimer(8);
}
void myFunc9(){
  myClock.pushTimer(9);
}

void startClock(){
  if(myClock.sec == 0 && myClock.min == 0 && myClock.hr == 0){
    print("Cannot start timer!");
  }
  else{
    print("\nTimer started");
    myClock.preStart();
  }
}
void clearClock(){
  myClock.clearTimer();
}

void pauseClock(){
  myClock.timer_status = -1;
  pauseStartSec = second();
}

void resumeClock(){
  myClock.timer_status = 1;
  pauseEndSec = second();
  pauseTime = pauseEndSec - pauseStartSec;
}

void stopClock(){
  myClock.clearTimer();
  myClock.timer_status = 0;
}

void setup(){

    size(500, 950);
    img = loadImage("icon_time.jpg");
    

    for(int i = 0; i< digitButtons.length; i++){
        digitButtons[i] = new ControlP5(this);
        digitButtons[i].addButton(Integer.toString(i)).setSize(80,80).plugTo(this, "myFunc"+Integer.toString(i));
        
        //Positioning the first row
        if(i > 0 && i < 4){
          digitButtons[i].setPosition(10 * (i * 10) , 300);
        }
        else if(i >= 4 && i < 7 ){
          digitButtons[i].setPosition(10 * ((i-3) * 10) , 400);
        }
        else if(i >= 7 && i < 10){
          digitButtons[i].setPosition(10 * ((i-6) * 10) , 500);
        }
        else {
          digitButtons[i].setPosition(200 , 600);
        }
    }
    startBtn = new ControlP5(this);
    clearBtn = new ControlP5(this);
    stopBtn = new ControlP5(this);
    pauseBtn = new ControlP5(this);
    resumeBtn = new ControlP5(this);
    startBtn.addButton("Start").setSize(100,80).setPosition(100, 750).plugTo(this, "startClock");
    clearBtn.addButton("Clear").setSize(100,80).setPosition(300, 750).plugTo(this, "clearClock");
    pauseBtn.addButton("Pause").setSize(100,80).setPosition(100, 750).plugTo(this, "pauseClock");
    resumeBtn.addButton("Resume").setSize(100,80).setPosition(100, 750).plugTo(this, "resumeClock");
    stopBtn.addButton("Stop").setSize(100,80).setPosition(300, 750).plugTo(this, "stopClock");
    
    
}


void draw(){
   
   clear();
   background(200);
   
   fill(253, 255, 255);
   rect(27, 60, 450, 90, 7);
   rect(405, 60, 72, 90, 7);
   
   
   textSize(50);
   fill(50);
   text(myClock.getTime() , 65, 125);
   
   if(myClock.Icon == 0){
     image(img, 415, 75);
   }
   
   if(myClock.timer_status == 0){
     for(int i =0 ; i<10; i++){
       digitButtons[i].show();
     }
     startBtn.show();
     clearBtn.show();
     pauseBtn.hide();
     stopBtn.hide();
     resumeBtn.hide();
   }
   else if(myClock.timer_status == -1){
     pauseBtn.hide();
     resumeBtn.show();
   }
   else if(myClock.timer_status == 1){
     for(int i =0 ; i<10; i++){
       digitButtons[i].hide();
     }
     startBtn.hide();
     clearBtn.hide();
     resumeBtn.hide();
     pauseBtn.show();
     stopBtn.show();
     
     
     int curSecond = second();
     
     int passedSecs = curSecond - myClock.time_started[2] - pauseTime;
     
     if(passedSecs == 1 || passedSecs == -59){
       myClock.time_started[2] = second();
       
       if(myClock.sec != 0){
         //decrement sec each sec.
         myClock.sec -=1;
         pauseTime = 0;
       }
       else{
         // sec is over
         if(myClock.min > 0){
           myClock.min -=1;
           myClock.sec += 59;
         }
         else{
           //min is over
           if(myClock.hr > 0){
             myClock.hr -= 1;
             myClock.min += 59;
           }
           else{
             print("\nDone!");
             myClock.timer_status = 0;
             myClock.clearTimer();
           }
         }
       }
     }
   
   }

}

PImage img;
ControlP5[] digitButtons = new ControlP5[10];
ControlP5 startBtn; 
ControlP5 clearBtn; 
ControlP5 pauseBtn;
ControlP5 stopBtn;
ControlP5 resumeBtn;
Clock myClock = new Clock();

// Stores time the microwave was paused //
int pauseTime = 0;
int pauseStartSec;
int pauseEndSec;
