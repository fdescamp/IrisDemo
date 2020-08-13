/// 
Class Demo.FHIR.BPL.V2ToFHIR Extends Ens.BusinessProcessBPL
{

/// BPL Definition
XData BPL [ XMLNamespace = "http://www.intersystems.com/bpl" ]
{
<process language='objectscript' request='EnsLib.HL7.Message' response='HS.Message.FHIR.Response' height='2000' width='2000' >
<context>
<property name='FHIRMessage' type='HS.Message.FHIR.Request' instantiate='1' />
<property name='FHIRResponse' type='HS.Message.FHIR.Response' collection='list' instantiate='0' />
</context>
<sequence xend='200' yend='550' >
<transform name='ToFHIR' class='Demo.FHIR.DTL.ADTA01ToFHIR' source='request' target='context.FHIRMessage' xpos='200' ypos='250' />
<code name='Update Payload' xpos='200' ypos='350' >
<![CDATA[ do context.FHIRMessage.UpdatePayloadFromContainer()	]]>
</code>
<call name='Send to Operation' target='HS.FHIR.REST.Operation' async='0' xpos='200' ypos='450' >
<request type='HS.Message.FHIR.Request' >
<assign property="callrequest" value="context.FHIRMessage" action="set" />
</request>
<response type='HS.Message.FHIR.Response' >
<assign property="response" value="callresponse" action="set" />
</response>
</call>
</sequence>
</process>
}

Storage Default
{
<Type>%Storage.Persistent</Type>
}

}
