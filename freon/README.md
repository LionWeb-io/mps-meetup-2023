# Freon Example Application

Uses [Freon](https://www.freon4dsl.dev/), based on [Freon template](https://github.com/freon4dsl/Freon-template) with adjustments for LIonWeb.

## Setup

We're using an unreleased development snapshot of Freon. Thus, we have to clone the sources:
   ```shell
   cd ..
   git clone -b lionweb https://github.com/freon4dsl/Freon4dsl.git
   ```

Then build Freon source
   ```shell
   cd Freon4dsl
   yarn build-release --no-bail 
   ```

And adjust references to development snapshot:
   In file
   ```
   mps-meetup-2023/freon/package.json
   ```
   make sure these relative paths fit your system.
   They must refer to the development snapshot of Freon we cloned before.
   ```json
   "dependencies": {
     "@freon4dsl/core": "file:./../../../Freon4dsl/packages/core",
     "@freon4dsl/core-svelte": "file:./../../../Freon4dsl/packages/core-svelte",
     "@freon4dsl/meta": "file:./../../../Freon4dsl/packages/meta",
     "@freon4dsl/server": "file:./../../../Freon4dsl/packages/server",
   ```

Now we're ready to build and start the Freon example application:
   ```shell
   cd ..
   cd mps-meetup-2023
   cd freon
   yarn install
   yarn generate
   yarn prepare-app
   yarn dev
   ```

We need MPS to run, as it serves the model. Refer to <a href="../Readme.md">../Readme.md</a> for details.

Finally, open your web browser on http://localhost:5000/
