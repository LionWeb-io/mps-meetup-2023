<?xml version="1.0" encoding="UTF-8"?>
<model ref="r:2fb5f9f1-691e-4329-a1d7-31829ab577d6(import_from_json.properties)">
  <persistence version="9" />
  <attribute name="doNotGenerate" value="false" />
  <languages>
    <use id="97ef2b8d-23e1-433e-8d23-48f916dd314d" name="io.lionweb.mps.converter.lang" version="0" />
    <use id="01cf0d82-8d29-4fc4-be96-28abaf4ad33d" name="io.lionweb.mps.m3" version="0" />
  </languages>
  <imports />
  <registry>
    <language id="01cf0d82-8d29-4fc4-be96-28abaf4ad33d" name="io.lionweb.mps.m3">
      <concept id="2656571587264871634" name="io.lionweb.mps.m3.structure.LanguageReference" flags="ng" index="2RzRkq">
        <reference id="2656571587264871635" name="language" index="2RzRkr" />
      </concept>
    </language>
    <language id="97ef2b8d-23e1-433e-8d23-48f916dd314d" name="io.lionweb.mps.converter.lang">
      <concept id="3631234780355719700" name="io.lionweb.mps.converter.lang.structure.NodeRef" flags="ng" index="pgsVv">
        <reference id="3631234780355720143" name="target" index="pgsW4" />
      </concept>
      <concept id="3631234780355716573" name="io.lionweb.mps.converter.lang.structure.ExportInstanceToJson" flags="ng" index="pgt$m">
        <property id="3631234780355961878" name="scope" index="pjpzt" />
        <child id="3631234780355719074" name="instances" index="pgtdD" />
      </concept>
      <concept id="8551466651976017244" name="io.lionweb.mps.converter.lang.structure.IMetamodelReferenceContainer" flags="ng" index="2P3sN0">
        <child id="755186209566487256" name="metamodels" index="1a0gs3" />
      </concept>
      <concept id="5028875375328515023" name="io.lionweb.mps.converter.lang.structure.ImportInstanceFromJson" flags="ng" index="VS7hd" />
      <concept id="5028875375328515028" name="io.lionweb.mps.converter.lang.structure.APathConverter" flags="ng" index="VS7hm">
        <property id="5028875375328515031" name="path" index="VS7hl" />
      </concept>
      <concept id="755186209566485507" name="io.lionweb.mps.converter.lang.structure.ConvertLanguageFromLionCore" flags="ng" index="1a0hBo" />
      <concept id="630989536496859751" name="io.lionweb.mps.converter.lang.structure.ImportLanguageFromJson" flags="ng" index="3z8Sf4" />
    </language>
    <language id="ceab5195-25ea-4f22-9b92-103b95ca8c0c" name="jetbrains.mps.lang.core">
      <concept id="1133920641626" name="jetbrains.mps.lang.core.structure.BaseConcept" flags="ng" index="2VYdi">
        <property id="1193676396447" name="virtualPackage" index="3GE5qa" />
      </concept>
      <concept id="1169194658468" name="jetbrains.mps.lang.core.structure.INamedConcept" flags="ng" index="TrEIO">
        <property id="1169194664001" name="name" index="TrG5h" />
      </concept>
    </language>
  </registry>
  <node concept="3z8Sf4" id="41GYAKu44_J">
    <property role="TrG5h" value="1b. Import Properties Metamodel from JSON" />
    <property role="VS7hl" value="${lionweb.mpsmeetup2023.home}/properties-parser/examples/properties.lmm.json" />
    <property role="3GE5qa" value="converter" />
  </node>
  <node concept="3z8Sf4" id="4Vn6yFagKMG">
    <property role="TrG5h" value="1. Import Combined Metamodel from JSON" />
    <property role="VS7hl" value="${lionweb.mpsmeetup2023.home}/properties-parser/examples/combined.lmm.json" />
    <property role="3GE5qa" value="converter" />
  </node>
  <node concept="1a0hBo" id="1apSfP9LYiA">
    <property role="TrG5h" value="2. Convert Properties M3 to MPS" />
    <property role="3GE5qa" value="converter" />
    <node concept="2RzRkq" id="1apSfP9LYiH" role="1a0gs3">
      <ref role="2RzRkr" node="7ReUsn7GpJ8" resolve="com.strumenta.StarLasu" />
    </node>
    <node concept="2RzRkq" id="1apSfP9LYiD" role="1a0gs3">
      <ref role="2RzRkr" node="7ReUsn7GpJg" resolve="io.lionweb.Properties" />
    </node>
  </node>
  <node concept="VS7hd" id="3LWE6BDzNr5">
    <property role="TrG5h" value="3. Import Properties Instance from JSON" />
    <property role="VS7hl" value="${lionweb.mpsmeetup2023.home}/properties-parser/examples/example1.lm.json" />
    <property role="3GE5qa" value="converter" />
  </node>
  <node concept="3z8Sf4" id="7ReUsn7GpJ7">
    <property role="TrG5h" value="1a. Import StarLasu Metamodel from JSON" />
    <property role="VS7hl" value="${lionweb.mpsmeetup2023.home}/properties-parser/examples/starlasu.lmm.json" />
    <property role="3GE5qa" value="converter" />
  </node>
  <node concept="pgt$m" id="599fWZqf7zh">
    <property role="3GE5qa" value="converter" />
    <property role="TrG5h" value="4. Export Properties Instance to JSON" />
    <property role="VS7hl" value="${lionweb.mpsmeetup2023.home}/properties-parser/examples/example1-exported.lm.json" />
    <property role="pjpzt" value="39$JcGFainl/descendants" />
    <node concept="pgsVv" id="599fWZqf7zi" role="pgtdD">
      <ref role="pgsW4" node="~file_properties-parser-examples-example1-props-" />
    </node>
  </node>
</model>

