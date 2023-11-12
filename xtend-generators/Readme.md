# Xtend Generators

All subprojects use Xtend to generate the same simple HTML form based on a PROPS model.
The process the model by different means.

## emf-generator
Uses the PROPS Ecore model (and corresponding Java classes) from `properties-emf` project, and _lionweb-java-emf_ to convert the LionWeb PROPS instance to EMF.

## emf-reflective-generator
Uses _lionweb-java-emf_ to convert the LionWeb PROPS instance to EMF, and processes it via EMF reflection.

## kotlin-generator
Uses the PROPS Kotlin classes from `properties-parser`, and _lionweb-java_ to read the LionWeb PROPS instance.

## lionweb-reflective-generator
Uses _lionweb-java_ to read the LionWeb PROPS instance, and processes it via LionWeb reflection.