<?xml version="1.0" encoding="UTF-8"?>
<model ref="r:e28356be-9644-47f3-8a98-bda059bc5646(com.strumenta.StarLasu.structure)">
  <persistence version="9" />
  <languages>
    <use id="c72da2b9-7cce-4447-8389-f407dc1158b7" name="jetbrains.mps.lang.structure" version="9" />
    <use id="411e5b27-8a76-482e-8af8-1704262b4468" name="io.lionweb.mps.structure.attribute" version="0" />
    <devkit ref="78434eb8-b0e5-444b-850d-e7c4ad2da9ab(jetbrains.mps.devkit.aspect.structure)" />
  </languages>
  <imports>
    <import index="tpck" ref="r:00000000-0000-4000-0000-011c89590288(jetbrains.mps.lang.core.structure)" implicit="true" />
  </imports>
  <registry>
    <language id="c72da2b9-7cce-4447-8389-f407dc1158b7" name="jetbrains.mps.lang.structure">
      <concept id="1082978164218" name="jetbrains.mps.lang.structure.structure.DataTypeDeclaration" flags="ng" index="AxPO6">
        <property id="7791109065626895363" name="datatypeId" index="3F6X1D" />
      </concept>
      <concept id="1169125787135" name="jetbrains.mps.lang.structure.structure.AbstractConceptDeclaration" flags="ig" index="PkWjJ">
        <property id="6714410169261853888" name="conceptId" index="EcuMT" />
        <property id="4628067390765956802" name="abstract" index="R5$K7" />
        <child id="1071489727084" name="propertyDeclaration" index="1TKVEl" />
      </concept>
      <concept id="1169125989551" name="jetbrains.mps.lang.structure.structure.InterfaceConceptDeclaration" flags="ig" index="PlHQZ">
        <child id="1169127546356" name="extends" index="PrDN$" />
      </concept>
      <concept id="1169127622168" name="jetbrains.mps.lang.structure.structure.InterfaceConceptReference" flags="ig" index="PrWs8">
        <reference id="1169127628841" name="intfc" index="PrY4T" />
      </concept>
      <concept id="1083243159079" name="jetbrains.mps.lang.structure.structure.PrimitiveDataTypeDeclaration" flags="ng" index="QkHVr" />
      <concept id="1071489090640" name="jetbrains.mps.lang.structure.structure.ConceptDeclaration" flags="ig" index="1TIwiD" />
      <concept id="1071489288299" name="jetbrains.mps.lang.structure.structure.PropertyDeclaration" flags="ig" index="1TJgyi">
        <property id="241647608299431129" name="propertyId" index="IQ2nx" />
        <reference id="1082985295845" name="dataType" index="AX2Wp" />
      </concept>
    </language>
    <language id="ceab5195-25ea-4f22-9b92-103b95ca8c0c" name="jetbrains.mps.lang.core">
      <concept id="1133920641626" name="jetbrains.mps.lang.core.structure.BaseConcept" flags="ng" index="2VYdi">
        <child id="5169995583184591170" name="smodelAttribute" index="lGtFl" />
      </concept>
      <concept id="1169194658468" name="jetbrains.mps.lang.core.structure.INamedConcept" flags="ng" index="TrEIO">
        <property id="1169194664001" name="name" index="TrG5h" />
      </concept>
    </language>
    <language id="411e5b27-8a76-482e-8af8-1704262b4468" name="io.lionweb.mps.structure.attribute">
      <concept id="7205279169712116346" name="io.lionweb.mps.structure.attribute.structure.LionWebLanguageKey" flags="ng" index="2DM1_0" />
      <concept id="7205279169712116353" name="io.lionweb.mps.structure.attribute.structure.ILionWebKey" flags="ng" index="2DM1AV">
        <property id="7205279169712116354" name="key" index="2DM1AS" />
      </concept>
      <concept id="7205279169712116358" name="io.lionweb.mps.structure.attribute.structure.LionWebEntityKey" flags="ng" index="2DM1AW" />
    </language>
  </registry>
  <node concept="2DM1_0" id="6LPMcPcmvOq">
    <property role="2DM1AS" value="com_strumenta_StarLasu" />
  </node>
  <node concept="1TIwiD" id="6LPMcPcmvNJ">
    <property role="R5$K7" value="false" />
    <property role="TrG5h" value="ASTNode" />
    <property role="EcuMT" value="-7808230969696131992" />
    <node concept="2DM1AW" id="6LPMcPcmvNK" role="lGtFl">
      <property role="2DM1AS" value="StarLasu-ASTNode" />
    </node>
  </node>
  <node concept="1TIwiD" id="6LPMcPcmvNL">
    <property role="R5$K7" value="false" />
    <property role="TrG5h" value="GenericErrorNode" />
    <property role="EcuMT" value="-9161206412919177660" />
    <node concept="2DM1AW" id="6LPMcPcmvNM" role="lGtFl">
      <property role="2DM1AS" value="StarLasu-GenericErrorNode" />
    </node>
  </node>
  <node concept="PlHQZ" id="6LPMcPcmvNN">
    <property role="TrG5h" value="Named" />
    <property role="EcuMT" value="-5174868509310259989" />
    <node concept="2DM1AW" id="6LPMcPcmvNO" role="lGtFl">
      <property role="2DM1AS" value="StarLasu-Named" />
    </node>
    <node concept="PrWs8" id="6LPMcPcmvOp" role="PrDN$">
      <ref role="PrY4T" node="6LPMcPcmvNP" resolve="PossiblyNamed" />
    </node>
  </node>
  <node concept="PlHQZ" id="6LPMcPcmvNP">
    <property role="TrG5h" value="PossiblyNamed" />
    <property role="EcuMT" value="-4734195003540202047" />
    <node concept="2DM1AW" id="6LPMcPcmvNQ" role="lGtFl">
      <property role="2DM1AS" value="StarLasu-PossiblyNamed" />
    </node>
    <node concept="1TJgyi" id="6LPMcPcmvNR" role="1TKVEl">
      <property role="TrG5h" value="name" />
      <property role="IQ2nx" value="2357619182568156249" />
      <ref role="AX2Wp" to="tpck:fKAOsGN" resolve="string" />
      <node concept="2DM1AW" id="6LPMcPcmvNS" role="lGtFl">
        <property role="2DM1AS" value="StarLasu-PossiblyNamed-name" />
      </node>
    </node>
  </node>
  <node concept="QkHVr" id="6LPMcPcmvNT">
    <property role="TrG5h" value="Position" />
    <property role="3F6X1D" value="-6283125291199963262" />
    <node concept="2DM1AW" id="6LPMcPcmvNU" role="lGtFl">
      <property role="2DM1AS" value="StarLasu-Position" />
    </node>
  </node>
  <node concept="QkHVr" id="6LPMcPcmvNV">
    <property role="TrG5h" value="Char" />
    <property role="3F6X1D" value="-5707364880385384378" />
    <node concept="2DM1AW" id="6LPMcPcmvNW" role="lGtFl">
      <property role="2DM1AS" value="StarLasu-Char" />
    </node>
  </node>
</model>

