<?xml version="1.0" encoding="UTF-8"?>
<model ref="r:2fb5f9f1-691e-4329-a1d7-31829ab577d6(import_from_json.properties)">
  <persistence version="9" />
  <languages>
    <use id="97ef2b8d-23e1-433e-8d23-48f916dd314d" name="io.lionweb.mps.converter.lang" version="0" />
  </languages>
  <imports />
  <registry>
    <language id="97ef2b8d-23e1-433e-8d23-48f916dd314d" name="io.lionweb.mps.converter.lang">
      <concept id="630989536496859751" name="io.lionweb.mps.converter.lang.structure.ImportLanguageFromJson" flags="ng" index="3z8Sf4">
        <property id="630989536496861420" name="path" index="3z8Z_f" />
      </concept>
    </language>
    <language id="ceab5195-25ea-4f22-9b92-103b95ca8c0c" name="jetbrains.mps.lang.core">
      <concept id="1169194658468" name="jetbrains.mps.lang.core.structure.INamedConcept" flags="ng" index="TrEIO">
        <property id="1169194664001" name="name" index="TrG5h" />
      </concept>
    </language>
  </registry>
  <node concept="3z8Sf4" id="41GYAKu44_J">
    <property role="TrG5h" value="Import Properties Metamodel from JSON" />
    <property role="3z8Z_f" value="${lionweb.mpsmeetup2023.home}/properties.lmm.json" />
  </node>
</model>

