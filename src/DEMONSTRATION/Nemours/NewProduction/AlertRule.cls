/// 
Class Nemours.NewProduction.AlertRule Extends Ens.Rule.Definition
{

Parameter RuleAssistClass = "EnsLib.MsgRouter.RuleAssist";

XData RuleDefinition [ XMLNamespace = "http://www.intersystems.com/rule" ]
{
<ruleDefinition alias="" context="EnsLib.MsgRouter.RoutingEngine" production="AlertDemo.AlertDemo">
<ruleSet name="" effectiveBegin="" effectiveEnd="">
<rule name="" disabled="false">
<constraint name="msgClass" value="Ens.AlertRequest"></constraint>
<when condition="1">
<send transform="" target="EmailAlert"></send>
<send transform="OpeningDemo.AlertToMappedFile" target="AlertsOutToFile"></send>
<send transform="" target="AlertManager"></send>
</when>
</rule>
</ruleSet>
</ruleDefinition>
}

}
