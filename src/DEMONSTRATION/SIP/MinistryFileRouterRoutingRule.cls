/// 
Class SIP.MinistryFileRouterRoutingRule Extends Ens.Rule.Definition
{

Parameter RuleAssistClass = "EnsLib.MsgRouter.RuleAssist";

XData RuleDefinition [ XMLNamespace = "http://www.intersystems.com/rule" ]
{
<ruleDefinition alias="" context="EnsLib.MsgRouter.RoutingEngine" production="SIP.MinistryBatchProductiond">
<ruleSet name="" effectiveBegin="" effectiveEnd="">
<rule name="">
<when condition="GetFirstMinistryCode(Document) Contains &quot;TXAUS&quot;">
<send transform="X12.InterChangeTransformation" target="AustinX12BatchOutput"></send>
<return></return>
</when>
</rule>
<rule name="">
<when condition="GetFirstMinistryCode(Document) Contains &quot;TNNAS&quot;">
<send transform="ASCN.DTL.LFO5.BatchDTL" target="NashvilleBatchFileOutput"></send>
<return></return>
</when>
</rule>
<rule name="">
<when condition="GetFirstMinistryCode(Document) Contains &quot;ININD&quot;">
<send transform="ASCN.DTL.LFO5.BatchDTL" target="IndianapolisBatchFileOutput"></send>
<return></return>
</when>
</rule>
</ruleSet>
</ruleDefinition>
}

}
