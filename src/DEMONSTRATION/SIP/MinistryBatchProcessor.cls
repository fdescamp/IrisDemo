/// 
Class SIP.MinistryBatchProcessor Extends Ens.BusinessProcessBPL [ ClassType = persistent, ProcedureBlock ]
{

Storage Default
{
<Type>%Storage.Persistent</Type>
}

/// BPL Definition
XData BPL [ XMLNamespace = "http://www.intersystems.com/bpl" ]
{
<process language='objectscript' request='ASCN.Msg.RecMap.LFO5.Batch.Msg16' response='Ens.Response' height='2000' width='2000' >
<context>
<property name='MinistryRecordCount' type='%Integer' instantiate='0' />
<property name='MinistryLoopCounter' type='%Integer' initialexpression='1' instantiate='0' />
<property name='NashvilleBatchHolder' type='ASCN.Msg.RecMap.LFO5.Batch.Msg16' instantiate='1' />
<property name='NashvilleBatchRecord' type='ASCN.Msg.RecMap.LFO5.Msg16.Record' instantiate='1' />
<property name='MinistryLocation' type='%String' instantiate='0' >
<parameters>
<parameter name='MAXLEN'  value='50' />
</parameters>
</property>
<property name='NashvilleRecordCounter' type='%Integer' initialexpression='1' instantiate='0' />
<property name='IndianapolisRecordCounter' type='%Integer' initialexpression='1' instantiate='0' />
<property name='IndianapolisBatchHolder' type='ASCN.Msg.RecMap.LFO5.Batch.Msg16' instantiate='1' />
<property name='IndianapolisBatchRecord' type='ASCN.Msg.RecMap.LFO5.Msg16.Record' instantiate='1' />
<property name='AustinRecordCounter' type='%Integer' initialexpression='1' instantiate='0' />
<property name='AustinBatchHolder' type='ASCN.Msg.RecMap.LFO5.Batch.Msg16' instantiate='1' />
<property name='AustinBatchRecord' type='ASCN.Msg.RecMap.LFO5.Msg16.Record' instantiate='1' />
</context>
<sequence xend='200' yend='850' >
<call name='Send To National' target='NationalFileRouter' async='1' xpos='200' ypos='250' >
<request type='ASCN.Msg.RecMap.LFO5.Batch.Msg16' >
<assign property="callrequest" value="request" action="set" />
</request>
</call>
<assign name="Get Total Num of Records" property="context.MinistryRecordCount" value="request.Records.Count()" action="set" xpos='200' ypos='350' />
<while name='Loop Over Ministry Records' condition='context.MinistryLoopCounter&lt;=context.MinistryRecordCount' xpos='200' ypos='450' xend='200' yend='1000' >
<assign name="Get Ministry" property="context.MinistryLocation" value="request.Records.GetAt(context.MinistryLoopCounter).Ministry" action="set" xpos='200' ypos='250' />
<switch name='Ministry?' xpos='200' ypos='350' xend='200' yend='700' >
<case condition='context.MinistryLocation="TNNAS"' >
<code name='Add To Batch' xpos='335' ypos='500' >
<![CDATA[ do context.NashvilleBatchHolder.Records.SetAt(request.Records.GetAt(context.MinistryLoopCounter), context.NashvilleRecordCounter) 
    
  do context.NashvilleBatchHolder.Records.GetAt(context.NashvilleRecordCounter).%Save(0)
  Set status= context.NashvilleBatchHolder.Records.%UnSwizzleAt(context.NashvilleRecordCounter)
 
]]>
</code>
<assign name="Add to Nashville Counter" property="context.NashvilleRecordCounter" value="context.NashvilleRecordCounter+1" action="set" xpos='335' ypos='600' />
</case>
<case condition='context.MinistryLocation="ININD"' >
<code name='Add To Batch' xpos='605' ypos='500' >
<![CDATA[  do context.IndianapolisBatchHolder.Records.SetAt(request.Records.GetAt(context.MinistryLoopCounter), context.IndianapolisRecordCounter) 
    
  do context.IndianapolisBatchHolder.Records.GetAt(context.IndianapolisRecordCounter).%Save(0)
  Set status= context.IndianapolisBatchHolder.Records.%UnSwizzleAt(context.IndianapolisRecordCounter)
 
]]>
</code>
<assign name="Add to Indianapolis Counter" property="context.IndianapolisRecordCounter" value="context.IndianapolisRecordCounter+1" action="set" xpos='605' ypos='600' />
</case>
<case condition='context.MinistryLocation="TXAUS"' >
<code name='Add To Batch' xpos='875' ypos='500' >
<![CDATA[ do context.AustinBatchHolder.Records.SetAt(request.Records.GetAt(context.MinistryLoopCounter), context.AustinRecordCounter) 
    
  do context.AustinBatchHolder.Records.GetAt(context.AustinRecordCounter).%Save(0)
  Set status= context.AustinBatchHolder.Records.%UnSwizzleAt(context.AustinRecordCounter)
 
]]>
</code>
<assign name="Add to Austin Counter" property="context.AustinRecordCounter" value="context.AustinRecordCounter+1" action="set" xpos='875' ypos='600' />
</case>
<default/>
</switch>
<code name='UnSwizzle request Records' xpos='200' ypos='800' >
<![CDATA[ set status= request.Records.%UnSwizzleAt(context.MinistryLoopCounter)
 
]]>
</code>
<assign name="Increment Looper" property="context.MinistryLoopCounter" value="context.MinistryLoopCounter+1" action="set" xpos='200' ypos='900' />
</while>
<call name='Send To Nashville' target='MinistryFileRouter' async='1' xpos='200' ypos='550' >
<request type='ASCN.Msg.RecMap.LFO5.Batch.Msg16' >
<assign property="callrequest" value="context.NashvilleBatchHolder" action="set" />
</request>
</call>
<call name='Send To Indianapolis' target='MinistryFileRouter' async='1' xpos='200' ypos='650' >
<request type='ASCN.Msg.RecMap.LFO5.Batch.Msg16' >
<assign property="callrequest" value="context.IndianapolisBatchHolder" action="set" />
</request>
</call>
<call name='Send To Austin' target='MinistryFileRouter' async='1' xpos='200' ypos='750' >
<request type='ASCN.Msg.RecMap.LFO5.Batch.Msg16' >
<assign property="callrequest" value="context.AustinBatchHolder" action="set" />
</request>
</call>
</sequence>
</process>
}

}
