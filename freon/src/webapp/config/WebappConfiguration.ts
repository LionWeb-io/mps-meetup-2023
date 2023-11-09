import type { FreEnvironment, IServerCommunication } from "@freon4dsl/core";
import { PropertiesEnvironment } from "../../picode/config/gen/PropertiesEnvironment";
import { LanguageInitializer } from "../language/LanguageInitializer";
import { FreUtils, LionWebCommunication, LionwebIdProvider, LocalLionwebIdProvider, ServerCommunication } from "@freon4dsl/core";

/**
 * The one and only reference to the server on which the models are stored
 */
export const serverCommunication: IServerCommunication = ServerCommunication.getInstance();
// export const serverCommunication: IServerCommunication = MpsServerCommunication.getInstance();
/**
 * The one and only reference to the actual language for which this editor runs
 */
export const editorEnvironment: FreEnvironment = PropertiesEnvironment.getInstance();
LanguageInitializer.initialize();

export const idProvider = new LocalLionwebIdProvider();
FreUtils.nodeIdProvider = idProvider;
