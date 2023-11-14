# Properties EMF

Provides processing code and setup to convert a LionWeb language to Ecore, including the generated Java code.

## Usage

1. Open a shell / command window in this directory `property-demo` (i.e. where you cloned https://github.com/LionWeb-io/property-demo)

2. Open project `property-demo/mps` in MPS 2021.1

3. Generate Ecore model for PROPS language
   ```shell
   ./gradlew properties-emf:run
   ```
   This creates the files `property-demo/properties-emf/src-gen/model/PROPS.ecore` and `PROPS.genmodel` in the same directory.

4. Generate Java code for PROPS language
   ```shell
   ./gradlew properties-emf:generateXtext
   ```
   This creates Java code at `property-demo/properties-emf/src-gen/java/`.

### Alternative without MPS
By default, we load the LionWeb PROPS language definition live from MPS.
We can skip MPS (and thus step 2 above), and use an additional parameter in step 3:

```shell
./gradlew properties-emf:run -DPROPS_LOAD_FROM_FILE
```
