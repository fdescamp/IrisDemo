Class ASCN.DTL.LFO5.Msg16 Extends Ens.DataTransformDTL [ DependsOn = ASCN.Msg.RecMap.LFO5.Msg16.Record ]
{

Parameter IGNOREMISSINGSOURCE = 1;

Parameter REPORTERRORS = 1;

Parameter TREATEMPTYREPEATINGFIELDASNULL = 0;

XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform sourceClass='ASCN.Msg.RecMap.LFO5.Msg16.Record' targetClass='ASCN.Msg.RecMap.LFO5.Msg16.Record' create='copy' language='objectscript' >
<assign value='source.Field26' property='target.Field19' action='set' />
<assign value='source.Field19' property='target.Field26' action='set' />
<assign value='source.Field20' property='target.Field24' action='set' />
<assign value='source.Field24' property='target.Field20' action='set' />
</transform>
}

}
