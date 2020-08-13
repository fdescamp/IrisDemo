/// 
Class Stanford.DischargeChecklist Extends Ens.BusinessProcessBPL [ ClassType = persistent, ProcedureBlock ]
{

Storage Default
{
<Type>%Storage.Persistent</Type>
}

/// BPL Definition
XData BPL [ XMLNamespace = "http://www.intersystems.com/bpl" ]
{
<process language='objectscript' request='EnsLib.HL7.Message' height='2800' width='2000' >
<context>
<property name='pid' type='%String' instantiate='0' />
<property name='facility' type='%String' instantiate='0' />
<property name='room' type='%String' initialexpression='"N/A"' instantiate='0' />
<property name='equipment' type='%String' instantiate='0' />
<property name='floors' type='%String' instantiate='0' />
<property name='linens' type='%String' instantiate='0' />
<property name='dusting' type='%String' instantiate='0' />
<property name='date' type='%String' instantiate='0' />
<property name='changed' type='%String' instantiate='0' />
<property name='numchanged' type='%Integer' instantiate='0' />
<property name='tmpdusting' type='%String' instantiate='0' />
<property name='tmpfloors' type='%String' instantiate='0' />
<property name='tmplinens' type='%String' instantiate='0' />
</context>
<sequence xend='200' yend='1500' >
<code name='Set up Context Data' xpos='200' ypos='250' >
<![CDATA[ set context.pid =  request.GetValueAt("PID:2")
 set context.facility =  request.GetValueAt("MSH:4")
  set context.room =  request.GetValueAt("PV1:AssignedPatientLocation.Room")
  set context.date = request.GetValueAt("PV1:45") 
  ]]>
</code>
<call name='Send Cleaning Notification' target='EMailAlert' async='1' xpos='200' ypos='350' >
<request type='Ens.AlertRequest' >
<assign property="callrequest.AlertText" value="&quot;Patient &quot;_context.pid_&quot; has been discharged from &quot;_context.facility_&quot;, Room &quot;_context.room_&quot;. Please fill out the Disinfect Room Checklist, found at the link below, to ensure room cleanliness.&quot;_$C(13,10)_&quot;http://localhost:52774/csp/healthshare/roomworkflow/_DeepSee.UserPortal.Workflow.zen&quot;" action="set" />
<assign property="callrequest.AlertDestination" value="##class(Ens.Util.FunctionSet).Lookup(&quot;CleanupEmails&quot;,##class(Ens.Util.FunctionSet).Lookup(&quot;CleanupUsers&quot;,&quot;cleaner&quot;))" action="set" />
<assign property="callrequest.SourceConfigName" value="&quot; Disinfect Room Checklist&quot;" action="set" />
</request>
</call>
<call name='Workflow Checklist Call' target='DisinfectedRoomWorkflow' async='1' xpos='200' ypos='450' >
<request type='EnsLib.Workflow.TaskRequest' >
<assign property="callrequest.%Actions" value="&quot;Mark As Complete&quot;" action="set" />
<assign property="callrequest.%Subject" value="&quot;Disinfect Room Checklist&quot;" action="set" />
<assign property="callrequest.%Message" value="&quot;Checklist for cleaning room following patient discharge&quot;" action="set" />
<assign property="callrequest.%FormFields" value="&quot;Floors Mopped,Sheets Cleaned,High Level Dusting,Equipment in Room&quot;" action="set" />
<assign property="callrequest.%UserName" value="##class(Ens.Util.FunctionSet).Lookup(&quot;CleanupUsers&quot;,&quot;cleaner&quot;)" action="set" />
</request>
<response type='EnsLib.Workflow.TaskResponse' >
<assign property="context.equipment" value="callresponse.%FormValues.GetAt(&quot;Equipment in Room&quot;)" action="set" />
<assign property="context.floors" value="callresponse.%FormValues.GetAt(&quot;Floors Mopped&quot;)" action="set" />
<assign property="context.linens" value="callresponse.%FormValues.GetAt(&quot;Sheets Cleaned&quot;)" action="set" />
<assign property="context.dusting" value="callresponse.%FormValues.GetAt(&quot;High Level Dusting&quot;)" action="set" />
</response>
</call>
<sync name='Get Checklist Response' calls='Workflow Checklist Call,Send Cleaning Notification' type='all' xpos='200' ypos='550' />
<while name='while cleaning isn&apos;t done' condition='(context.linens &apos;= "y") || (context.floors &apos;= "y") || (context.dusting &apos;= "y")' xpos='200' ypos='650' xend='200' yend='750' >
<code name='Left to Clean?' xpos='200' ypos='250' >
<![CDATA[ set context.changed = ""
 if context.linens '= "y"{set context.changed = context.changed_"Sheets Cleaned,"}
 if context.floors '= "y"{set context.changed = context.changed_"Floors Mopped,"}
 if context.dusting '= "y"{set context.changed = context.changed_"High Level Dusting,"}
 set context.changed = $extract(context.changed,1,*-1)
 set context.numchanged = $length(context.changed,",")]]>
</code>
<call name='Cleaning Incomplete' target='EMailAlert' async='1' xpos='200' ypos='350' >
<request type='Ens.AlertRequest' >
<assign property="callrequest.AlertText" value="&quot;Room &quot;_context.room_&quot; at Facility &quot;_context.facility_&quot; has not been finished cleaning. The following tasks must be completed: &quot;_$C(13,10)_&quot;     &quot;_context.changed_$C(13,10)_$C(13,10)_&quot;Please navigate to the following link to complete the Disinfect Room Checklist.&quot;_$C(13,10)_&quot;http://localhost:52774/csp/healthshare/roomworkflow/_DeepSee.UserPortal.Home.zen&quot;" action="set" />
<assign property="callrequest.AlertDestination" value="##class(Ens.Util.FunctionSet).Lookup(&quot;CleanupEmails&quot;,##class(Ens.Util.FunctionSet).Lookup(&quot;CleanupUsers&quot;,&quot;cleaner&quot;))" action="set" />
<assign property="callrequest.SourceConfigName" value="&quot; Disinfect Room Checklist&quot;" action="set" />
</request>
</call>
<call name='Update Workflow Checklist' target='DisinfectedRoomWorkflow' async='1' xpos='200' ypos='450' >
<request type='EnsLib.Workflow.TaskRequest' >
<assign property="callrequest.%Actions" value="&quot;Mark As Complete&quot;" action="set" />
<assign property="callrequest.%Subject" value="&quot;Disinfect Room Checklist&quot;" action="set" />
<assign property="callrequest.%Message" value="&quot;Checklist for cleaning room following patient discharge&quot;" action="set" />
<assign property="callrequest.%FormFields" value="context.changed" action="set" />
<assign property="callrequest.%UserName" value="##class(Ens.Util.FunctionSet).Lookup(&quot;CleanupUsers&quot;,&quot;cleaner&quot;)" action="set" />
</request>
<response type='EnsLib.Workflow.TaskResponse' >
<assign property="context.tmpfloors" value="callresponse.%FormValues.GetAt(&quot;Floors Mopped&quot;)" action="set" />
<assign property="context.tmplinens" value="callresponse.%FormValues.GetAt(&quot;Sheets Cleaned&quot;)" action="set" />
<assign property="context.tmpdusting" value="callresponse.%FormValues.GetAt(&quot;High Level Dusting&quot;)" action="set" />
</response>
</call>
<sync name='Get Updated Response' calls='Cleaning Incomplete,Update Workflow Checklist' type='all' xpos='200' ypos='550' />
<code name='Update Values' xpos='200' ypos='650' >
<![CDATA[ if context.linens '= "y"{set context.linens = context.tmplinens}
 if context.floors '= "y"{set context.floors= context.tmpfloors}
 if context.dusting '= "y"{set context.dusting=context.tmpdusting}]]>
</code>
</while>
<if name='Equipment?' condition='context.equipment= ""' xpos='200' ypos='750' xend='200' yend='1200' >
<false>
<call name='Send Equipment Notification' target='EMailAlert' async='1' xpos='335' ypos='900' >
<request type='Ens.AlertRequest' >
<assign property="callrequest.AlertText" value="&quot;Room &quot;_context.room_&quot; at facility &quot;_context.facility_&quot; has equipment that must be removed.&quot;_$C(13,10)_&quot;http://localhost:52774/csp/healthshare/roomworkflow/_DeepSee.UserPortal.Home.zen&quot;" action="set" />
<assign property="callrequest.AlertDestination" value="##class(Ens.Util.FunctionSet).Lookup(&quot;CleanupEmails&quot;,##class(Ens.Util.FunctionSet).Lookup(&quot;CleanupUsers&quot;,&quot;nurse&quot;))" action="set" />
<assign property="callrequest.SourceConfigName" value="&quot; Equipment in Room&quot;" action="set" />
</request>
</call>
<call name='Workflow Equipment Call' target='EquipmentWorkflow' async='1' xpos='335' ypos='1000' >
<request type='EnsLib.Workflow.TaskRequest' >
<assign property="callrequest.%Actions" value="&quot;Removed From Room&quot;" action="set" />
<assign property="callrequest.%Subject" value="&quot;Equipment in Room&quot;" action="set" />
<assign property="callrequest.%Message" value="&quot;Remaining equipment in terminating room&quot;" action="set" />
<assign property="callrequest.%FormFields" value="context.equipment" action="set" />
<assign property="callrequest.%UserName" value="##class(Ens.Util.FunctionSet).Lookup(&quot;CleanupUsers&quot;,&quot;nurse&quot;)" action="set" />
</request>
<response type='EnsLib.Workflow.TaskResponse' />
</call>
<sync name='Get Equipment Response' calls='Send Equipment Notification,Workflow Equipment Call' type='all' xpos='335' ypos='1100' />
</false>
</if>
<code name='Save Room' xpos='200' ypos='1300' >
<![CDATA[ set row = ##class(Stanford.RoomCleaningHistory).%New()
 set row.Facility = context.facility
 set row.Room = context.room
 set row.LastInUse = $extract(context.date,5,6)_"/"_$extract(context.date,7,8)_"/"_$extract(context.date,1,4)
 set row.PreviousPatient = context.pid
 set row.LastCleaned = $zdate(+$h)
 set sc = row.%Save()
 
 ]]>
</code>
<call name='HL7 File Out' target='HL7FileOperation' async='1' xpos='200' ypos='1400' >
<request type='EnsLib.HL7.Message' >
<assign property="callrequest" value="request" action="set" />
</request>
</call>
</sequence>
</process>
}

}
