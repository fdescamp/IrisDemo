/// 
Class Hospital.FromAthenaMultiRoutingRule Extends Ens.Rule.Definition
{

Parameter RuleAssistClass = "EnsLib.HL7.MsgRouter.RuleAssist";

XData RuleDefinition [ XMLNamespace = "http://www.intersystems.com/rule" ]
{
<ruleDefinition alias="Hospital.From_Athena_MultiRoutingRule" context="EnsLib.HL7.MsgRouter.RoutingEngine" production="Hospital.HospitalProduction">
<ruleSet name="" effectiveBegin="" effectiveEnd="">
<rule name="Athena ADT Rule">
<constraint name="source" value="From_Athena_Multi"></constraint>
<constraint name="docCategory" value="2.5"></constraint>
<constraint name="docName" value="ADT_A01,ADT_A02,ADT_A03,ADT_A04,ADT_A05,ADT_A06,ADT_A07,ADT_A08,ADT_A17,ADT_A31"></constraint>
<when condition="HL7.{PV1:PatientClass}=&quot;O&quot;">
<send transform="" target="To_Intellilab,To_Lab"></send>
<return></return>
</when>
</rule>
<rule name="Athena ORM Rule" disabled="false">
<constraint name="source" value="From_Athena_Multi"></constraint>
<constraint name="docCategory" value="2.5"></constraint>
<constraint name="docName" value="ORM_O01"></constraint>
<when condition="1">
<send transform="" target="To_Intellilab"></send>
<return></return>
</when>
</rule>
<rule name="Athena MDM Rule" disabled="false">
<constraint name="source" value="From_Athena_Multi"></constraint>
<constraint name="docCategory" value="2.5"></constraint>
<constraint name="docName" value="MDM_T02,MDM_T03"></constraint>
<when condition="1">
<send transform="" target="To_Cerner_Results"></send>
<return></return>
</when>
</rule>
</ruleSet>
</ruleDefinition>
}

}
