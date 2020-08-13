/// 
Class Demo.XMLCSV.PatientXMLRouter Extends Ens.Rule.Definition
{

Parameter RuleAssistClass = "EnsLib.MsgRouter.RuleAssist";

XData RuleDefinition [ XMLNamespace = "http://www.intersystems.com/rule" ]
{
<ruleDefinition alias="" context="EnsLib.MsgRouter.RoutingEngine" production="Demo.XMLToCSV">
<ruleSet name="" effectiveBegin="" effectiveEnd="">
<rule name="">
<when condition="1">
<send transform="Demo.XMLCSV.XMLtoCSV" target="PatientCSV"></send>
<return></return>
</when>
</rule>
</ruleSet>
</ruleDefinition>
}

}
