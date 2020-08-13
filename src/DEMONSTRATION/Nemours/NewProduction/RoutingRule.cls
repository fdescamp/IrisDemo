/// 
Class Nemours.NewProduction.RoutingRule Extends Ens.Rule.Definition
{

Parameter RuleAssistClass = "EnsLib.HL7.MsgRouter.RuleAssist";

XData RuleDefinition [ XMLNamespace = "http://www.intersystems.com/rule" ]
{
<ruleDefinition alias="" context="EnsLib.HL7.MsgRouter.RoutingEngine" production="Nemours.NewProduction">
<ruleSet name="" effectiveBegin="" effectiveEnd="">
<rule name="Multiple sends in one rule" disabled="false">
<constraint name="source" value="FromADT"></constraint>
<constraint name="docCategory" value="NemoursADT"></constraint>
<constraint name="docName" value="ADT_A04"></constraint>
<when condition="1">
<send transform="Nemours.EpicADTtoRadiology" target="ADTtoRadiology"></send>
<send transform="" target="ADTtoLab"></send>
<send transform="Nemours.LookupGenderAndPad" target="ADTtoOther"></send>
</when>
</rule>
<rule name="Single send to allow disable" disabled="true">
<constraint name="source" value="FromADT"></constraint>
<constraint name="docCategory" value="NemoursADT"></constraint>
<constraint name="docName" value="ADT_A04"></constraint>
<when condition="1">
<send transform="" target="ADTtoRadiology"></send>
<return></return>
</when>
</rule>
</ruleSet>
</ruleDefinition>
}

}
