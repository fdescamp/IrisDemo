/// 
Class Demo.WebService.Process Extends Ens.BusinessProcessBPL [ ClassType = persistent, ProcedureBlock ]
{

/// BPL Definition
XData BPL [ XMLNamespace = "http://www.intersystems.com/bpl" ]
{
<process language='objectscript' request='Demo.WebService.PatientRequest' response='Demo.WebService.PatientResponse' height='2000' width='2000' >
<sequence xend='200' yend='450' >
<call name='Call SQL Operation' target='Demographies' async='0' xpos='200' ypos='250' >
<annotation><![CDATA[Obtenir information démographiques]]></annotation>
<request type='Demo.WebService.PatientRequest' >
<assign property="callrequest.MRN" value="request.MRN" action="set" />
</request>
<response type='Demo.WebService.PatientResponse' >
<assign property="response" value="callresponse" action="set" />
</response>
</call>
<call name='Call SOAP Operation' target='Allergies' async='0' xpos='200' ypos='350' >
<annotation><![CDATA[Obtenir liste allergies du patient]]></annotation>
<request type='Demo.WebService.SOAP.Request.GetAllergyByMRNRequest' >
<assign property="callrequest.MRN" value="request.MRN" action="set" />
</request>
<response type='Demo.WebService.SOAP.Response.GetAllergyByMRNResponse' >
<assign property="response.Allergy" value="callresponse.GetAllergyByMRNResult" action="set" />
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
