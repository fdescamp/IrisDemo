/// Sends an alert by calling a custom function.  Alert Text is passed as a parameter.
Class AlertDemo.custom.TriggerAlert Extends Ens.Rule.FunctionSet [ ProcedureBlock ]
{

ClassMethod TriggerAlert(pAlertText As %String) As %String [ Final ]
{
	
	set talert=##class(Ens.AlertRequest).%New()
    set talert.AlertText=pAlertText
    set talert.SourceConfigName=$$$JobConfigName
       //  %Ensemble("%Process").%PrimaryRequestHeader.TargetConfigName   Note that this worked but was dependent on a message
       //  for the above setting of alert.SourceConfigName, Not sure would always have a message with this properly set
	Do talert.%Save()
	If talert.SourceConfigName="Ens.Alert" {
		#; To avoid infinite loop, no SendAlert from Ens.Alert
		$$$LOGALERT("From Ens.Alert: "_talert.AlertText_" (alert request ID="_talert.%Id()_")")
		Quit $$$OK
	}
	$$$LOGALERT(talert.AlertText_" (alert request ID="_talert.%Id()_")")
	Quit:""=$get($$$DispatchNameToConfigName("Ens.Alert")) $$$OK

	$$$sysTRACE("call to Ens.Alert")
	Set tZH=$zh
	
	Set tTargetConfigName = $get($$$DispatchNameToConfigName("Ens.Alert")) Quit:""=tTargetConfigName $$$EnsError($$$EnsErrBusinessDispatchNameNotRegistered,"Ens.Alert")
	Set tTargetBusinessClass=$$$ConfigClassName(tTargetConfigName)
	Set tPriority=$s(0:$$$eMessagePrioritySimSync,1:$$$eMessagePriorityAsync)

	Set tSC=$classmethod(tTargetBusinessClass,"acceptRequestAsync",talert.SourceConfigName,tTargetConfigName,talert,tPriority,"","" /*..%SessionId*/,talert.%Id(),.tRequestHeader,"")

	$$$catTRACE("timing","duration of async call: "_($zh-tZH))
	Quit tSC
}

}
