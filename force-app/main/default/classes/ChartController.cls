public class ChartController {

    public Boolean refresh {get; set;}

    public ChartController() {
        refresh=false;
    }
    
    // Return a list of data points for a chart
    public List<Data> getData() {
        return ChartController.getChartData();
    }
    

    public static List<Data> getRemoteData() {
        return ChartController.getChartData();
    }

    public static List<Data> getChartData() {
        List<Data> data = new List<Data>();

        List<Temperature__c> ts = [SELECT timestamp__c, temperature__c 
                                    FROM temperature__c 
                                    ORDER BY timestamp__c DESC 
                                    LIMIT 10];

        for (Integer i=ts.size()-1;i>=0;){

            data.add(new Data(ts[i].timestamp__c, ts[i].temperature__c));
            i--;
        }

        return data;
    }
    
    // Wrapper class
    public class Data {
        public String timestamp { get; set; }
        public Decimal temperature { get; set; }

        public Data(DateTime timestamp, Decimal temperature) {
            this.timestamp = timestamp.format('HH:mm:ss');
            //String.valueOf(timestamp.hour()) +':'+ String.valueOf(timestamp.minute()) +':'+ String.valueOf(timestamp.second());
            this.temperature = temperature;
        }
    }
}