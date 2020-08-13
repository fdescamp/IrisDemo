/// 
Class Hospital.FromEpicADTRoutingRule Extends Ens.Rule.Definition [ ProcedureBlock ]
{

Parameter RuleAssistClass = "EnsLib.HL7.MsgRouter.RuleAssist";

XData RuleDefinition [ XMLNamespace = "http://www.intersystems.com/rule" ]
{
<ruleDefinition alias="Hospital.From_Epic_ADTRoutingRule" context="EnsLib.HL7.MsgRouter.RoutingEngine" production="Hospital.HospitalProduction">
<ruleSet name="" effectiveBegin="" effectiveEnd="">
<rule name="ADT To Lab" disabled="false">
<constraint name="source" value="From_Epic_ADT"></constraint>
<constraint name="docCategory" value="2.4"></constraint>
<constraint name="docName" value="ADT_A01,ADT_A08,ADT_A04,ADT_A05"></constraint>
<when condition="(HL7.{PV1:PatientClass}!=&quot;O&quot;)&amp;&amp;((HL7.{PV1:PatientClass} In &quot;I,XYZ,ABC&quot;)||(HL7.{PV1:PatientClass} In &quot;xyz,abc,123&quot;))">
<send transform="LookupSample.LookupSampleDTL" target="To_Lab"></send>
</when>
</rule>
<rule name="ADT To Radiology" disabled="false">
<constraint name="source" value="From_Epic_ADT"></constraint>
<constraint name="docCategory" value="2.4"></constraint>
<constraint name="docName" value="ADT_A01,ADT_A08,ADT_A02,ADT_A04"></constraint>
<when condition="((HL7.{PV1:PatientClass} In &quot;I,O,ER,ED&quot;)&amp;&amp;(HL7.{MSH:SendingFacility}=&quot;Cape Canaveral&quot;)&amp;&amp;(HL7.{MSH:4} In &quot;X,Y&quot;)&amp;&amp;(HL7.{PV1:PatientClass}=&quot;XYZ&quot;)&amp;&amp;(HL7.{PID:PatientID.ID}=&quot;1234&quot;))||(HL7.{MSH:SendingFacility}=&quot;BAYSTATE&quot;)||(HL7.{PV1:PatientClass}=ToUpper(&quot;Outpatient&quot;))">
<send transform="" target="To_Radiology"></send>
</when>
</rule>
<rule name="ADT To Dictaphone" disabled="false">
<constraint name="source" value="From_Epic_ADT"></constraint>
<constraint name="docCategory" value="2.4"></constraint>
<constraint name="docName" value="ADT_A01,ADT_A08"></constraint>
<when condition="((HL7.{PV1:PatientClass} In &quot;I,E,O&quot;)||((HL7.{PV1:PatientClass} StartsWith &quot;I&quot;)&amp;&amp;(HL7.{MSH:SendingApplication}=&quot;CERNER&quot;)&amp;&amp;((HL7.{PV1:PatientClass}=&quot;123&quot;)||(HL7.{PV1:PatientClass} StartsWith &quot;BDBD&quot;)||(HL7.{PID:3} StartsWith &quot;99&quot;))))&amp;&amp;Exists(&quot;GenderLookup&quot;,HL7.{PID:AdministrativeSex})&amp;&amp;(HL7.{PID:PatientID.ID}=&quot;123&quot;)">
<send transform="" target="To_Dictaphone"></send>
<return></return>
</when>
</rule>
<rule name="ADT To Intellilab" disabled="false">
<constraint name="source" value="From_Epic_ADT"></constraint>
<constraint name="docCategory" value="2.4"></constraint>
<constraint name="docName" value="ADT_A01,ADT_A02,ADT_A03,ADT_A04,ADT_A05,ADT_A06,ADT_A07,ADT_A08"></constraint>
<when condition="1">
<send transform="" target="To_Intellilab"></send>
<return></return>
</when>
</rule>
<rule name="ADT To Intellilab" disabled="false">
<constraint name="source" value="From_Epic_ADT"></constraint>
<constraint name="docCategory" value="2.5"></constraint>
<constraint name="docName" value="ADT_A01"></constraint>
<when condition="(HL7.{PV1:PatientClass}=&quot;o&quot;)&amp;&amp;(HL7.{MSH:5}=&quot;12345&quot;)&amp;&amp;((HL7.{PV1:4}=&quot;XYX&quot;)||(HL7.{MSH:SendingApplication} StartsWith &quot;ABC&quot;))">
<send transform="" target="To_Intellilab"></send>
<return></return>
</when>
</rule>
<rule name="TraceStatements" disabled="true">
<constraint name="source" value="From_Epic_ADT"></constraint>
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
