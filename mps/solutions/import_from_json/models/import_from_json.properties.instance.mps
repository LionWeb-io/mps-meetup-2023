<?xml version="1.0" encoding="UTF-8"?>
<model ref="r:5dda8fb0-8c78-4ed5-8c46-0eb8c112a60a(import_from_json.properties.instance)">
  <persistence version="9" />
  <attribute name="doNotGenerate" value="true" />
  <languages>
    <use id="28832bdf-0e25-363c-b286-c7457d9f9c90" name="io.lionweb.PROPS" version="1" />
  </languages>
  <imports />
  <registry>
    <language id="ceab5195-25ea-4f22-9b92-103b95ca8c0c" name="jetbrains.mps.lang.core">
      <concept id="1169194658468" name="jetbrains.mps.lang.core.structure.INamedConcept" flags="ng" index="TrEIO">
        <property id="1169194664001" name="name" index="TrG5h" />
      </concept>
    </language>
    <language id="28832bdf-0e25-363c-b286-c7457d9f9c90" name="io.lionweb.PROPS">
      <concept id="-5251757909129240856" name="io.lionweb.PROPS.structure.IntValue" flags="ng" index="37HND">
        <property id="-1164810965792278352" name="value" index="3QFnCD" />
      </concept>
      <concept id="3610585688048632058" name="io.lionweb.PROPS.structure.BooleanValue" flags="ng" index="259e1R">
        <property id="7452053177660046254" name="value" index="22P7_f" />
      </concept>
      <concept id="9045300450722131192" name="io.lionweb.PROPS.structure.Property" flags="ng" index="26vB0H">
        <child id="-4949124439403577779" name="value" index="3Vt1f6" />
      </concept>
      <concept id="4516078350026690430" name="io.lionweb.PROPS.structure.PropertiesFile" flags="ng" index="Tw1CF">
        <child id="-3883340165466824873" name="props" index="1Pj4nA" />
      </concept>
      <concept id="-8119058232078444791" name="io.lionweb.PROPS.structure.StringValue" flags="ng" index="1T4Ty4">
        <property id="-5457643573714526488" name="value" index="1ijX3X" />
      </concept>
    </language>
  </registry>
  <node concept="Tw1CF" id="~file_examples\example1-props_root">
    <property role="TrG5h" value="PropertyRoot" />
    <node concept="26vB0H" id="~file_examples\example1-props_root_props_0" role="1Pj4nA">
      <property role="TrG5h" value="integerProp" />
      <node concept="37HND" id="~file_examples\example1-props_root_props_0_value" role="3Vt1f6">
        <property role="3QFnCD" value="1" />
      </node>
    </node>
    <node concept="26vB0H" id="~file_examples\example1-props_root_props_1" role="1Pj4nA">
      <property role="TrG5h" value="LIonWeb_integrates" />
      <node concept="259e1R" id="~file_examples\example1-props_root_props_1_value" role="3Vt1f6">
        <property role="22P7_f" value="true" />
      </node>
    </node>
    <node concept="26vB0H" id="~file_examples\example1-props_root_props_2" role="1Pj4nA">
      <property role="TrG5h" value="myString" />
      <node concept="1T4Ty4" id="~file_examples\example1-props_root_props_2_value" role="3Vt1f6">
        <property role="1ijX3X" value="Hello, Kotlin, MPS, Ecore, Xtend, and Freon!" />
      </node>
    </node>
    <node concept="26vB0H" id="~ID-301" role="1Pj4nA">
      <property role="TrG5h" value="my great prop" />
      <node concept="259e1R" id="~ID-302" role="3Vt1f6">
        <property role="22P7_f" value="true" />
      </node>
    </node>
  </node>
</model>

