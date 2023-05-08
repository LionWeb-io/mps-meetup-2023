# Playbook for LIonWeb Demo at MPS Meetup 2023

1. Show properties file
   * `properties-parser\examples\example1.props`

2. Generate metamodels
   ```shell
   java -jar properties-parser/build/libs/properties-parser-all.jar metamodel -c -o properties-parser/examples/combined.lmm.json
   ```
   
3. Show metamodels
   * `metamodel-combined.lmm.json`
   
4. Parse properties file
   ```shell
   java -jar properties-parser/build/libs/properties-parser-all.jar parse properties-parser/examples/example1.props
   ```

5. Show parsed properties file
   * `properties-parser\examples\example1.lm.json`
   
6. Import metamodel to MPS
   * "1. Import Combined Metamodel from JSON"
   * http://127.0.0.1:63320/node?ref=r%3A2fb5f9f1-691e-4329-a1d7-31829ab577d6%28import_from_json.properties%29%2F5681038226035510444
   * Show message log

7. Show imported M3s
   * "com.strumenta.StarLasu"
   * "io.lionweb.Properties"

8. Refresh references to generated M3s
   * http://127.0.0.1:63320/node?ref=r%3A2fb5f9f1-691e-4329-a1d7-31829ab577d6%28import_from_json.properties%29%2F1340349742588617894

9. Convert to MPS languages
   * "2. Convert Properties M3 to MPS"
   * http://127.0.0.1:63320/node?ref=r%3A2fb5f9f1-691e-4329-a1d7-31829ab577d6%28import_from_json.properties%29%2F1340349742588617894
   * Show message log
   
10. Generate imported languages

11. Import example instance
    * "3. Import Properties Instance from JSON"
	* http://127.0.0.1:63320/node?ref=r%3A2fb5f9f1-691e-4329-a1d7-31829ab577d6%28import_from_json.properties%29%2F4358543712231306949
    * Show message log

12. Open example

13. Add language dependency

14. Explain missing root node flag

15. Fix root flag 
    * Open concept `PropertiesFile`
    * Set `instance can be root: true`
    * Rebuild language

16. Move example model to `instances` model
    * easier to handle for next step

17. Open Freon
    * http://localhost:5000/
    * Select model

18. Show same content

19. Change some values

20. Change projection
    * Unselect _View | property_like_file_
    * Select _Apply changes_

21. Prove same model
    * Change some values

22. Store back to MPS
    * Select _File | Save Current Unit_

23. Show changed example in MPS

24. Export example instance
	* "4. Export Properties Instance to JSON"
	* http://127.0.0.1:63320/node?ref=r%3A2fb5f9f1-691e-4329-a1d7-31829ab577d6%28import_from_json.properties%29%2F5929340546362144977
    * Show message log

25. Unparse example instance
    ```shell
    java -jar properties-parser/build/libs/properties-parser-all.jar codegen properties-parser/examples/example1-exported.lm.json
	```

26. Show unparsed example
    * `properties-parser/examples/example1-exported.lm.props`
