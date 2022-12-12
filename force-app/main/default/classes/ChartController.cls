public class ChartController {

    
    // Return a list of data points for a chart
    public List<ChartData> getData() {
        return ChartController.getChartData();
    }

    public static List<ChartData> getChartData() {
        List<ChartData> data = new List<ChartData>();

        List<Temperature__c> ts = [SELECT timestamp__c, temperature__c 
                                    FROM temperature__c 
                                    ORDER BY timestamp__c DESC 
                                    LIMIT 10];

        for (Integer i=ts.size()-1;i>=0;){

            data.add(new ChartData(ts[i].timestamp__c, ts[i].temperature__c));
            i--;
        }

        return data;
    }
    
    // Wrapper class
    public class ChartData {
        public String timestamp { get; set; }
        public Decimal temperature { get; set; }

        public ChartData(DateTime timestamp, Decimal temperature) {
            this.timestamp = timestamp.format('HH:mm:ss');
            this.temperature = temperature;
        }
    }
}