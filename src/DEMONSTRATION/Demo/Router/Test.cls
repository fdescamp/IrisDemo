/// 
Class Demo.Router.Test Extends Ens.Rule.Definition
{

Parameter RuleAssistClass = "EnsLib.HL7.MsgRouter.RuleAssist";

XData RuleDefinition [ XMLNamespace = "http://www.intersystems.com/rule" ]
{
<ruleDefinition alias="" context="EnsLib.HL7.MsgRouter.RoutingEngine" production="Demo.DEV">
<ruleSet name="" effectiveBegin="" effectiveEnd="">
<send transform="" target="destination"></send>
</ruleSet>
</ruleDefinition>
}

}
