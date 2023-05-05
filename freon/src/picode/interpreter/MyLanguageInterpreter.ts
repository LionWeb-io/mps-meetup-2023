// Generated my Freon once, will NEVER be overwritten.
        import { InterpreterContext, IMainInterpreter, RtObject } from "@freon4dsl/core";
        import { MyLanguageInterpreterBase } from "./gen/MyLanguageInterpreterBase";
        
        let main: IMainInterpreter;
        
        /**
         * The class containing all interpreter functions twritten by thge language engineer. 
         * This class is initially empty,  and will not be overwritten if it already exists..
         */
        export class MyLanguageInterpreter extends MyLanguageInterpreterBase {
        
            constructor(m: IMainInterpreter) {
                super();
                main = m;
            }
        }
        