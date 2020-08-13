/// 
Class Hospital.FromCernerADTRoutingRule Extends Ens.Rule.Definition [ ProcedureBlock ]
{

Parameter RuleAssistClass = "EnsLib.HL7.MsgRouter.RuleAssist";

XData RuleDefinition [ XMLNamespace = "http://www.intersystems.com/rule" ]
{
<ruleDefinition alias="Hospital.From_Cerner_ADTRoutingRule" context="EnsLib.HL7.MsgRouter.RoutingEngine" production="Hospital.HospitalProduction">
<ruleSet name="" effectiveBegin="" effectiveEnd="">
<rule name="ADT vers Lab" disabled="false">
<constraint name="source" value="Gestion Administrative"></constraint>
<constraint name="docCategory" value="2.4"></constraint>
<constraint name="docName" value="ADT_A01,ADT_A08,ADT_A04,ADT_A05"></constraint>
<when condition="HL7.{PV1:PatientClass}!=&quot;O&quot;">
<send transform="LookupSample.LookupSampleDTL" target="Laboratoire,TrakCare_TCP,Radiologie"></send>
</when>
</rule>
<rule name="ADT vers Radiologie" disabled="false">
<constraint name="source" value="Gestion Administrative"></constraint>
<constraint name="docCategory" value="2.4"></constraint>
<constraint name="docName" value="ADT_A01,ADT_A08,ADT_A02,ADT_A04"></constraint>
<when condition="1">
<send transform="" target="Pharmacie"></send>
</when>
</rule>
<rule name="ADT vers Dictaphone" disabled="false">
<constraint name="source" value="Gestion Administrative"></constraint>
<constraint name="docCategory" value="2.4"></constraint>
<constraint name="docName" value="ADT_A01,ADT_A08"></constraint>
<when condition="((HL7.{PV1:PatientClass} In &quot;I,E,O&quot;)||((HL7.{PV1:PatientClass} StartsWith &quot;I&quot;)&amp;&amp;(HL7.{MSH:SendingApplication}=&quot;CERNER&quot;)&amp;&amp;((HL7.{PV1:PatientClass}=&quot;123&quot;)||(HL7.{PV1:PatientClass} StartsWith &quot;BDBD&quot;)||(HL7.{PID:3} StartsWith &quot;99&quot;))))&amp;&amp;Exists(&quot;GenderLookup&quot;,HL7.{PID:AdministrativeSex})&amp;&amp;(HL7.{PID:PatientID.ID}=&quot;123&quot;)">
<send transform="" target="Dictaphone"></send>
</when>
</rule>
<rule name="ADT To DPI" disabled="false">
<when condition="1">
<send transform="LookupSample.LookupSampleDTL" target="DPI"></send>
</when>
</rule>
<rule name="TraceStatements" disabled="true">
<constraint name="source" value="From_Cerner_ADT"></constraint>
<constraint name="docCategory" value="2.4"></constraint>
<constraint name="docName" value="ADT_A01,ADT_A08,ADT_A03,ADT_A02,ADT_A04,ADT_A05"></constraint>
<when condition="1">
<trace value="&quot;PV1:2 = &quot;_HL7.{PV1:2}_&quot;  MSH:6 = &quot;_HL7.{MSH:6}_&quot;  PV1:2 = &quot;_HL7.{PV1:2}_&quot;  MSH:6 = &quot;_HL7.{MSH:6}_&quot;PV1:2 = &quot;_HL7.{PV1:2}_&quot;  MSH:6 = &quot;_HL7.{MSH:6}_&quot;  PV1:2 = &quot;_HL7.{PV1:2}_&quot;  MSH:6 = &quot;_HL7.{MSH:6}"></trace>
<trace value="&quot;MSH:6 = &quot;_HL7.{MSH:6}"></trace>
</when>
</rule>
</ruleSet>
</ruleDefinition>
}

}
