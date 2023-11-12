# Properties JSON

Provides a _lionweb-java_ representation of the PROPS language, and a loader to access PROPS language and instance. All other projects rely on this loader.

By default, the loader retrieves both the LionWeb PROPS language and a PROPS model instance directly from a locally running MPS instance.
We can add `-DPROPS_LOAD_FROM_FILE` to the commands in all other subprojects (except `freon`).
Then the loader retrieves the LionWEb PROPS language from `property-demo/properties-json/src/main/resources/PROPS.lmm.json`, and the model instance from `example1-exported.lm.json` in the same directory.
