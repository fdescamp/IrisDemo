Class Demo.FHIR.DTL.ADTA01ToFHIR Extends Ens.DataTransformDTL [ DependsOn = (EnsLib.HL7.Message, HS.Message.FHIR.Request) ]
{

Parameter IGNOREMISSINGSOURCE = 1;

Parameter REPORTERRORS = 1;

Parameter TREATEMPTYREPEATINGFIELDASNULL = 0;

XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform sourceClass='EnsLib.HL7.Message' targetClass='HS.Message.FHIR.Request' sourceDocType='2.5.1:ADT_A01' create='new' language='objectscript' >
<annotation>Transform an HL7 V2.5.1 ADT^A01 message to a FHIR message</annotation>
<assign value='##class(HS.FHIR.DTL.Utils).FHIRDateTime(source.{MSH:DateTimeOfMessage.Time})' property='target.ResourceContainer.Bundle.entry.(1).resource.MessageHeader.timestamp.value' action='set' />
<assign value='source.{MSH:MessageType.TriggerEvent}' property='target.ResourceContainer.Bundle.entry.(1).resource.MessageHeader.event.code.value' action='set' />
<assign value='source.{MSH:SendingApplication}' property='target.ResourceContainer.Bundle.entry.(1).resource.MessageHeader.source.name.value' action='set' />
<assign value='source.{MSH:ReceivingApplication}' property='target.ResourceContainer.Bundle.entry.(1).resource.MessageHeader.destination.(1).name.value' action='set' />
<assign value='"transaction"' property='target.Interaction' action='set' />
<assign value='"Bundle"' property='target.Type' action='set' />
<assign value='"application/xml+fhir"' property='target.ContentType' action='set' />
<assign value='source.{PID:PatientID.IDNumber}' property='target.ResourceContainer.Bundle.entry.(2).resource.Patient.identifier.(1).value.value' action='set' />
<assign value='"usual"' property='target.ResourceContainer.Bundle.entry.(2).resource.Patient.name.(1).use.value' action='set' />
<assign value='source.{PID:PatientName().FamilyName}' property='target.ResourceContainer.Bundle.entry.(2).resource.Patient.name.(1).family.(1).value' action='set' />
<assign value='$Case(source.{PID:AdministrativeSex},"M":"male","F":"female",:"unknown")' property='target.ResourceContainer.Bundle.entry.(2).resource.Patient.gender.value' action='set' />
<assign value='source.{PID:PatientName().GivenName}' property='target.ResourceContainer.Bundle.entry.(2).resource.Patient.name.(1).given.(1).value' action='set' />
<assign value='"transaction"' property='target.ResourceContainer.Bundle.type.value' action='set' />
<assign value='"POST"' property='target.ResourceContainer.Bundle.entry.(1).request.method.value' action='set' />
<assign value='"POST"' property='target.ResourceContainer.Bundle.entry.(2).request.method.value' action='set' />
<assign value='"MessageHeader/167ecd40-57fa-11e6-a5de-7831c1b7edac"' property='target.ResourceContainer.Bundle.entry.(1).request.url.value' action='set' />
<assign value='"Patient/183d9206-57fa-11e6-a5de-7831c1b7edac"' property='target.ResourceContainer.Bundle.entry.(2).request.url.value' action='set' />
<assign value='"MessageHeader/167ecd40-57fa-11e6-a5de-7831c1b7edac"' property='target.ResourceContainer.Bundle.entry.(1).fullUrl.value' action='set' />
<assign value='"Patient/183d9206-57fa-11e6-a5de-7831c1b7edac"' property='target.ResourceContainer.Bundle.entry.(2).fullUrl.value' action='set' />
</transform>
}

}
