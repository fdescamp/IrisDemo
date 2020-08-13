/// 
Class SIP.AustinBatchFileRouterRoutingRule Extends Ens.Rule.Definition
{

Parameter RuleAssistClass = "EnsLib.MsgRouter.RuleAssist";

XData RuleDefinition [ XMLNamespace = "http://www.intersystems.com/rule" ]
{
<ruleDefinition alias="" context="EnsLib.MsgRouter.RoutingEngine" production="SIP.MinistryBatchProductiond">
<ruleSet name="" effectiveBegin="" effectiveEnd="">
<rule name="">
<when condition="1">
<send transform="X12.InterChangeTransformation" target="AustinX12BatchOutput"></send>
<return></return>
</when>
</rule>
</ruleSet>
</ruleDefinition>
}

}
