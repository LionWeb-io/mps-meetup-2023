import { FreUtils } from "@freon4dsl/core";
import type { FreEnvironment } from "@freon4dsl/core";
import { LanguageInitializer } from "../language/LanguageInitializer";
import type { IServerCommunication } from "../server/IServerCommunication";
import { LionwebIdProvider } from "../server/LionwebIdProvider";
import { ServerCommunication } from "../server/ServerCommunication";
import {LionWebCommunication} from "../server/LionWebCommunication";


/**
 * The one and only reference to the actual language for which this editor runs
 */
import { SimpleformsEnvironment } from "../../picode/config/gen/SimpleformsEnvironment";
export const editorEnvironment: FreEnvironment = SimpleformsEnvironment.getInstance();
LanguageInitializer.initialize();

/**
 * The one and only reference to the server on which the models are stored
 */
export const serverCommunication: IServerCommunication = LionWebCommunication.getInstance();
export const idProvider = new LionwebIdProvider();
FreUtils.nodeIdProvider = idProvider;


// export const serverCommunication: IServerCommunication = ServerCommunication.getInstance();
// export const serverCommunication: IServerCommunication = MpsServerCommunication.getInstance();
