Class SQLSample.SQLToHL7DTL Extends Ens.DataTransformDTL [ ClassType = "", DependsOn = (SQLSample.SQLSampleMessage, EnsLib.HL7.Message), ProcedureBlock ]
{

Parameter IGNOREMISSINGSOURCE = 0;

Parameter REPORTERRORS = 0;

Parameter TREATEMPTYREPEATINGFIELDASNULL = 0;

XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform sourceClass='SQLSample.SQLSampleMessage' targetClass='EnsLib.HL7.Message' targetDocType='2.2:ADT_A01' create='new' language='objectscript' >
<assign value='"MSH|^~\&amp;|FOCUS 2000 ver.4.3.12|4370|eTLAB|J2test|20080624133634||ADT^A01|200806241336340801|P|2.2|1||||||"_$CHAR(13,10)' property='target.{MSH}' action='set' />
<assign value='"EVN|A01|200811241212||1"_$CHAR(13,10)' property='target.{EVN}' action='set' />
<assign value='"PID|1|1000027800||1927|TEST PATIENT^||19400102|F||B|169 MY ST^^CITYGOESHERE^MI^12345||(123)456-3604|(000)000-0000||M||4370|999-99-9999||||||||||"_$CHAR(13,10)' property='target.{PID}' action='set' />
<assign value='"PV1|1|ES|J2test||||622^OO^THAN^^^^^P^^G23140^^^|^^^^^^^^^999999^^^|^^^^^^^^^999999^^^|I||||||||A||||||||||||||||||||||||||19990607||||||||"_$CHAR(13,10)' property='target.{PV1}' action='set' />
<assign value='"IN1|1|4567|FXYZ-JKLQ001|MEDICARE|P O BOX 3112^^MILWAUKEE^WI^53201--3112||(555)111-2222|||||||||TEST PATIENT^|SE||^^^^|||||||||||||||||112233445B|||||||F|"_$CHAR(13,10)' property='target.{IN1grp(1).IN1}' action='set' />
<assign value='source.Name' property='target.{PID:PatientName.familiyname}' action='set' />
<assign value='source.Address_" "_source.Address2' property='target.{PID:PatientAddress(1).streetaddress}' action='set' />
<assign value='source.City' property='target.{PID:PatientAddress(1).city}' action='set' />
<assign value='source.State' property='target.{PID:PatientAddress(1).stateorprovince}' action='set' />
<assign value='source.Zip' property='target.{PID:PatientAddress(1).ziporpostalcode}' action='set' />
</transform>
}

}
