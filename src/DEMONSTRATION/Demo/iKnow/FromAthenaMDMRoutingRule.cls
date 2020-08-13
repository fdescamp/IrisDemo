/// 
Class Demo.iKnow.FromAthenaMDMRoutingRule Extends Ens.Rule.Definition
{

Parameter RuleAssistClass = "EnsLib.HL7.MsgRouter.RuleAssist";

XData RuleDefinition [ XMLNamespace = "http://www.intersystems.com/rule" ]
{
<ruleDefinition alias="" context="EnsLib.HL7.MsgRouter.RoutingEngine" production="Demo.iKnow.Prod">
<ruleSet name="" effectiveBegin="" effectiveEnd="">
<rule name="">
<constraint name="source" value="FromAthenaMDM"></constraint>
<constraint name="docCategory" value="2.5"></constraint>
<constraint name="docName" value="MDM_T02"></constraint>
<when condition="1">
<send transform="iKnow.MDMUnstructuredToORUStructured" target="ToCernerObservations"></send>
<return></return>
</when>
</rule>
</ruleSet>
</ruleDefinition>
}

}
