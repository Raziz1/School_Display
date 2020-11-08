//Helpful links_______________________________________________________
//https://forum.processing.org/one/topic/load-image-from-web-13-7-2012.html (Pulling Images)
//https://discourse.processing.org/t/parsing-html-with-jsoup/9577 (Jsoup HTML parsing)


import java.util.List;
import java.util.Date;

//Variables__________________________________________
PFont Berlin;
PImage icon;
PImage icon2;
PImage southLogo;
PImage card1;
PImage card2;
float x;
String ampm; //To make the clock a 12h clock

//HTML Splittin Variables_____________________________
String [] ln= new String [500];
String [] ln2= new String [2800];
String [] ln3= new String [1000];
String [] ln4= new String [800];
String [] ln5=new String [1000];

String [] bits= new String [100];
String [] bits2= new String [100];
String [] bits3= new String [100];
String [] bits4= new String [100];
String [] bits5= new String [100];
String [] bits6= new String [100];
String [] bits7= new String [100];
String [] bits8= new String [100];
String [] bits9= new String [100];
String [] bits10= new String [100];
String [] bits12= new String [100];
String [] bits13= new String [100];
String [] bits14= new String [100];
String [] bits15= new String [100];
String [] bits16= new String [100];
String [] bits17= new String [100];
String [] bits18= new String [100];
String [] bits19= new String [100];
String [] bits20= new String [100];
String [] bits21= new String [100];
String [] bits22= new String [100];
String [] bits23= new String [100];
String [] bits24= new String [100];
String [] bits25= new String [100];
String [] bits26= new String [100];
String [] bits27= new String [100];
String [] bits28= new String [100];
String [] bits29= new String [100];
String [] bits30= new String [100];
String [] bits31= new String [100];
String [] bits32= new String [100];
String [] bits33= new String [100];
String [] bits34= new String [100];
String [] bits35= new String [100];
String [] bits36= new String [100];
String [] bits37= new String [100];
String [] bits38= new String [100];


//WORLD NEWS HTML SCRAPPING________________________________________________________________________
String [] bits39= new String [100];
String [] bits40= new String [100];

String [] bits41= new String [100];
String [] bits42= new String [100];

String [] bits43= new String [100];
String [] bits44= new String [100];

String [] bits45= new String [100];
String [] bits46= new String [100];

String [] bits47= new String [100];
String [] bits48= new String [100];

String [] bits49= new String [100];
String [] bits50= new String [100];

String [] bits51= new String [100];
String [] bits52= new String [100];

String [] bits53= new String [100];
String [] bits54= new String [100];

String [] bits55= new String [100];
String [] bits56= new String [100];

String [] bits57= new String [100];
String [] bits58= new String [100];

String [] bits59= new String [100];
String [] bits60= new String [100];

String [] bits61= new String [100];
String [] bits62= new String [100];

String [] bits63= new String [100];
String [] bits64= new String [100];

String [] bits65= new String [100];
String [] bits66= new String [100];

String [] bits67= new String [100];
String [] bits68= new String [100];




//Twitter Variables_____________________________________________________
int s=0; //Timer for refreshing tweets
float move=0; //Twitter boxes movement
float []y= new float [20]; //Y-value of twitter texts and boxes
int direction=0; //Direction of scrolling
PImage [] logo= new PImage [20];
String userName ="@XXXXXXXXXXXX"; //Twitter account username
int numTweets = 100;

//Tweet info_________________________________
String[] twArray = new String[numTweets];
PImage [] img= new PImage [100];
String [] userImg= new String [100];
String [] user= new String [100];
String [] msg= new String [100];
boolean [] tmp= new boolean [20];
Status rs;

//Retweet inf_________________________________
String [] ogtext= new String [100];
String [] oguser= new String [100];
String [] oguserimglink= new String [100];
PImage [] oguserimg= new PImage [100];
java.util.List statuses = null;

//Date of tweets____________________________________
Date [] d= new Date[100];
String []l= new String [100];

//World news Variables____________________________
float [] y1= new float [6];
PImage [] newsimg= new PImage [6];
float move1=0;
float direction1=0;
PImage BBC;
int newsimgx;
int newsimgy;
int BBCw;
int BBCh;




void setup() {
  fullScreen();
  frameRate(60);
  Berlin=loadFont("BerlinSansFBDemi-Bold-48.vlw");
  southLogo=loadImage("https://p13cdn4static.sharpschool.com/UserFiles/Servers/Server_235000/Templates/south-carleton.png");
  BBC=loadImage("BBC LOGO.png");
}

void draw() {
  //Twitter Setup________________________________________________________________________
  ConfigurationBuilder cb = new ConfigurationBuilder();
  
  cb.setOAuthConsumerKey("XXXXXXXXXXXXX");
  cb.setOAuthConsumerSecret("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
  cb.setOAuthAccessToken("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
  cb.setOAuthAccessTokenSecret("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
  cb.setTweetModeExtended(true);

  Twitter twitter = new TwitterFactory(cb.build()).getInstance();


  if ((s==0) || (s%5000==10000)) { //Refreshes everything that is static every 10 seconds
    s=0;
    //HTML scraping_______________________________________________________________________
    ln=loadStrings ("https://www.cbc.ca/weather/s0000623.html");
    String pg = "";
    for (int i=0; i<500; i++) {
      //println(i+"] "+ln[i]);
      pg+=ln[i];
    }

    //SNOW DAY PREDICTOR HTML LOAD_______________________________
    ln2=loadStrings("https://www.snowdaycalculator.com/prediction.php?zipcode=M4B1B3&snowdays=1&extra=-0.4&"); //In url link the amount of snowdays needs to be updated because of the formula the dude uses
    String pg2= "";
    for (int i=2300; i<2800; i++) {
      //print(ln2.length);
      //println(i+"] "+ln2[i]);
      pg2+=ln2[i];
    }

    //OSTA (OTTAWA STUDENT TRANSPORTATION AUTHORITY) HTML LOAD_______________________________
    ln3=loadStrings("http://www.ottawaschoolbus.ca/");
    String pg3= "";
    for (int i=700; i<1200; i++) {
      //println(ln3.length);
      //println(i+"] "+ln3[i]);
      pg3+=ln3[i];
    }

    //South Carleton High School (What's New page)______________________________________________
    ln4=loadStrings("https://southcarletonhs.ocdsb.ca/news/what_s_new");
    String pg4= "";
    for (int i=500; i<ln4.length; i++) {
      //println(ln4.length);
      //println(i+"] "+ln4[i]);
      pg4+=ln4[i];
    }

    //BBC World news____________________________________________________________________________
    ln5=loadStrings("https://www.bbc.com/news/world");
    String pg5=" ";
    for (int i=0; i<ln5.length; i++) {
      //print(ln5.length);
      //println(i+"] "+ln5[i]);
      pg5+=ln5[i];
    }

    //Splitting HTML CODE_______________________________________________________________________________________

    String[] bits=split (pg, "<span class=\"celsius\">"); 
    //println(bits[2]);
    //println(bits.length);
    bits2=split(bits[1], "<sup>&deg;C</sup>");
    //println(bits2[0]);

    //Weather Description ___________________________________________
    String[] bits3=split (pg, "<p id=\"forecast-description\">"); 
    //println(bits3.length);
    bits4=split(bits3[1], "</p>");


    //Icon scrapping________________________________________
    String[] bits5=split (pg, "<div id=\"l-icon\">"); 
    //println(bits5.length);
    bits6=split(bits5[1], "\"/><br />" );
    //println(bits6.length);
    bits6[0]=bits6[0].replace("<img src=\"", "https://www.cbc.ca/");
    icon=loadImage(bits6[0]);

    //Snow Day Predictor___________________________________
    if ((month()<=9)) {
      if ((day()+1)<=9) {
        bits7=split (pg2, "theChance["+year()+"0"+month()+"0"+(day()+1)+"]");
      } else if ((day()+1)>9) {
        bits7=split (pg2, "theChance["+year()+"0"+month()+""+(day()+1)+"]");
      }
    } else {
      if ((day()+1)<=9) {
        bits7=split (pg2, "theChance["+year()+""+month()+"0"+(day()+1)+"]");
      } else if ((day()+1)>9) {
        bits7=split (pg2, "theChance["+year()+""+month()+""+(day()+1)+"]");
      }
    }
    //println(bits7.length);
    bits8=split(bits7[1], "//PREDICTION" );
    //println(bits8[0]+"%");

    //OSTA bus delays________________________________________
    String[] bits9=split (pg3, "<h4 class=\"alert\">"); 
    //println(bits9.length);
    bits10=split(bits9[1], "</h4>" );
    //println(bits10[0]);

    //Extended Forecast____________________________________
    String[] bits11=split (pg, "<th  scope=\"col\">"); 
    //println(bits11.length);
    bits12=split(bits11[1], "</th>" );
    //println(bits12[0]);

    String[] bits13=split (pg, "<tr id=\"daterow\">"); 
    //println(bits13.length);
    bits14=split(bits13[1], "</p>" );
    bits14[0]=bits14[0].replace("<td>", "");
    bits14[0]=bits14[0].replace("<p>", "");
    bits14[0]=bits14[0].replace("<td class=\"w-end\">", ""); //Replaces it if it is the weekend
    //println(bits14[0]);

    //Icon2_________________________
    String[] bits15=split (pg, "<img src=\""); 
    //println(bits15.length);
    bits16=split(bits15[7], "\" alt=\"\"/>" );
    //println(bits16[0]);
    icon2=loadImage("https://www.cbc.ca/"+bits16[0]);

    String[] bits17=split (pg, "<td class=\"dayforecast\">");  //Conditions
    //println(bits17.length);
    bits18=split(bits17[1], "</td>" );
    //println(bits18[0]);

    String[] bits19=split (pg, "<p class=\"celsius\">");  //High of 
    //println(bits19.length);
    bits20=split(bits19[1], "</p>" );
    //println(bits20[0]);

    //Wind____________________________
    String[] bits21=split (pg, "<span>Wind: </span>"); 
    //println(bits21.length);
    bits22=split(bits21[1], "<br/>" );
    //println(bits22[0]);

    //SCHS NEWS card 1 image______________________________________________
    String[] bits23=split (pg4, " <div class=\"image\"><img src=\""); 
    //println(bits23.length);
    bits24=split(bits23[1], "\"" );
    bits24[0]=bits24[0].replace(" ", "%20"); //Kept getting error HTTP 505 because of missing url gaps
    //println(bits24[0]);
    card1=loadImage(bits24[0]);

    //SCHS NEWS card 1 title____________________________________________
    String[] bits25=split (pg4, "title=\""); 
    //println(bits25.length);
    bits26=split(bits25[3], "\">" );
    //println(bits26[0]);

    //SCHS NEWS card 1 date____________________________________________
    String[] bits27=split (pg4, "<div class=\"date\">"); 
    //println(bits27.length);
    bits28=split(bits27[1], "</div>" );
    //println(bits28[0]);

    //SCHS NEWS card 1 summary____________________________________________
    String[] bits29=split (pg4, "<div class=\"summary\">"); 
    //println(bits29.length);
    bits30=split(bits29[1], "</div>" );
    //println(bits30[0]);

    //SCHS NEWS card 2 image_________________________________________________
    String[] bits31=split (pg4, " <div class=\"image\"><img src=\""); 
    //println(bits31.length);
    bits32=split(bits31[2], "\""  );
    bits32[0]=bits32[0].replace(" ", "%20"); //Kept getting error HTTP 505 because of missing url gaps
    //println(bits24[0]);
    card2=loadImage(bits32[0]);

    //SCHS NEWS card 2 title____________________________________________
    String[] bits33=split (pg4, "title=\""); 
    //println(bits33.length);
    bits34=split(bits33[6], "\">" );
    //println(bits34[0]);

    //SCHS NEWS card 2 date____________________________________________
    String[] bits35=split (pg4, "<div class=\"date\">"); 
    //println(bits35.length);
    bits36=split(bits35[2], "</div>" );
    //println(bits36[0]);

    //SCHS NEWS card 2 summary____________________________________________
    String[] bits37=split (pg4, "<div class=\"summary\">"); 
    //println(bits37.length);
    bits38=split(bits37[2], "</div>" );
    //println(bits38[0]);

    //World News Headline________________________________________________________

    //Title___________________________________________________________________________
    bits39= split(pg5, "\"categoryLabel\":null,\"title\":\"");
    bits40=split(bits39[1], "\"");
    //println(bits40[0]);

    //Summary__________________________________________________________________________
    bits41= split(pg5, "\"summary\":\"");
    bits42=split(bits41[2], "\",\"");
    //println(bits42[0]);

    //Image_____________________________________________________________________________
    bits43= split(pg5, "\"imageUrl\":\"");
    bits44=split(bits43[1], "\"");
    //println(bits44[0]);

    //Title2______________________________________________________________
    bits45= split(pg5, "\"categoryLabel\":null,\"title\":\"");
    bits46=split(bits45[2], "\"");
    //println(bits46[0]);

    //Summary2__________________________________________________________________________
    bits47= split(pg5, "\"summary\":\"");
    bits48=split(bits47[3], "\",\"");
    //println(bits48[0]);

    //Image2_____________________________________________________________________________
    bits49= split(pg5, "\"imageUrl\":\"");
    bits50=split(bits49[2], "\"");
    //println(bits50[0]);

    //Title3______________________________________________________________
    bits51= split(pg5, "\"categoryLabel\":null,\"title\":\"");
    bits52=split(bits51[3], "\"");
    //println(bits52[0]);

    //Summary3__________________________________________________________________________
    bits53= split(pg5, "\"summary\":\"");
    bits54=split(bits53[4], "\",\"");
    //println(bits54[0]);

    //Image3_____________________________________________________________________________
    bits55= split(pg5, "\"imageUrl\":\"");
    bits56=split(bits55[3], "\"");
    //println(bits56[0]);

    //Title4______________________________________________________________
    bits57= split(pg5, "\"categoryLabel\":null,\"title\":\"");
    bits58=split(bits57[4], "\"");
    //println(bits58[0]);

    //Summary4__________________________________________________________________________
    bits59= split(pg5, "\"summary\":\"");
    bits60=split(bits59[5], "\",\"");
    //println(bits60[0]);

    //Image4_____________________________________________________________________________
    bits61= split(pg5, "\"imageUrl\":\"");
    bits62=split(bits61[4], "\"");
    //println(bits62[0]);

    //Title5______________________________________________________________
    bits63= split(pg5, "\"categoryLabel\":null,\"title\":\"");
    bits64=split(bits63[5], "\"");
    //println(bits64[0]);

    //Summary5__________________________________________________________________________
    bits65= split(pg5, "\"summary\":\"");
    bits66=split(bits65[6], "\",\"");
    //println(bits66[0]);

    //Image5_____________________________________________________________________________
    bits67= split(pg5, "\"imageUrl\":\"");
    bits68=split(bits67[5], "\"");
    //println(bits68[0]);

    //Loading news images_______________________________________________________________

    //Resize does not accept decimals so I have to round it 
    newsimgx=round(width*0.078125);
    newsimgy=round(height*0.1222222);

    newsimg[1]=loadImage(bits44[0]);
    newsimg[1].resize(newsimgx, newsimgy);
    newsimg[2]=loadImage(bits50[0]);
    newsimg[2].resize(newsimgx, newsimgy);
    newsimg[3]=loadImage(bits56[0]);
    newsimg[3].resize(newsimgx, newsimgy);
    newsimg[4]=loadImage(bits62[0]);
    newsimg[4].resize(newsimgx, newsimgy);
    newsimg[5]=loadImage(bits68[0]);
    newsimg[5].resize(newsimgx, newsimgy);


    //Twitter Check____________________________________________________________________
    try {
      statuses = twitter.getUserTimeline(userName);
    } 
    catch(TwitterException e) {
    }



    for (int i=0; i<statuses.size(); i++) {

      logo[i]=loadImage("Twitter_Logo.png");
      logo[i].resize(25, 25);

      Status status = (Status)statuses.get(i);
      tmp[i]=status.isRetweet();

      rs=status.getRetweetedStatus(); //Get the entire status of the tweet
      //println(rs);

      //println(tmp[i]); //Boolean true or false if it has been retweeted
      //println(i);

      if (status.isRetweet()==true) { //If a tweet has been retweeted it gets the original tweets user name and porfile picture.
        Status originalTweet = status.getRetweetedStatus();
        ogtext[i]=originalTweet.getText();
        long originaltweetid = originalTweet.getId();
        long originaluserid = originalTweet.getUser().getId();
        //println(originaltweetid);
        oguser[i]=originalTweet.getUser().getName(); 
        //println(oguser[i]);
        oguserimglink[i]= originalTweet.getUser().getProfileImageURLHttps();
        oguserimg [i]= loadImage(oguserimglink[i]);
      }

      //twArray[i] = status.getUser().getName() + ": " + status.getText();
      user[i]=status.getUser().getName();
      msg[i]=status.getText();

      //Converting Date to String________________________________________________
      d[i]=status.getCreatedAt();
      l[i]=String.valueOf(d[i]);
      //println(l[i]);





      userImg[i]=status.getUser().getProfileImageURLHttps(); 
      img[i]=loadImage(userImg[i]);
      //println(user[i]);
      //println(msg[i]);


      //Visual____________________________________________________________________________
      background(#9b0707);
      textSize(64); //Ensures the font is loaded at a larger size to prevent blurry letters

      //Weather_____________________________________________________________________________________________
      pushStyle();
      strokeWeight(10);
      rect(width*0.67, height*0.140208333333, width*0.3125, height*0.388888888889, 15);
      popStyle();

      pushStyle();
      strokeWeight(4);
      line(width*0.6875, height*0.36111111, width*0.96875, height*0.36111111);
      line(width*0.840625, height*0.37777777, width*0.840625, height*0.5);
      popStyle();

      pushStyle();
      textAlign(CENTER);
      textSize(18);
      fill(#000000);
      text(bits12[0], width*0.75625, height*0.38888888);
      popStyle();

      pushStyle();
      textAlign(CENTER);
      textSize(16);
      fill(#000000);
      text(bits14[0], width*0.75625, height*0.411111);
      popStyle();

      pushStyle();
      textSize(14);
      fill(#000000);
      textLeading(20);
      text(bits18[0], width*0.73125, height*0.427777, width*0.9375, height*0.555555);
      bits20[0]=bits20[0].replace("&deg;", "");
      text(bits20[0]+"°C", width*0.73125, height*0.477777);
      popStyle();


      pushStyle();
      textSize(44);
      textAlign(CENTER);
      fill(#000000);
      text("Current Conditions", width*0.821875, height*0.2055555);
      text(bits2[0]+"°C", width*0.790625, height*0.3055555555);
      popStyle();

      pushStyle();
      textSize(20);
      fill(#000000);
      textAlign(CENTER);
      text("Wind: "+bits22[0], width*0.90125, height*0.3166666);
      popStyle();

      pushStyle();
      textSize(24);
      fill(#000000);
      textLeading(25);
      text(bits4[0], width*0.84375, height*0.2388888, width*0.125, height*0.11111);
      popStyle();

      image(icon2, width*0.684375, height*0.422222222);
      image(icon, width*0.678125, height*0.22222222);
      southLogo.resize(125, 125);
      image(southLogo, width*0.865625, height*0.3722222222);

      //Snow Day Predictor___________________________________________________________________________________________________________
      pushStyle();
      strokeWeight(10);
      rect(width*0.671875, height*0.583333333, width*0.3125, height*0.36111111, 10);
      popStyle();

      pushStyle();
      if (width<=1440) {
        textSize(40);
      } else {
        textSize(46);
      }
      fill(#000000);
      textAlign(CENTER);
      text("Snow Day Predictor", width*0.821875, height*0.6388888);
      popStyle();

      //The date for the next day prediction
      pushStyle();
      textSize(24);
      textAlign(CENTER);
      fill(#000000);
      text("Tomorrow: "+month()+"/"+(day()+1)+"/"+year(), width*0.859375, height*0.694444444);
      popStyle();

      pushStyle();
      textSize(22);
      textAlign(LEFT);
      fill(#000000);
      text(bits10[0], width*0.769375, height*0.83333, width*0.21875, height*0.222222);
      popStyle();

      //Rounding percentage_________________________________________
      bits8[0]=bits8[0].replace(";", "");
      bits8[0]=bits8[0].replace("=", "");
      //println(bits8[0]);
      x=float(bits8[0]);
      x=floor(x);
      //println(x);

      if (x>100) { //If percentage is greater than 100 bring it down to 100. The formula on the website sometime exceeds 100
        x=100;
      } else if (x<0) {
        x=0;
      }
      pushStyle();
      textSize(50);
      textAlign(CENTER);
      fill(#000000);
      text(x+"%", width*0.859375, height*0.76666666);
      popStyle();

      //Bar_____________________________________________________________
      pushStyle();
      strokeWeight(25);
      rect(width*0.70, height*0.672222, width*0.046875, height*0.2222222, 15);
      popStyle();
      pushStyle();
      if (x>=0 && x<=25) {
        fill(0, 255, 0);
      } else if (x>=25 && x<=75) {
        fill(255, 255, 0);
      } else if (x>=85) {
        fill(255, 0, 0);
      }
      strokeWeight(4);
      rect(width*0.70625, height*0.89444444, width*0.034375000000, (-x*2));
      popStyle();
    }
  }
  //Redrawing Twitter Interface______________________________________________________________________________________________________________
  //Twitter box______________________________________________________________________________________________________________________________
  pushStyle();
  strokeWeight(7);
  rect(width*0.353125, height*0.3055555, width*0.29375, height*0.6388888, 5);
  popStyle();

  for (int i=0; i<statuses.size(); i++) {

    //Direction of Scrolling______________________________________________________
    if (y[19]<650) {
      direction=1;
    } else if (y[19]>4135) {
      direction=0;
    }

    if (direction==1) {
      move-=0.030;
    } else if (direction==0) {
      move+=0.030;
    }

    y[i]=(330+(200*i))-move;


    s++; //Increases time counter

    //println(y[19]);
    //Rectangles_____________________________________________________________________
    pushStyle();
    strokeWeight(5);
    rect(width*0.359375, y[i], width*0.28125, height*0.214444, 5);
    //rect(405, y[i], 740,193,5);
    popStyle();

    //Twitter Logo______________________________________________________________
    pushStyle();
    image(logo[i], width*0.61875, (340+(200*i))-move);
    popStyle();

    //Profile name____________________________________________________________________
    pushStyle();
    fill(#000000);
    textLeading(12);
    textSize(16);
    if (tmp[i]==true) {
      text(oguser[i], width*0.40625, (340+(200*i))-move, width*0.4375, height*0.2222222);
    } else {
      text(user[i], width*0.40625, (340+(200*i))-move, width*0.4375, height*0.2222222);
    }
    popStyle();

    pushStyle();
    fill(#a799ae);
    textLeading(12);
    textSize(14);
    if (tmp[i]==true) {
      text("@"+oguser[i], width*0.40625, (358+(200*i))-move, width*0.4375, height*0.2222222);
    } else {
      text("@"+user[i], width*0.40625, (358+(200*i))-move, width*0.4375, height*0.2222222);
    }
    popStyle();

    //Date________________________________________
    pushStyle();
    fill(#a799ae);
    textSize(12);
    text(l[i], width*0.5124999999, (510+(200*i))-move);
    popStyle();


    //Profile pics____________________________________________________________________
    pushStyle();
    if (tmp[i]==true) {
      image(oguserimg[i], width*0.365625, ((340+200*i))-move);
    } else {
      image(img[i], width*0.365625, ((340+200*i))-move);
    }
    popStyle();

    //Main Text_________________________________________________________________________
    pushStyle();
    fill(#000000);
    textLeading(8);
    if (tmp[i]==true) {
      if (ogtext[i].length()>=210) {
        textSize(12);
      } else {
        textSize(14);
      }
    } else {
      if (msg[i].length()>=210) {
        textSize(12);
      } else {
        textSize(14);
      }
    }
    if (tmp[i]==true) {
      text(ogtext[i], width*0.40625, (380+(200*i))-move, width*0.21875, height*0.222222); //If text is a retweet it does not get the full text so you have to tell it to get the full text from the status.
    } else {
      text(msg[i], width*0.40625, (380+(200*i))-move, width*0.21875, height*0.222222);
    }
    popStyle();
  }

  //Rectangles to cover Twitter card movement____________________________________________________________________
  pushStyle();
  noStroke();
  fill(#9b0707);
  //rect(545, 0, 510, 325);
  rect(width*0.340625, height*0, width*0.318749999, height*0.30222222);
  rect(width*0.340625, height*0.94777777, width*31.8749999, height*0.083333);
  //rect(545, 850, 510, 100);
  popStyle();

  pushStyle();
  strokeWeight(5);
  rect(width*0.355625, height*0.3088888, width*0.2899999, height*0.0555555);
  popStyle();

  pushStyle();
  strokeWeight(7);
  line(width*0.353125, height*0.94444444, width*0.646875, height*0.94444444);
  line(width*0.353125, height*0.30555555, width*0.646875, height*0.30555555);
  popStyle();

  pushStyle();
  textSize(24);
  fill(#000000);
  text("Tweets by @SouthCarletonHS", width*0.390625, height*0.35);
  popStyle();


  //World News__________________________________________________________________________________________________________
  //World news rectangle_______________________________________
  pushStyle();
  strokeWeight(10);
  rect(width*0.015625, height*0.66666666, width*0.3125, height*0.27777777, 15);
  popStyle();
  for (int i=0; i<5; i++) {
    //Direction of Scrolling_____________________________________________
    if (y1[4]>1370) {
      direction1=0;
    } else if (y1[4]<660) {
      direction1=1;
    }

    if (direction1==1) {
      move1+=0.09;
    } else if (direction1==0) {
      move1-=0.09;
    }
    y1[i]=(670+(175*i))+move1;

    //Rectangles_____________________________________________________________________
    pushStyle();
    strokeWeight(5);
    rect(width*0.03125, y1[i], width*0.28125, height*0.1833333, 5);
    popStyle();

    pushStyle();
    textSize(16);
    fill(#000000);
    textAlign(CENTER);
    if (i==0) {
      text(bits40[0], width*0.03125, (685+(175*i))+move1, width*0.28125, height*0.111111);
    } else if (i==1) {
      text(bits46[0], width*0.03125, (685+(175*i))+move1, width*0.28125, height*0.111111);
    } else if (i==2) {
      text(bits52[0], width*0.03125, (685+(175*i))+move1, width*0.28125, height*0.111111);
    } else if (i==3) {
      text(bits58[0], width*0.03125, (685+(175*i))+move1, width*0.28125, height*0.111111);
    } else if (i==4) {
      text(bits64[0], width*0.03125, (685+(175*i))+move1, width*0.28125, height*0.111111);
    }
    popStyle();

    pushStyle();
    textSize(14);
    fill(#000000);
    if (i==0) {
      text(bits42[0], width*0.125, (710+(175*i))+move1, width*0.178125, height*0.111111);
    } else if (i==1) {
      text(bits48[0], width*0.125, (710+(175*i))+move1, width*0.178125, height*0.111111);
    } else if (i==2) {
      text(bits54[0], width*0.125, (710+(175*i))+move1, width*0.178125, height*0.111111);
    } else if (i==3) {
      text(bits60[0], width*0.125, (710+(175*i))+move1, width*0.178125, height*0.111111);
    } else if (i==4) {
      text(bits66[0], width*0.125, (710+(175*i))+move1, width*0.178125, height*0.111111);
    }
    popStyle();

    if (i==0) {
      image(newsimg[1], width*0.040625, (710+(175*i))+move1);
    } else if (i==1) {
      image(newsimg[2], width*0.040625, (710+(175*i))+move1);
    } else if (i==2) {
      image(newsimg[3], width*0.040625, (710+(175*i))+move1);
    } else if (i==3) {
      image(newsimg[4], width*0.040625, (710+(175*i))+move1);
    } else if (i==4) {
      image(newsimg[5], width*0.040625, (710+(175*i))+move1);
    }
  }

  //Cover rectanlges & lines___________________________________________
  pushStyle();
  strokeWeight(7);
  rect(width*0.01875, height*0.664444444, width*0.30625000000, height*0.066666666, 10);
  popStyle();

  pushStyle();
  noStroke();
  fill(#9b0707);
  rect(width*0.01875, height*0, width*0.306250000000, height*0.145555555, 10);
  popStyle();

  pushStyle();
  noStroke();
  fill(#9b0707);
  rect(width*0.01875, height*0.63888888, width*0.30625000000, height*0.02222222);
  popStyle();

  pushStyle();
  noStroke();
  fill(#9b0707);
  rect(width*0.01875, height*0.94666666, width*0.30625000000, height*0.055555555);
  popStyle();

  pushStyle();
  strokeWeight(7);
  line(width*0.01875, height*0.944444444, width*0.325, height*0.94444444444);
  popStyle();


  BBCw=round(width*0.140625);
  BBCh=round(height*0.06111111);
  BBC.resize(BBCw, BBCh);
  image(BBC, width*0.109375, height*0.666666666);

  //Cover world news cards______________________________________________________________________
  //School News_________________________________________________________
  pushStyle();
  strokeWeight(10);
  rectMode(CENTER);
  rect(width*0.171875, height*0.39444444, width*0.3125, height*0.48888888, 15);
  popStyle();

  pushStyle();
  fill(#000000);
  textSize(48);
  textAlign(CENTER);
  text("School News", width*0.171875, height*0.198888888);
  popStyle();

  //Card 1__________________________________________
  pushStyle();
  rectMode(CENTER);
  strokeWeight(5);
  rect(width*0.171875, height*0.311111111, width*0.302083333, height*0.21, 7);
  rect(width*0.171875, height*0.52222222, width*0.302083333, height*0.21, 7);
  popStyle();

  pushStyle();
  card1.resize(150, 104);
  strokeWeight(5);
  stroke(#9b0707);
  rect(width*0.028125, height*0.261111111, card1.width+5, card1.height+5);
  image(card1, width*0.03, height*0.26444444);
  popStyle();

  pushStyle();
  if (bits26[0].length()>28) {
    textSize(18);
  } else {
    textSize(20);
  }
  fill(#000000);
  textAlign(CENTER);
  text(bits26[0], width*0.171875, height*0.23888888);
  popStyle();

  pushStyle();
  textSize(16);
  fill(#000000);
  textAlign(CENTER);
  text(bits28[0], width*0.078125, height*0.40555555);
  popStyle();

  pushStyle();
  if (width<=1440) {
    textSize(11);
  } else {
    textSize(12);
  }
  fill(#000000);
  textAlign(LEFT);
  text(bits30[0], width*0.140625, height*0.255555555, width*0.171875, height*0.388888);
  popStyle();

  //Card 2_____________________________________

  pushStyle();
  card2.resize(150, 104);
  strokeWeight(5);
  stroke(#9b0707);
  rect(width*0.028125, height*0.4722222222, card2.width+5, card1.height+5);
  image(card2, width*0.03, height*0.47555555);
  popStyle();

  pushStyle();
  if (bits32[0].length()>28) {
    textSize(18);
  } else {
    textSize(24);
  }
  fill(#000000);
  textAlign(CENTER);
  text(bits34[0], width*0.171875, height*0.45);
  popStyle();

  pushStyle();
  textSize(16);
  fill(#000000);
  textAlign(CENTER);
  text(bits36[0], width*0.078125, height*0.61666666);
  popStyle();

  pushStyle();
  if (width<=1440) {
    textSize(11);
  } else {
    textSize(12);
  }
  fill(#000000);
  textAlign(LEFT);
  text(bits38[0], width*0.140625, height*0.466666666, width*0.171875, height*0.3888888);
  popStyle();

  //Title&Time________________________________________________________________________________________________________________________________________________
  int h=hour();
  int m=minute();
  int d=day();
  int M=month();
  int Y=year();
  //Title_______________________________________________

  pushStyle();
  textAlign(CENTER);
  textSize(64);
  text("South Carleton High School", width/2, height*0.078125);
  strokeWeight(4);
  stroke(#FFFFFF);
  line(width*0.0520833332, height*0.0885416666667, width*0.94791667, height*0.0885416666667);
  popStyle();



  //Time__________________________________________________
  pushStyle();
  textAlign(CENTER);
  fill(#9b0707);
  strokeWeight(6);
  stroke(#FFFFFF);
  rectMode(CENTER);
  rect(width/2, height*0.2000, width*0.20625, height*0.1475208333, 7);
  popStyle();

  if (h>11) {
    ampm="PM";
  } else {
    ampm="AM";  //Tell the person it is am instead of pm!!!!!!!!!!!!!!!!!!!!!!!!!!
  }
  if (h>12) {
    h=h-12;
  }

  pushStyle();
  textSize(64);
  textAlign(CENTER);
  if (m>=10) {
    text(h+":"+m+ampm, width/2, height*0.25);
  } else {
    text(h+":"+"0"+m+ampm, width/2, height*0.25);
  }
  popStyle();

  pushStyle();
  textAlign(CENTER);
  textSize(46);
  text(M+"/"+d+"/"+Y, width/2, height*0.171875);
  popStyle();
}
