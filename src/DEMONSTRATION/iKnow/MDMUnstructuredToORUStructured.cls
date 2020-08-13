Class iKnow.MDMUnstructuredToORUStructured Extends Ens.DataTransformDTL [ DependsOn = EnsLib.HL7.Message ]
{

Parameter IGNOREMISSINGSOURCE = 1;

Parameter REPORTERRORS = 1;

Parameter TREATEMPTYREPEATINGFIELDASNULL = 0;

XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform sourceClass='EnsLib.HL7.Message' targetClass='EnsLib.HL7.Message' sourceDocType='2.5:MDM_T02' targetDocType='2.5:ORU_R01' create='new' language='objectscript' >
<assign value='source.{MSH}' property='target.{MSH}' action='set' />
<assign value='"IKNOW NLP EXTRACT"' property='target.{MSH:SendingApplication}' action='set' />
<assign value='"ORU"' property='target.{MSH:MessageType.MessageCode}' action='set' />
<assign value='"R01"' property='target.{MSH:MessageType.TriggerEvent}' action='set' />
<assign value='source.{PID}' property='target.{PIDgrpgrp(1).PIDgrp.PID}' action='set' />
<assign value='source.{PV1}' property='target.{PIDgrpgrp(1).PIDgrp.PV1grp.PV1}' action='set' />
<assign value='"OBR|1|||Unstructured Data Extract|||||||||||||||||||||||"' property='target.{PIDgrpgrp(1).ORCgrp(1).OBR}' action='set' />
<assign value='""' property='tUnstructuredDataString' action='set' />
<foreach property='source.{OBXgrp()}' key='k1' >
<assign value='tUnstructuredDataString_$C(10,13)_source.{OBXgrp(k1).OBX:ObservationValue}' property='tUnstructuredDataString' action='set' />
</foreach>
<code disabled='1' >
<![CDATA[ w tUnstructuredDataString]]></code>
<assign value='##class(iKnow.DataExtractor).ExtractDataFromUnstructured(tUnstructuredDataString,"Ejection Fraction")' property='tStructuredResult' action='set' />
<code>
<![CDATA[ //w tStructuredResult]]></code>
<if condition='tStructuredResult &apos;="No Data Found"' >
<true>
<assign value='"1"' property='target.{PIDgrpgrp(1).ORCgrp(1).OBXgrp(1).OBX:SetIDOBX}' action='set' />
<assign value='"NLP EXTRACT"' property='target.{PIDgrpgrp().ORCgrp().OBXgrp().OBX:ValueType}' action='set' />
<assign value='"8811-2^^LN"' property='target.{PIDgrpgrp(1).ORCgrp(1).OBXgrp(1).OBX:ObservationIdentifier}' action='set' />
<assign value='tStructuredResult' property='target.{PIDgrpgrp(1).ORCgrp(1).OBXgrp(1).OBX:ObservationValue}' action='set' />
<assign value='"50-60"' property='target.{PIDgrpgrp(1).ORCgrp(1).OBXgrp(1).OBX:ReferencesRange}' action='set' />
<assign value='"NLP EXTRACT"' property='target.{PIDgrpgrp().ORCgrp().OBXgrp().OBX:ObservationResultStatus}' action='set' />
</true>
</if>
</transform>
}

}
