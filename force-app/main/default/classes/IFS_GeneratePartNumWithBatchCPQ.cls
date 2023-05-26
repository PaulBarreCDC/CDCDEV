global class IFS_GeneratePartNumWithBatchCPQ implements Database.Batchable<sObject>, Database.Stateful, Database.AllowsCallouts {

    private String orderId;
    private String accountId;
    private boolean orderSyncFlag; 
    List<String> product2Ids;
    String query;

    public IFS_GeneratePartNumWithBatchCPQ(
        String orderId, 
        String accountId, 
        boolean orderSyncFlag
    ) {

        this.orderId = orderId;
        this.accountId = accountId;
        this.orderSyncFlag = orderSyncFlag;
        this.product2Ids = new List<String>();
        this.query = 
            'SELECT Id, Product2Id, Quantity, TotalPrice ' +
            'FROM OrderItem ' + 
            'WHERE OrderId = ' + orderId + 
            'AND Line_Status__c IN (\'Primary\', \'Blocked\', \'Unblock\')';

    }
    
    global Database.QueryLocator start(
        Database.BatchableContext bc
    ) { 

        return Database.getQueryLocator(query);

    }

    global void execute(Database.BatchableContext bc, List<OrderItem> orderLines) {

        for (OrderItem item : orderLines) {
            product2Ids.add(item.Product2Id);
        }

        if (product2Ids.size() > 0) {

            cdcpc.PartNumber_Host.ensurePartNumber(product2Ids);

            List<cdcpc.IFSXML_Result> parts = new List<cdcpc.IFSXML_Result>();
            for (OrderItem item : orderLines) {
                cdcpc.IFSXML_Result res = cdcpc.IFSXML_Host.getIFSXML(item.Product2Id, (Integer)item.Quantity, item.TotalPrice);
                //if (res.isSuccess && res.result != null && res.result != '') {
                if (res.result != null && res.result != '') {
                    parts.add(res);
                }
            }

            if (parts.size() > 0) {
                IFS_ConstructPartReqWithBatchCPQ partsBatch = new IFS_ConstructPartReqWithBatchCPQ(orderId, accountId, orderSyncFlag, parts);
                Database.executeBatch(partsBatch);
            }
            else if (orderSyncFlag) {
                String xmlRequest = IFS_ConstructOrderReqCPQ.generateReq(orderId);
                IFS_MakeHTTPCall.makeHTTPCallOutNdLog(xmlRequest, accountId, null, accountId, null, 'Order', orderId, null);
            }

        }

    }

    global void finish(Database.BatchableContext bc) {

    }

}