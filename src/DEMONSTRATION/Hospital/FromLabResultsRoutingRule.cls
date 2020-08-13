/// 
Class Hospital.FromLabResultsRoutingRule Extends Ens.Rule.Definition [ ProcedureBlock ]
{

Parameter RuleAssistClass = "EnsLib.HL7.MsgRouter.RuleAssist";

XData RuleDefinition [ XMLNamespace = "http://www.intersystems.com/rule" ]
{
<ruleDefinition alias="Hospital.From_Lab_ResultsRoutingRule" context="EnsLib.HL7.MsgRouter.RoutingEngine" production="Hospital.HospitalProduction">
<ruleSet name="" effectiveBegin="" effectiveEnd="">
<rule name="" disabled="false">
<constraint name="source" value="From_Lab_Results"></constraint>
<constraint name="docCategory" value="2.4"></constraint>
<constraint name="docName" value="ORU_R01"></constraint>
<when condition="1">
<send transform="" target="To_Cerner_Results"></send>
<return></return>
</when>
</rule>
</ruleSet>
</ruleDefinition>
}

}
