//Calendar for game design planned date on 4/1/2024

PImage minNak;
PImage SOS;

int[] dateArray = new int[100000];
int[] dayArray = new int[100000];
float[] startTimeArray = new float[100000];
float[] endTimeArray = new float[100000];
String[] eventNameArray = new String[100000];
String[] calendarNameArray = new String[100000];
void setEvent()
{
  addEvent(20240401,31,9.00,14.00,"GD105", "GD102");
//change event in code. 
//Add certain dates and time using this code
//addEvent(YYYYMMDD,DD,(start)H.MM,(end)H.MM,event name, Calendar name)
}
void setup()
{
  background(255);
  size(700,800);
  smooth();
  textAlign(CENTER,CENTER);
  rectMode(CENTER);
  textSize(10);
  frameRate(30);
  setEvent();
  //image of Minardo and logo
  minNak = loadImage ("Minardo videos for calendar.png");
  SOS = loadImage ("S.O.S. Studio.png");
}
void draw()
{
  displayCalendar();
 scale(0.24);
 image(minNak, 2023,762);
 resetMatrix();

 scale(0.24);
 image(SOS, 1956,276);
 resetMatrix();
}

void displayCalendar()
{
  //Calendar 
  background(255);
  noStroke();
  calendarPanels();
  calendarCurrentDateAndTime();
  displayEvent();
}
void displayEvent()
{
  int currentDate = (year()*100+month())*100+day();
  int currentEventsCounter=100;
  for (int z = 0; z<=dateArray.length-1;z++)
  {
    if (dateArray[z]==currentDate)
    {
      int eventNumberInArray = z;
      if (startTimeArray[eventNumberInArray]<=hour()+(minute()*pow(10,-2))&&endTimeArray[eventNumberInArray]>hour()+(minute()*pow(10,-2)))
      {
        currentEventsCounter-=20;
        fill(0);
        int endPositionVal = round(((float)((float)((int(endTimeArray[eventNumberInArray])+((float)((endTimeArray[eventNumberInArray]-int(endTimeArray[eventNumberInArray]))*pow(10,2))/60))-(hour()+((float)minute()/60)))*60)/60)*100);
        noStroke();
        if (calendarNameArray[eventNumberInArray] == "GD102")
        {
          color eventCol = color(95,17,104,75);
          fill(eventCol);
        }
        else if (calendarNameArray[eventNumberInArray] == "GD105")
        {
          color eventCol = color(1,195,184,75);
          fill(eventCol);
        }
        rect(width/2-(currentEventsCounter/5),(height/10)+(endPositionVal/2),width/3+(currentEventsCounter/5),endPositionVal);
      }
      else
      { 
        if (endTimeArray[eventNumberInArray]>hour()+(minute()*pow(10,-2)))
        {
          currentEventsCounter-=20;
          float midEventPix = ((float)(((((((startTimeArray[eventNumberInArray]-int(startTimeArray[eventNumberInArray]))*100)/60)*100)+int(startTimeArray[eventNumberInArray]))-(hour()+((float)minute()/60)))+((((((((endTimeArray[eventNumberInArray]-int(endTimeArray[eventNumberInArray]))*100)/60)*100)+int(endTimeArray[eventNumberInArray]))-(hour()+((float)minute()/60)))-((((((startTimeArray[eventNumberInArray]-int(startTimeArray[eventNumberInArray]))*100)/60)*100)+int(startTimeArray[eventNumberInArray]))-(hour()+((float)minute()/60))))/2)))*100;
          float eventLengthPix = (((((((endTimeArray[eventNumberInArray]-int(endTimeArray[eventNumberInArray]))*100)/60)*100)+int(endTimeArray[eventNumberInArray]))-(hour()+((float)minute()/60)))-((((((startTimeArray[eventNumberInArray]-int(startTimeArray[eventNumberInArray]))*100)/60)*100)+int(startTimeArray[eventNumberInArray]))-(hour()+((float)minute()/60))))*100;
          if (calendarNameArray[eventNumberInArray] == "GD102")
        {
          color eventCol = color(98,7,93,75);
          fill(eventCol);
        }
        else if (calendarNameArray[eventNumberInArray] == "GD105")
        {
        
          color eventCol = color(0,0,0,75);
          fill(eventCol);
        }
        else if (calendarNameArray[eventNumberInArray] == "GD111")
        {
          color eventCol = color(47,220,181,75);
          fill(eventCol);
        }
          rect(width/2-(currentEventsCounter/5),(height/10)+midEventPix,width/3+(currentEventsCounter/5),eventLengthPix);
        }
      }
    }
  }
}
void addEvent(int eventDate,int eventDay,float eventStartTime,float eventEndTime,String eventName,String calendarName)
{
  int nextEventPos = 0;
      //Position                           
  for (int a =0;a<=dateArray.length-1;a++)
  {
    if (eventNameArray[a]==null)
    {
      nextEventPos = a;
      break;
    }
  }
    //next position                            
  dayArray[nextEventPos] = eventDay;
  dateArray[nextEventPos] = eventDate;
  startTimeArray[nextEventPos] = eventStartTime;
  endTimeArray[nextEventPos] = eventEndTime;
  eventNameArray[nextEventPos] = eventName;
  calendarNameArray[nextEventPos] = calendarName;
}
void calendarPanels()
{
  //main panel
  fill(255);
  rect(width/2,height/2,width/2,height);
  //top panel
  textSize(width/40);
  fill(0);
  rect(width/2,20,width,40);
  fill(108,14,116);
  rect(width/2,20,width/3,40);
  fill(255);
  text("Game Design Class Calendar",width/2,17);
}
void calendarCurrentDateAndTime()
{
  //Today's date and time
  textSize(width/40);
  fill(0,255,174);
  text(day()+"/"+month()+"/"+year(),width/10,17);
  textSize(10);
  if (minute()<10)
  {
    text(hour()+":"+"0"+minute(),50,height/10);
  }
  else
  {
    text(hour()+":"+minute(),50,height/10);
  }
  stroke(0,66,255);
  line(75,height/10,width,height/10);
  ellipse(75,height/10,15,15);
  //Subsequent hours
  int time = minute();
  stroke(0);
  fill(0);
  for(int testHours = 1;testHours<=23;testHours++)
  {
    if (hour()+testHours<=24)
    {
      text(hour()+testHours+":00",15,(height/10)+((testHours*100)-(((float)time/60)*100)));
      line(75,(height/10)+((testHours*100)-(((float)time/60)*100)),width,(height/10)+((testHours*100)-(((float)time/60)*100)));
    }
  }
}
