Class Nemours.LookupGenderAndPad Extends Ens.DataTransformDTL [ DependsOn = EnsLib.HL7.Message ]
{

XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform sourceClass='EnsLib.HL7.Message' targetClass='EnsLib.HL7.Message' sourceDocType='NemoursADT:ADT_A01' targetDocType='NemoursADT:ADT_A01' create='copy' language='objectscript' >
<annotation>Changes gender to full word</annotation>
<code>
<![CDATA[ /*]]></code>
<assign value='##class(AlertDemo.custom.TriggerAlert).TriggerAlert("Test of alert called from a transformation")' property='junk' action='set' />
<code>
<![CDATA[ */]]></code>
<assign value='..Lookup("Gender",source.{PID:Sex},source.{PID:Sex},"Unknown")' property='target.{PID:Sex}' action='set' />
<assign value='..ToUpper(..Pad(source.{PID:PatientName.familyname},12))' property='target.{PID:PatientName.familyname}' action='set' />
<assign value='%Ensemble("%Process").%PrimaryRequestHeader.MessageBodyId' property='target.{MSH:SendingApplication}' action='set' />
<assign value='source.Source' property='target.{MSH:SendingFacility}' action='set' />
</transform>
}

Parameter IGNOREMISSINGSOURCE = 1;

Parameter REPORTERRORS = 1;

}
