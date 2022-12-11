public class ChartController {
    
    // Return a list of data points for a chart
    public List<Data> getData() {
        return ChartController.getChartData();
    }
    

    public static List<Data> getRemoteData() {
        return ChartController.getChartData();
    }

    // The actual chart data; needs to be static to be
    public static List<Data> getChartData() {
        List<Data> data = new List<Data>();

        List<Temperature__c> ts = [select timestamp__c, temperature__c from temperature__c limit 10];

        for (Temperature__c t : ts){

            data.add(new Data(t.timestamp__c, t.temperature__c));
        }
        return data;
    }
    
    // Wrapper class
    public class Data {
        public String timestamp { get; set; }
        public Decimal temperature { get; set; }

        public Data(Time timestamp, Decimal temperature) {
            this.timestamp = String.valueOf(timestamp.hour()) +':'+ String.valueOf(timestamp.minute());
            this.temperature = temperature;
        }
    }
}