/// 
Class SIP.MinistryBatchFileRouterRoutingRule Extends Ens.Rule.Definition
{

Parameter RuleAssistClass = "EnsLib.MsgRouter.RuleAssist";

XData RuleDefinition [ XMLNamespace = "http://www.intersystems.com/rule" ]
{
<ruleDefinition alias="" context="EnsLib.MsgRouter.RoutingEngine" production="SIP.MinistryBatchProductiond">
<ruleSet name="" effectiveBegin="" effectiveEnd="">
<rule name="Nashville Rule">
<constraint name="source" value="MinistryBatchFileService"></constraint>
<constraint name="msgClass" value="SIP.MinistryBatch.Record"></constraint>
<when condition="Document.Ministry=&quot;Nashville&quot;">
<send transform="SIP.MinistryBatchRecordToNashvilleBatchRecord" target="BatchFileOutput"></send>
<return></return>
</when>
</rule>
</ruleSet>
</ruleDefinition>
}

}
