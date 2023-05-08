# MPS Project for MPS Meetup 2023 LIonWeb Demo

Uses MPS version 2021.1.4

## Setup

Needs _Path Variable_ `lionweb.mpsmeetup2023.home`, pointing to the root of this git repo.

Depends on [lioncore-mps, branch mps2021.1](https://github.com/LIonWeb-org/lioncore-mps/tree/mps2021.1).

Run

```
./gradlew setup
```

to download dependencies.

## HTTP API
Open project `mps-meetup-2023/mps` in MPS 2021.1 and go to 
http://localhost:63342/lionweb/bulk?modelRef=r:5dda8fb0-8c78-4ed5-8c46-0eb8c112a60a(import_from_json.properties.instance)&project=mps-meetup-2023
in your web browser. It serves the model `import_from_json.properties.instance` as LIonWeb JSON.

http://localhost:63342/lionweb/language?moduleRef=479c7a8c-02f9-43b5-9139-d910cb22f298(jetbrains.mps.core.xml) 
returns the MPS language `jetbrains.mps.core.xml` as LIonCore metamodel.

