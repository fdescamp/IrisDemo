Include (EnsConstants, EnsUI, Ensemble)

/// StartProduction
Class Demo.WebService.REST.PatientPage Extends %CSP.UI.Portal.Template
{

Parameter DOMAIN = "Demo";

/// User needs USE permissions on the %Ens_MessageContent resource to view this page.
Parameter RESOURCE = "%Ens_MessageContent:USE";

/// Displayed name of this page.
Parameter PAGENAME = "Demo REST Patient Service";

Parameter CSSINCLUDES = "ensemble/Ensemble_Wizards.css";

/// If true, then attempt to refresh this page when its session timeout period has expired.
/// This will cause a login page to display if the current session has ended
/// and security is set to require login.
Parameter AUTOLOGOUT As BOOLEAN = 0;

/// This XML block defines the contents of the page.
XData contentPane [ XMLNamespace = "http://www.intersystems.com/zen" ]
{
<pane>
<jsonProvider id="jpResponseInfo" OnGetTargetObject="GetResponseInfo">
<parameter id="riId" paramName="responseId"/>
</jsonProvider>
<hgroup cellVAlign="top">
<pane id="paneSelect" paneName="paneSelect"/>
<spacer width="15"/>
</hgroup>
<hgroup>
<spacer width="15"/>
<vgroup>
<!--<text name="txSession" id="txSession" label="Session ID" labelClass="labelRequired"
          title="View the Trace diagram for the REST service request and response." />
<text name="txURL" id="txURL" label="URL sent" labelClass="labelRequired" size="210" 
          title="The text of the REST service URL submitted to the server." />-->
<textarea name="txRawResponse" id="txRawResponse" label="Raw JSON Response" labelClass="labelRequired" height="900" width="400" cols="40" rows="17" 
          title="The full REST / JSON response received from the server." />
</vgroup>
</hgroup>
</pane>
}

XData paneSelect [ XMLNamespace = "http://www.intersystems.com/zen" ]
{
<pane xmlns="http://www.intersystems.com/zen" >
<vgroup id="mainPanel" cellAlign="center" groupClass="" enclosingClass="menuPanel"  valign="top">
<form name="fmSelect" id="fmSelect" layout="vertical" cellStyle="padding: 2px 10px; font-size:0.8em;">

<hgroup>
<text name="mrn" id="mrn" label="MRN" labelClass="labelRequired" size="21" 
          title="Enter an MRN to use in identifying which patient records to search." />
</hgroup>

<button controlClass="commandButton" id="btnRetrieve" caption="Retrieve" onclick="zenPage.retrieveRec();"
		title="Retrieve patient records matching the above retrieval criteria" />
</form>
</vgroup>
</pane>
}

ClientMethod retrieveRec() [ Language = javascript ]
{
	var val = zen('mrn').getValue();


	if ('' == val) { alert($$$Text('You must enter an MRN value.')); return }

	var result = zenPage.DoRetrieve(val);
	
	var parm = zen('riId');
	var ids = result.split('|');
	var id = parseInt(ids[1]);
	if (id > 0) {
		parm.value = id;
		zenPage.currRespId = id;
		zenPage.currmrn = val;
	} else {
		parm.value = '';
		var err = result;
		if (err && ('' != err)) alert(err);
	}
	zenPage.refresh();
}

ClassMethod DoRetrieve(val As %String) As %ZEN.Datatype.string [ ZenMethod ]
{
	Set tSC = ##class(Ens.Director).CreateBusinessService("EnsLib.Testing.Service",.tService)  Quit:$$$ISERR(tSC) $$$StatusDisplayString(tSC)
	Set tTestRequest = ##class(EnsLib.Testing.Request).%New()  $$$ASSERT($IsObject(tTestRequest))
	Set tTestRequest.Target = "PatientAppOp"
	Set tTestRequest.SyncCall = 1
	Set tRequest=##class(Demo.WebService.REST.PatientRequest).%New()
	Set tRequest.Command = "GET"
	Set tRequest.MRN = val
	Set tTestRequest.Request = tRequest
	Set tSC = tService.ProcessInput(tTestRequest,.tResponse)
	Quit:$$$ISERR(tSC) $$$StatusDisplayString(tSC)

	#; display response
	Quit $S($$$IsdefObject(tResponse):1_"|"_tResponse.%Id(),1:"No Response from Demo.WebService.REST.PatientOperation GET")
}

ClientMethod refresh() [ Language = javascript ]
{
	var json = this.getComponentById('jpResponseInfo');

	json.reloadContents();
	
	var resp = json.getContentObject();
	var ctl;
	/*ctl = zen('txURL');	
	ctl.setValue(resp ? resp.RequestURL : '');

	ctl = zen('txSession');	
	ctl.setValue(resp ? resp.SessionId : '');*/
	
	ctl = zen('txRawResponse');	
	ctl.setValue(resp ? resp.RawResponse : '');
}

ClassMethod GetResponseInfo(ByRef pParameters, Output pObj) As %Status
{
	Set tSC=$$$OK, pObj=$$$NULLOREF
	try {
		Set tResponseId = $G(pParameters("responseId"))
		If tResponseId {

			Set pObj=##class(Demo.WebService.REST.PatientResponse).%OpenId(tResponseId,,.tSC)  Quit:$$$ISERR(tSC)
		}
	} catch {
		Set tSC = $$$SystemError
	}
	Quit tSC
}

/// Get the (localized) title string for the page.
Method %OnGetTitle() As %String
{
	Quit ..%OnGetPageName()
}

/// Get the (localized) name of the page.
Method %OnGetPageName() As %String
{
	Set txt = $$$Text(..#PAGENAME)
	Quit txt
}

/// Decorate the page.
Method %OnAfterCreatePage() As %Status
{
	Do ##super()
	
	Set tSC = $$$OK
	
	Quit tSC
}

}
