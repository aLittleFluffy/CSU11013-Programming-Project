// Load Data
ArrayList[] data;
ArrayList<String> tickers;
ArrayList<Widget> widgets;
PFont font;

void setup(){
  String[] dataToLoad = loadStrings("daily_prices1k.csv");
  tickers = new ArrayList<String>();
  data = new ArrayList[0];
  loadData(dataToLoad);
  widgets = new ArrayList<Widget>();
}

void draw(){
  
}

void loadData(String[] dataToLoad){
    int addLocation = 0; //<>//
    for(String line : dataToLoad){ //<>//
        line += ","; // triggers adding dates to datapoint objects
        char[] charLine = line.toCharArray();
        String currentWord = "";
        int count = 0; //<>//
        Datapoint currdp = new Datapoint();
        
        for(char letter : charLine){ 
            if(letter != ','){
                currentWord += letter;
            } else {
                //println(currentWord);
                switch(count){ 
                    case(0):
                        int tickerLoc = tickers.indexOf(currentWord);
                        if(tickerLoc<0){
                            // Create new ticker
                            data = Arrays.copyOf(data, data.length+1);
                            data[data.length-1] = new ArrayList<Datapoint>();
                            addLocation = data.length-1;
                            tickers.add(currentWord);
                        } else {
                            // Exists
                            addLocation = tickerLoc;
                        }
                        break;
                    case(1):
                        currdp.setOpen_price(Float.valueOf(currentWord));
                        break;
                    case(2): //<>//
                        currdp.setClose_price(Float.valueOf(currentWord));
                        break;
                    case(3):
                        currdp.setAdjusted_close(Float.valueOf(currentWord));
                        break;
                    case(4): //<>//
                        currdp.setLow(Float.valueOf(currentWord));
                        break;
                    case(5):
                        currdp.setHigh(Float.valueOf(currentWord));
                        break;
                    case(6) : //<>//
                        currdp.setVolume(Integer.valueOf(currentWord));
                        break;
                    case(7):
                        try{
                        Date date = DATE_FORMAT.parse(currentWord);
                            currdp.setDate(date); //<>//
                        //  println(DATE_FORMAT.format(date));
                            break;  
                        } catch(Exception e){
                            println("Exception occured: ", e);
                        }
                }
                currentWord = "";
                count++;
            }
        }
        data[addLocation].add(currdp);
    }
}

ArrayList<Widget> createWidgets(){
    for(String ticker : tickers){

        print(ticker);
    }
}

/* 
String[] getTickers(ArrayList<Datapoint> dps){
    String[] returnArr = new String[0];
    for(Datapoint dp : dps){
        returnArr.copyOf(returnArr, returnArr.length+1);
        returnArr[returnArr.length-1]=dp.ticker;
    }
    return returnArr;
}
 */