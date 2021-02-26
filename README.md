# Adeetya Kulkarni - CS 4331 (Human Computer Interaction)- Project1  

## Presentation video -  


## The interface -  

<img width="764" alt="1" src="https://user-images.githubusercontent.com/43662207/109364453-7a566380-7854-11eb-9942-67cf6683ac1f.png">

## Pros :  
- Main/Common functionality easily acessible
- Clean interface | Not too crowded
- Color co-ordinated for ease of use
- Step by step guidance for complex functions

## Future Improvements :  
- Add sound feedback to the user  
- Add text to speech & Description for buttons for users with disability
- Add more functionality on the second page (Custom routines, Special options, Powersaver mode etc.)  

## State diagram of the application :


## Assets used -  
- Fonts : digital-7.ttf (To get the digital font which is seen in everyday microwaves)  
- Icon-time :   
  ![icon_time](https://user-images.githubusercontent.com/43662207/109363721-d61fed00-7852-11eb-97b2-87eb694d549c.jpg)
  
## Code snippets - 
- Button : 
`
ControlP5 startBtn;
void setup(){
  //Initialize the button
  startBtn = new ControlP5(this);
  startBtn.addButton("Start").setSize(100,80).setPosition(100, 750).plugTo(this, "startClock").setFont(cf1).setColorBackground(color(0,130,0));
}

`
- Page Movement :
`
// Movement function for page2
void movePage2(int direction){
       
      // Direction  - 0 : Left | 1 : Right
  
      if(direction == 0){
      
        // Unhide the hidden buttons
        defrostBtn.setPosition(defrostPos, 0);
        defrostBtn.show();
        powerBtn.setPosition(powerPos, 0);
        powerBtn.show();
        
        // Move them into place gradually
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

`
- Timer : 

`
int curSecond = second();
           
           // Calculate passedSecs
           int passedSecs = curSecond - myClock.time_started[2] - pauseTime;
           
           // If one sec has passed reduce timer by 1 sec
           if(passedSecs == 1 || passedSecs == -59){
             myClock.time_started[2] = second();
             
             if(myClock.sec != 0){
               //decrement sec each sec.
               myClock.sec -=1;
               pauseTime = 0;
             }
             else{
               // sec is over - check if min is remaining
               if(myClock.min > 0){
                 myClock.min -=1;
                 myClock.sec += 59;
               }
               else{
                 //min is over - check if hr is remaining
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

`


## How to run - 
1. Clone the project to your computer (git clone https://github.com/AdeetyaKulkarni/p1.AdeetyaKulkarni.git)  
2. Make sure you have processing installed on your computer (https://processing.org/download/)  
3. Run the .pde file in P1AdeetyaKulkarni directory  


