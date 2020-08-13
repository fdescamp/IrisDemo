/// 
Class SQLSample.RoutingRule Extends Ens.Rule.Definition [ ProcedureBlock ]
{

Parameter RuleAssistClass = "EnsLib.MsgRouter.RuleAssist";

XData RuleDefinition [ XMLNamespace = "http://www.intersystems.com/rule" ]
{
<ruleDefinition alias="" context="EnsLib.MsgRouter.RoutingEngine" production="">
<ruleSet name="" effectiveBegin="" effectiveEnd="">
<rule name="">
<constraint name="source" value="SQLSample.SQLBusinessService"></constraint>
<constraint name="msgClass" value="SQLSample.SQLSampleMessage"></constraint>
<when condition="1">
<send transform="SQLSample.SQLToHL7DTL" target="HL7FileOperation"></send>
<return></return>
</when>
</rule>
</ruleSet>
</ruleDefinition>
}

}
