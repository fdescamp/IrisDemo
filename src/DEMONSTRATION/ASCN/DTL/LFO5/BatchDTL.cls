Class ASCN.DTL.LFO5.BatchDTL Extends Ens.DataTransformDTL [ DependsOn = ASCN.Msg.RecMap.LFO5.Batch.Msg16 ]
{

Parameter IGNOREMISSINGSOURCE = 1;

Parameter REPORTERRORS = 1;

Parameter TREATEMPTYREPEATINGFIELDASNULL = 0;

XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform sourceClass='ASCN.Msg.RecMap.LFO5.Batch.Msg16' targetClass='ASCN.Msg.RecMap.LFO5.Batch.Msg16' create='new' language='objectscript' >
<assign value='source.BatchHeader' property='target.BatchHeader' action='set' />
<trace value='"source.%Source:"_source.%Source' />
<assign value='source.BatchTrailer' property='target.BatchTrailer' action='set' />
<if condition='..Contains(source.%Source,"NATL_APPS")' >
<true>
<assign value='"NATL_APPS"' property='target.%Source' action='set' />
</true>
<false>
<assign value='source.Records.(1).Ministry' property='target.%Source' action='set' />
</false>
</if>
<foreach property='source.Records()' key='k1' >
<subtransform class='ASCN.DTL.LFO5.Msg16' targetObj='target.Records.(k1)' sourceObj='source.Records.(k1)' />
<code>
<![CDATA[ Do source.Records.%UnSwizzleAt(k1)
 Do target.Records.GetAt(k1).%Save(0)
 Do target.Records.%UnSwizzleAt(k1)]]></code>
</foreach>
<assign value='source.Records.Count()' property='target.Trailer.Field3' action='set' disabled='1' />
<comment>
<annotation>test</annotation>
</comment>
</transform>
}

}
