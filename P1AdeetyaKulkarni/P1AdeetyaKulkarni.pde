/**
Microwave interface program.
Author - Adeetya Kulkarni
R#: R11528155
CS 4331 - Human computer Interaction Project 1
**/


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
  
  void addThirty(){
    sec += 30;
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

void addThirty(){
  myClock.addThirty();
}

void displayMore(){
  pageStatus = 1;
}

void goBack(){
  pageStatus = 0;
}

void movePage2(int direction){
        
  
      if(direction == 0){
        defrostBtn.setPosition(defrostPos, 0);
        defrostBtn.show();
        powerBtn.setPosition(powerPos, 0);
        powerBtn.show();
        
        if(defrostPos > 0){
          defrostPos -=30;
          defrostBtn.setPosition(defrostPos,0);
        }
        if(powerPos > 0){
          powerPos -=30;
          powerBtn.setPosition(powerPos,0);
        }
      }
      else if(direction == 1){
        if(defrostPos < 500){
          defrostPos +=30;
          defrostBtn.setPosition(defrostPos,0);
        }
        if(powerPos < 500){
          powerPos +=30;
          powerBtn.setPosition(powerPos,0);
        }
      }

}


void movePage1(int direction){
  
  int[] digitButtonsXLoc = {200, 100, 200, 300, 100, 200, 300, 100, 200, 300 };
  int[] digitButtonsYLoc = {600, 300, 300, 300, 400, 400, 400, 500, 500, 500 };
   
  
  
  if(direction == 0){
    
        if(startPos > -500){
             startPos-=30;
             startBtn.setPosition(startPos, 0);
         }
         if(clearPos > -500){
             clearPos-=30;
             clearBtn.setPosition(clearPos, 0);
         }
         for(int i=0; i<10; i++){
            if(digitsPos[i] > -500){
              digitsPos[i] -=30;
              digitButtons[i].setPosition(digitsPos[i], digitButtonsYLoc[i]);
            }
            
          }
         
       movePage2(0);  
         
       pageState = 1; // Display has been interacted with
  
  }
  else if(direction == 1){
    
     int startXLoc = 0;
     int clearXLoc = 0;
    
          movePage2(1);
    
          if(startPos < startXLoc && pageState != 0){
             startPos+=30;
             startBtn.setPosition(startPos, 0);
          }
          if(clearPos < clearXLoc && pageState != 0){
             clearPos+=30;
             clearBtn.setPosition(clearPos, 0);
          }
          for(int i=0; i<10; i++){
            if(digitsPos[i] < digitButtonsXLoc[i]){
              digitsPos[i] +=30;
              digitButtons[i].setPosition(digitsPos[i], digitButtonsYLoc[i]);
            }
            
          }
         
         
         
    
  
  }
  

}


void defrostInit(){
    defrostState = 1;
    powerState = 0;
    powerUpBtn.hide();
    powerDownBtn.hide();
    powerSaveBtn.hide();
    backBtn.hide();
    cancelBtn.show();
    defrostStartBtn.show();

}

void defrostStart(){
    pageStatus = 0;
    myClock.timer_status = 1;
    myClock.sec = 5;
    myClock.min = 0;
    myClock.hr = 0;
    startClock();
}

void powerInit(){
    textStatus = 2;
    powerState = 1;
    defrostStartBtn.hide();
    defrostState = 0;
    powerUpBtn.show();
    powerDownBtn.show();
    backBtn.hide();
    cancelBtn.show();
}

void powerInc(){
    powerSaveBtn.show();
    if(powerLevel != 2){
      powerLevel = powerLevel+=1;
    }
}

void powerDec(){
    powerSaveBtn.show();
    if(powerLevel != 0){
      powerLevel = powerLevel-=1;
    }
}

void powerSave(){
    origPowerLevel = powerLevel;
    powerState = 0;
    powerUpBtn.hide();
    powerDownBtn.hide();
    powerSaveBtn.hide();
}


void cancelTask(){
    // Neutralize defrost states
    defrostState = 0;
    defrostStartBtn.hide();
    
    //Neutralize power states
    powerState = 0;
    powerUpBtn.hide();
    powerDownBtn.hide();
    powerSaveBtn.hide();
    
    //revert power level
    powerLevel = origPowerLevel;
    
    backBtn.show();
    cancelBtn.hide();

}


void setup(){

    size(500, 950);
    img = loadImage("icon_time.jpg");
    ControlFont cf1 = new ControlFont(createFont("Arial",15));
    ControlFont cf2 = new ControlFont(createFont("Arial",30));
    textF = createFont("digital-7.ttf", 80);
    


    for(int i = 0; i< digitButtons.length; i++){
        digitButtons[i] = new ControlP5(this);
        digitButtons[i].addButton(Integer.toString(i)).setSize(80,80)
        .plugTo(this, "myFunc"+Integer.toString(i)).setFont(cf2)
        .setColorActive(color(255,0,0));
        
        
        
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
    
    //Page1
    startBtn = new ControlP5(this);
    clearBtn = new ControlP5(this);
    stopBtn = new ControlP5(this);
    pauseBtn = new ControlP5(this);
    resumeBtn = new ControlP5(this);
    addThirtyBtn = new ControlP5(this);
    moreBtn = new ControlP5(this);
    startBtn.addButton("Start").setSize(100,80).setPosition(100, 750).plugTo(this, "startClock").setFont(cf1).setColorBackground(color(0,130,0));
    clearBtn.addButton("Clear").setSize(100,80).setPosition(300, 750).plugTo(this, "clearClock").setFont(cf1).setColorBackground(color(130,0,0));
    pauseBtn.addButton("Pause").setSize(100,80).setPosition(100, 750).plugTo(this, "pauseClock").setFont(cf1).setColorBackground(color(150,150,0));
    resumeBtn.addButton("Resume").setSize(100,80).setPosition(100, 750).plugTo(this, "resumeClock").setFont(cf1).setColorBackground(color(0,130,0));
    stopBtn.addButton("Stop").setSize(100,80).setPosition(300, 750).plugTo(this, "stopClock").setFont(cf1).setColorBackground(color(130,0,0));
    addThirtyBtn.addButton("Add 30 Sec").setSize(100,100).setPosition(200, 550).plugTo(this, "addThirty").setFont(cf1).setColorBackground(color(0,80,0));;
    moreBtn.addButton("More").setSize(100,50).setPosition(200, 200).plugTo(this, "displayMore").setFont(cf1).setColorBackground(color(90));
    
    //Page2
    backBtn = new ControlP5(this);
    defrostBtn = new ControlP5(this);
    defrostStartBtn = new ControlP5(this);
    powerBtn = new ControlP5(this);
    powerUpBtn = new ControlP5(this);
    powerDownBtn = new ControlP5(this);
    cancelBtn = new ControlP5(this);
    powerSaveBtn = new ControlP5(this);
    
    backBtn.addButton("Back").setSize(100,50).setPosition(200, 200).plugTo(this, "goBack").setFont(cf1).setColorBackground(color(90));
    cancelBtn.addButton("Cancel").setSize(100,50).setPosition(200, 200).plugTo(this, "cancelTask").setFont(cf1).setColorBackground(color(90));
    defrostBtn.addButton("Defrost").setSize(100,80).setPosition(100, 350).plugTo(this, "defrostInit").setFont(cf1).setColorBackground(color(0,0,0));
    defrostStartBtn.addButton("Start").setSize(100,80).setPosition(200, 350).plugTo(this, "defrostStart").setFont(cf1).setColorBackground(color(0,150,0));
    powerBtn.addButton("Set Power").setSize(100,80).setPosition(100, 550).plugTo(this, "powerInit").setFont(cf1).setColorBackground(color(0,0,0));
    powerUpBtn.addButton("+").setSize(50,35).setPosition(205, 550).plugTo(this, "powerInc").setFont(cf2).setColorBackground(color(0,0,250));
    powerDownBtn.addButton("-").setSize(50,39).setPosition(205, 592).plugTo(this, "powerDec").setFont(cf2).setColorBackground(color(0,0,250));
    powerSaveBtn.addButton("Save").setSize(100,80).setPosition(300, 550).plugTo(this, "powerSave").setFont(cf1).setColorBackground(color(0,150,0));
}


void draw(){
   
   clear();
   background(200);
   
   fill(253, 255, 255);
   rect(27, 60, 450, 90, 7);
   rect(405, 60, 72, 90, 7);
   fill(250);
   rect(75, 300, 355, 550,  7);
   
   
   if(textStatus == 0){    
     fill(50);
     textFont(textF);
     textSize(70);
     text(myClock.getTime() , 65, 130);
     
   }
   else if(textStatus == 1 && defrostState != 1 && powerState != 1){ 
     fill(50);
     textFont(textF);
     textSize(70);
     text("OPTIONS" , 65, 132);
   }
   else if(textStatus == 1 && defrostState == 1 && powerState != 1){
     fill(50);
     textFont(textF);
     textSize(70);
     text("PLACE FOOD" , 65, 132);
   }
   else if(textStatus == 1 && powerState == 1){
     fill(50);
     textFont(textF);
     textSize(70);
     text(powerLevelOptions[powerLevel], 65, 132);
   }

   
   
   if(myClock.Icon == 0){
       image(img, 415, 75);
   }
   
   
   
   if(pageStatus == 0){
         
         textStatus = 0;
         moreBtn.show();
         backBtn.hide();
         cancelBtn.hide();
         
         defrostBtn.hide();
         defrostStartBtn.hide();
         powerBtn.hide();
         powerSaveBtn.hide();
         powerUpBtn.hide();
         powerDownBtn.hide();
         
         myClock.Icon = 0;
         
         if(pageState != 0){ 
           movePage1(1);
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
           addThirtyBtn.hide();
           moreBtn.show();
         }
         else if(myClock.timer_status == -1){
           pauseBtn.hide();
           addThirtyBtn.hide();
           resumeBtn.show();
           moreBtn.hide();
           
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
           addThirtyBtn.show();
           moreBtn.hide();
           
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
                   if(defrostState > 0){
                     defrostState = 0;
                   }
                   myClock.timer_status = 0;
                   myClock.clearTimer();
                 }
               }
             }
           }
         
         }
   
   }
   else if(pageStatus == 1){
        
         textStatus = 1;
         myClock.Icon = 1;
         if(defrostState < 1 && powerState < 1){
           backBtn.show();
         }
         moreBtn.hide();
         movePage1(0);
        
   }
   
   
   

}

PImage img;

ControlP5[] digitButtons = new ControlP5[10];
ControlP5 startBtn; 
ControlP5 clearBtn; 
ControlP5 pauseBtn;
ControlP5 stopBtn;
ControlP5 resumeBtn;
ControlP5 addThirtyBtn;
ControlP5 moreBtn;
ControlP5 backBtn;
ControlP5 cancelBtn;
ControlP5 defrostBtn;
ControlP5 defrostStartBtn;
ControlP5 powerBtn;
ControlP5 powerUpBtn;
ControlP5 powerDownBtn;
ControlP5 powerSaveBtn;
Clock myClock = new Clock();
String[] powerLevelOptions = {"Low","Medium","High"};
int powerLevel = 1;
int origPowerLevel = 1; //For revert action

// Stores time the microwave was paused //
int pauseTime = 0;
int pauseStartSec;
int pauseEndSec;

//Page pos for buttons on page1
int startPos = 0;
int clearPos = 0;
int[] digitsPos = new int[10];

//Page pos for buttons on page2
int defrostPos = 500;
int powerPos = 500;


int pageStatus = 0; // Decides which display to display
int textStatus = 0; // Decides which text to display
int optionSelected = 0; // option1 - defrost, option2 - powerlevel // Only for page 2

int pageState = 0; // Decides if the display has ever been moved
int defrostState = 0; // 1 - clicked , 2 next step
int powerState = 0; // 1 - clicked , 2 next step

PFont textF;
