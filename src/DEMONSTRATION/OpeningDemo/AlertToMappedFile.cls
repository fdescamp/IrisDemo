Class OpeningDemo.AlertToMappedFile Extends Ens.DataTransformDTL [ DependsOn = (Ens.AlertRequest, Demo.AlertRecordMap.Record) ]
{

Parameter IGNOREMISSINGSOURCE = 1;

Parameter REPORTERRORS = 1;

XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform sourceClass='Ens.AlertRequest' targetClass='Demo.AlertRecordMap.Record' create='new' language='objectscript' >
<annotation>Transforms alerts to a mapped file format</annotation>
<assign value='source.SourceConfigName' property='target.SourceConfigName' action='set' />
<assign value='source.AlertText' property='target.AlertText' action='set' />
<assign value='source.AlertDestination' property='target.AlertDestination' action='set' />
</transform>
}

}
