<?xml version="1.0" encoding="UTF-8"?>
<model ref="r:5d0bf864-ad8e-487e-9a12-36abdfcf2e40(io.lionweb.Properties.structure)">
  <persistence version="9" />
  <languages>
    <use id="c72da2b9-7cce-4447-8389-f407dc1158b7" name="jetbrains.mps.lang.structure" version="9" />
    <use id="411e5b27-8a76-482e-8af8-1704262b4468" name="io.lionweb.mps.structure.attribute" version="0" />
    <devkit ref="78434eb8-b0e5-444b-850d-e7c4ad2da9ab(jetbrains.mps.devkit.aspect.structure)" />
  </languages>
  <imports>
    <import index="wdd7" ref="r:e28356be-9644-47f3-8a98-bda059bc5646(com.strumenta.StarLasu.structure)" />
    <import index="tpck" ref="r:00000000-0000-4000-0000-011c89590288(jetbrains.mps.lang.core.structure)" implicit="true" />
  </imports>
  <registry>
    <language id="c72da2b9-7cce-4447-8389-f407dc1158b7" name="jetbrains.mps.lang.structure">
      <concept id="1169125787135" name="jetbrains.mps.lang.structure.structure.AbstractConceptDeclaration" flags="ig" index="PkWjJ">
        <property id="6714410169261853888" name="conceptId" index="EcuMT" />
        <property id="4628067390765956802" name="abstract" index="R5$K7" />
        <child id="1071489727083" name="linkDeclaration" index="1TKVEi" />
        <child id="1071489727084" name="propertyDeclaration" index="1TKVEl" />
      </concept>
      <concept id="1071489090640" name="jetbrains.mps.lang.structure.structure.ConceptDeclaration" flags="ig" index="1TIwiD">
        <reference id="1071489389519" name="extends" index="1TJDcQ" />
      </concept>
      <concept id="1071489288299" name="jetbrains.mps.lang.structure.structure.PropertyDeclaration" flags="ig" index="1TJgyi">
        <property id="241647608299431129" name="propertyId" index="IQ2nx" />
        <reference id="1082985295845" name="dataType" index="AX2Wp" />
      </concept>
      <concept id="1071489288298" name="jetbrains.mps.lang.structure.structure.LinkDeclaration" flags="ig" index="1TJgyj">
        <property id="1071599776563" name="role" index="20kJfa" />
        <property id="1071599893252" name="sourceCardinality" index="20lbJX" />
        <property id="1071599937831" name="metaClass" index="20lmBu" />
        <property id="241647608299431140" name="linkId" index="IQ2ns" />
        <reference id="1071599976176" name="target" index="20lvS9" />
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
      <concept id="7205279169712116346" name="io.lionweb.mps.structure.attribute.structure.LIonWebLanguageKey" flags="ng" index="2DM1_0" />
      <concept id="7205279169712116353" name="io.lionweb.mps.structure.attribute.structure.ILionWebKey" flags="ng" index="2DM1AV">
        <property id="7205279169712116354" name="key" index="2DM1AS" />
      </concept>
      <concept id="7205279169712116358" name="io.lionweb.mps.structure.attribute.structure.LIonWebElementKey" flags="ng" index="2DM1AW" />
    </language>
  </registry>
  <node concept="2DM1_0" id="6LPMcPcmvOr">
    <property role="2DM1AS" value="io_lionweb_Properties" />
  </node>
  <node concept="1TIwiD" id="6LPMcPcmvNX">
    <property role="R5$K7" value="false" />
    <property role="TrG5h" value="PropertiesFile" />
    <property role="EcuMT" value="4516078350026690430" />
    <ref role="1TJDcQ" to="wdd7:6LPMcPcmvNJ" resolve="ASTNode" />
    <node concept="2DM1AW" id="6LPMcPcmvNY" role="lGtFl">
      <property role="2DM1AS" value="io_lionweb_Properties-PropertiesFile" />
    </node>
    <node concept="1TJgyj" id="6LPMcPcmvNZ" role="1TKVEi">
      <property role="20kJfa" value="props" />
      <property role="IQ2ns" value="-3883340165466824873" />
      <property role="20lmBu" value="fLJjDmT/aggregation" />
      <property role="20lbJX" value="fLJekj6/_1__n" />
      <ref role="20lvS9" node="6LPMcPcmvO1" resolve="Property" />
      <node concept="2DM1AW" id="6LPMcPcmvO0" role="lGtFl">
        <property role="2DM1AS" value="io_lionweb_Properties-PropertiesFile-props" />
      </node>
    </node>
  </node>
  <node concept="1TIwiD" id="6LPMcPcmvO1">
    <property role="R5$K7" value="false" />
    <property role="TrG5h" value="Property" />
    <property role="EcuMT" value="9045300450722131192" />
    <ref role="1TJDcQ" to="wdd7:6LPMcPcmvNJ" resolve="ASTNode" />
    <node concept="2DM1AW" id="6LPMcPcmvO2" role="lGtFl">
      <property role="2DM1AS" value="io_lionweb_Properties-Property" />
    </node>
    <node concept="1TJgyi" id="6LPMcPcmvO3" role="1TKVEl">
      <property role="TrG5h" value="name" />
      <property role="IQ2nx" value="987908001351304881" />
      <ref role="AX2Wp" to="tpck:fKAOsGN" resolve="string" />
      <node concept="2DM1AW" id="6LPMcPcmvO4" role="lGtFl">
        <property role="2DM1AS" value="io_lionweb_Properties-Property-name" />
      </node>
    </node>
    <node concept="1TJgyj" id="6LPMcPcmvO5" role="1TKVEi">
      <property role="20kJfa" value="value" />
      <property role="IQ2ns" value="-4949124439403577779" />
      <property role="20lmBu" value="fLJjDmT/aggregation" />
      <property role="20lbJX" value="fLJekj4/_1" />
      <ref role="20lvS9" node="6LPMcPcmvO7" resolve="Value" />
      <node concept="2DM1AW" id="6LPMcPcmvO6" role="lGtFl">
        <property role="2DM1AS" value="io_lionweb_Properties-Property-value" />
      </node>
    </node>
  </node>
  <node concept="1TIwiD" id="6LPMcPcmvO7">
    <property role="R5$K7" value="false" />
    <property role="TrG5h" value="Value" />
    <property role="EcuMT" value="-5637181171957891234" />
    <ref role="1TJDcQ" to="wdd7:6LPMcPcmvNJ" resolve="ASTNode" />
    <node concept="2DM1AW" id="6LPMcPcmvO8" role="lGtFl">
      <property role="2DM1AS" value="io_lionweb_Properties-Value" />
    </node>
  </node>
  <node concept="1TIwiD" id="6LPMcPcmvO9">
    <property role="R5$K7" value="false" />
    <property role="TrG5h" value="BooleanValue" />
    <property role="EcuMT" value="3610585688048632058" />
    <ref role="1TJDcQ" node="6LPMcPcmvO7" resolve="Value" />
    <node concept="2DM1AW" id="6LPMcPcmvOa" role="lGtFl">
      <property role="2DM1AS" value="io_lionweb_Properties-BooleanValue" />
    </node>
    <node concept="1TJgyi" id="6LPMcPcmvOb" role="1TKVEl">
      <property role="TrG5h" value="value" />
      <property role="IQ2nx" value="7452053177660046254" />
      <ref role="AX2Wp" to="tpck:fKAQMTB" resolve="boolean" />
      <node concept="2DM1AW" id="6LPMcPcmvOc" role="lGtFl">
        <property role="2DM1AS" value="io_lionweb_Properties-BooleanValue-value" />
      </node>
    </node>
  </node>
  <node concept="1TIwiD" id="6LPMcPcmvOd">
    <property role="R5$K7" value="false" />
    <property role="TrG5h" value="DecValue" />
    <property role="EcuMT" value="-8690975471803852252" />
    <ref role="1TJDcQ" node="6LPMcPcmvO7" resolve="Value" />
    <node concept="2DM1AW" id="6LPMcPcmvOe" role="lGtFl">
      <property role="2DM1AS" value="io_lionweb_Properties-DecValue" />
    </node>
    <node concept="1TJgyi" id="6LPMcPcmvOf" role="1TKVEl">
      <property role="TrG5h" value="value" />
      <property role="IQ2nx" value="3857521133551189989" />
      <ref role="AX2Wp" to="tpck:fKAOsGN" resolve="string" />
      <node concept="2DM1AW" id="6LPMcPcmvOg" role="lGtFl">
        <property role="2DM1AS" value="io_lionweb_Properties-DecValue-value" />
      </node>
    </node>
  </node>
  <node concept="1TIwiD" id="6LPMcPcmvOh">
    <property role="R5$K7" value="false" />
    <property role="TrG5h" value="IntValue" />
    <property role="EcuMT" value="-5251757909129240856" />
    <ref role="1TJDcQ" node="6LPMcPcmvO7" resolve="Value" />
    <node concept="2DM1AW" id="6LPMcPcmvOi" role="lGtFl">
      <property role="2DM1AS" value="io_lionweb_Properties-IntValue" />
    </node>
    <node concept="1TJgyi" id="6LPMcPcmvOj" role="1TKVEl">
      <property role="TrG5h" value="value" />
      <property role="IQ2nx" value="-1164810965792278352" />
      <ref role="AX2Wp" to="tpck:fKAOsGN" resolve="string" />
      <node concept="2DM1AW" id="6LPMcPcmvOk" role="lGtFl">
        <property role="2DM1AS" value="io_lionweb_Properties-IntValue-value" />
      </node>
    </node>
  </node>
  <node concept="1TIwiD" id="6LPMcPcmvOl">
    <property role="R5$K7" value="false" />
    <property role="TrG5h" value="StringValue" />
    <property role="EcuMT" value="-8119058232078444791" />
    <ref role="1TJDcQ" node="6LPMcPcmvO7" resolve="Value" />
    <node concept="2DM1AW" id="6LPMcPcmvOm" role="lGtFl">
      <property role="2DM1AS" value="io_lionweb_Properties-StringValue" />
    </node>
    <node concept="1TJgyi" id="6LPMcPcmvOn" role="1TKVEl">
      <property role="TrG5h" value="value" />
      <property role="IQ2nx" value="-5457643573714526488" />
      <ref role="AX2Wp" to="tpck:fKAOsGN" resolve="string" />
      <node concept="2DM1AW" id="6LPMcPcmvOo" role="lGtFl">
        <property role="2DM1AS" value="io_lionweb_Properties-StringValue-value" />
      </node>
    </node>
  </node>
</model>

